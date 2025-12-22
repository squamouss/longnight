local difficulty_calculator = require("rules.difficulty_calculator")
local firewall_calculator = require("rules.firewall_calculator")
local petvalue_calculator = require("rules.petvalue_calculator")
local maxage_calculator = require("rules.maxage_calculator")
local buildingdestroyer_calculator = require("rules.buildingdestroyer_calculator") 
local name_resolver = require("rules.name_resolver")
local rating_token_rules = require("rules.rating_token_rules")
local megabeast_calculator = require("rules.megabeast_calculator")
local avatar_sphere_rules = require("rules.avatar_sphere_rules") 
local existential_variant_rules = require("rules.existential_variant_rules")
local natural_skills_calculator = require("rules.natural_skill_calculator")
local population_calculator = require("rules.population_calculator") 
local frequency_calculator = require("rules.frequency_calculator")
local cluster_calculator = require("rules.cluster_calculator")
local gait_calculator = require("rules.gait_calculator")

local status_att, attribute_calculator = pcall(require, "rules.attribute_calculator")

-- [[ GLOBAL FINGERPRINT REGISTRY ]] --
if not _G.global_creature_fingerprints then
    _G.global_creature_fingerprints = {}
end

local function deep_copy(original)
    if not original then return nil end
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            v = deep_copy(v)
        end
        copy[k] = v
    end
    return copy
end

local function split_to_lines(current_lines_table, raw_block)
    if not raw_block then return current_lines_table end
    
    local content_type = type(raw_block)
    if content_type == 'string' then
        for line in raw_block:gmatch("[^\r\n]+") do
            if line:match("%S") then 
                table.insert(current_lines_table, line)
            end
        end
    elseif content_type == 'table' then
        for _, line in ipairs(raw_block) do
            if type(line) == 'string' and line:match("%S") then
                 table.insert(current_lines_table, line)
            end
        end
    end
    return current_lines_table
end

local function table_contains(tbl, val)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end

local function pick_random(tbl)
    if not tbl or #tbl == 0 then return nil end
    local total_weight = 0
    for _, item in ipairs(tbl) do
        total_weight = total_weight + (item.weight or 1)
    end
    if total_weight == 0 then return nil end
    
    local rand_func = _G.trandom or math.random
    local random_point = rand_func(total_weight)
    if not _G.trandom then random_point = random_point -1 end

    local current_weight = 0
    for _, item in ipairs(tbl) do
        current_weight = current_weight + (item.weight or 1)
        if random_point < current_weight then
            return item
        end
    end
    return nil
end

local function generate_numeric_code(num_digits)
    local code = ""
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    for i = 1, num_digits do
        code = code .. rand_func(10)
    end
    return code
end

local function filter_components_by_tags(component_list, rating_tags, size_tags, valid_sub_archetypes)
    local filtered_list = {}

    for _, component in ipairs(component_list) do
        -- Sub-Archetype Filtering
        local archetype_ok = true
        if valid_sub_archetypes and #valid_sub_archetypes > 0 then
            if component.sub_archetype and #component.sub_archetype > 0 then
                local match_found = false
                for _, comp_arch in ipairs(component.sub_archetype) do
                    if table_contains(valid_sub_archetypes, comp_arch) then
                        match_found = true
                        break
                    end
                end
                if not match_found then
                    archetype_ok = false
                end
            end
        end

        if archetype_ok then
            local rating_ok = true
            if component.eligible_rating_tags and #component.eligible_rating_tags > 0 then
                rating_ok = false
                for _, req_tag in ipairs(component.eligible_rating_tags) do
                    if table_contains(rating_tags, req_tag) then
                        rating_ok = true
                        break
                    end
                end
            end

            if rating_ok then
                local size_ok = true
                if component.eligible_size_tags and #component.eligible_size_tags > 0 and size_tags and #size_tags > 0 then
                    size_ok = false
                    for _, req_tag in ipairs(component.eligible_size_tags) do
                        if table_contains(size_tags, req_tag) then
                            size_ok = true
                            break
                        end
                    end
                end

                if size_ok then
                    table.insert(filtered_list, component)
                end
            end
        end
    end

    return filtered_list
end

local function pick_weighted_random_multiplier(distribution_weights)
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    if not distribution_weights then return rand_func(9) + 1 end
    local total_weight = 0
    for _, weight in pairs(distribution_weights) do total_weight = total_weight + weight end
    if total_weight == 0 then return rand_func(9) + 1 end
    local random_point = rand_func(total_weight)
    local current_weight_sum = 0
    for multiplier = 1, 9 do
        current_weight_sum = current_weight_sum + (distribution_weights[multiplier] or 0)
        if random_point < current_weight_sum then return multiplier end
    end
    return rand_func(9) + 1
end

local function assign_unique_ids(tbl, prefix)
    prefix = prefix or "id"
    for i, entry in ipairs(tbl) do entry.id = prefix .. "_" .. i end
end

local function assign_all_component_ids(config)
    if config._ids_assigned then return end
    
    assign_unique_ids(config.interaction_rating, "rating")
    assign_unique_ids(config.generic_body_size_variants, "size_variant")
    if config.non_sophont_caste_groups then
        assign_unique_ids(config.non_sophont_caste_groups, "caste_group")
    end
    for _, component_config in ipairs(config.COMPONENT_TABLES) do
        assign_unique_ids(config[component_config.table_key], component_config.name)
    end
    if config.flowchart_data then
        for key, flowchart_table in pairs(config.flowchart_data) do
            assign_unique_ids(flowchart_table, key)
        end
    end
    config._ids_assigned = true
end
-- #endregion

-- #region Core Generation Logic

local function get_caste_specific_value(component, base_key, caste_type)
    if not component then return nil end
    local primary_key = caste_type .. "_" .. base_key
    local fallback_key = "mundane_" .. base_key

    if caste_type == "core" then
        return component[primary_key] or component[fallback_key] or component[base_key]
    elseif caste_type == "mundane" then
        return component[primary_key] or component[base_key]
    elseif caste_type == "transcendent" then
        local transcendent_key = "transcendent_" .. base_key
        return component[transcendent_key] or component[base_key]
    else 
        return component[base_key]
    end
end

local function process_flowchart_tables(config, components, tables_to_process, parent_component)
    if not tables_to_process or #tables_to_process == 0 then
        return true
    end

    for _, table_name in ipairs(tables_to_process) do
        local flowchart_table = config.flowchart_data and config.flowchart_data[table_name]
        if flowchart_table then
            local compatible_options = filter_components_by_tags(flowchart_table, components.rating.tags, components.size_variant.size_tags or {}, components.sub_archetypes)
            local chosen_flowchart_entry = deep_copy(pick_random(compatible_options))

            if not chosen_flowchart_entry then
                return false
            end
            
            if not parent_component.flowchart_selections then
                parent_component.flowchart_selections = {}
            end
            table.insert(parent_component.flowchart_selections, chosen_flowchart_entry)

            if chosen_flowchart_entry.next_tables and #chosen_flowchart_entry.next_tables > 0 then
                local success = process_flowchart_tables(config, components, chosen_flowchart_entry.next_tables, chosen_flowchart_entry)
                if not success then return false end
            end
        else
            print("Error: Flowchart table not found in config.flowchart_data: " .. table_name)
            return false
        end
    end
    return true
end

local function generate_creature_fingerprint(config, components)
    local hash_parts = {}
    for _, component_config in ipairs(config.COMPONENT_TABLES) do
        if component_config.use_for_fingerprint == nil or component_config.use_for_fingerprint == true then
            local main_comp = components[component_config.name]
            if main_comp and main_comp.id then
                table.insert(hash_parts, main_comp.id)
            end
            local function add_flowchart_hashes(parent_comp)
                if parent_comp and parent_comp.flowchart_selections then
                    for _, selection in ipairs(parent_comp.flowchart_selections) do
                        table.insert(hash_parts, selection.id or ("fc_"..tostring(selection.desc_part)))
                        add_flowchart_hashes(selection)
                    end
                end
            end
            add_flowchart_hashes(main_comp)
        end
    end
    if components.rating and components.rating.id then
        table.insert(hash_parts, components.rating.id)
    end
    if components.size_variant and components.size_variant.id then
        table.insert(hash_parts, components.size_variant.id)
    end
    return table.concat(hash_parts, "::")
end

local function select_random_creature_components(config, preferred_ratings_pool, valid_sub_archetypes, forced_size_tag)
    local components = { creature_tags = {}, sub_archetypes = valid_sub_archetypes }
    
    local enabled_ratings = {}
    if not preferred_ratings_pool then
        for _, rating in ipairs(config.interaction_rating) do
            if rating.enabled then table.insert(enabled_ratings, rating) end
        end
        preferred_ratings_pool = enabled_ratings
    end

    components.rating = deep_copy(pick_random(preferred_ratings_pool))
    if not components.rating then return false, nil end
    for _, tag in ipairs(components.rating.tags) do table.insert(components.creature_tags, tag) end

    local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, components.rating.tags, {}, valid_sub_archetypes)
    
    if forced_size_tag then
        if type(forced_size_tag) == "string" and forced_size_tag:lower() == "any" then
             -- Do nothing, keep compatible_sizes as is.
        else
            local specific_size_pool = {}
            for _, sz in ipairs(compatible_sizes) do
                local match = false
                if type(forced_size_tag) == "table" then
                    for _, tag in ipairs(forced_size_tag) do
                        if sz.size_tags and table_contains(sz.size_tags, tag) then
                            match = true
                            break
                        end
                    end
                else
                    if sz.size_tags and table_contains(sz.size_tags, forced_size_tag) then
                        match = true
                    end
                end
                if match then
                    table.insert(specific_size_pool, sz)
                end
            end
            if #specific_size_pool > 0 then
                compatible_sizes = specific_size_pool
            end
        end
    end

    components.size_variant = deep_copy(pick_random(compatible_sizes))
    if not components.size_variant then 
        return false, nil 
    end
    
    components.size_variant.tags = components.size_variant.size_tags 

    local current_size_tags = components.size_variant.size_tags or {}
    for _, tag in ipairs(current_size_tags) do table.insert(components.creature_tags, tag) end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local compatible_addons = filter_components_by_tags(config[conf.table_key], components.rating.tags, current_size_tags, valid_sub_archetypes)
        local chosen_component = deep_copy(pick_random(compatible_addons))
        if not chosen_component then return false, nil end
        
        components[conf.name] = chosen_component
        if chosen_component.tags then
            for _, tag in ipairs(chosen_component.tags) do table.insert(components.creature_tags, tag) end
        end

        if chosen_component.next_tables and #chosen_component.next_tables > 0 then
            local flowchart_success = process_flowchart_tables(config, components, chosen_component.next_tables, chosen_component)
            if not flowchart_success then
                return false, nil
            end
        end
    end
    
    components.lore = pick_random(config.generic_creature_lore_snippets)
    if not components.lore then return false, nil end

    return true, components
end

local function gather_caste_toks(config, components, caste_type)
    local all_toks = {}
    local all_components_for_tokens = { components.rating, components.size_variant }
    
    local function gather_toks_recursively(component)
        if component then
            table.insert(all_components_for_tokens, component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_toks_recursively(selection)
                end
            end
        end
    end
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_toks_recursively(components[conf.name])
    end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp then
            local tok_block
            if caste_type == "non_sophont" then
                tok_block = comp.tok
            elseif caste_type == "mundane" then
                tok_block = comp.mundane_tok
            elseif caste_type == "core" then
                tok_block = comp.core_tok or comp.mundane_tok
            elseif caste_type == "transcendent" then
                tok_block = comp.transcendent_tok
            end

            if tok_block then
                split_to_lines(all_toks, tok_block)
            end
        end
    end
    return all_toks
end

local function gather_creature_level_toks(config, components)
    local all_toks = {}
    local all_components_for_tokens = { components.rating, components.size_variant }
    
    local function gather_toks_recursively(component)
        if component then
            table.insert(all_components_for_tokens, component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_toks_recursively(selection)
                end
            end
        end
    end
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_toks_recursively(components[conf.name])
    end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp and comp.tok then
            local has_caste_override = comp.mundane_tok or comp.core_tok
            if not has_caste_override then
                split_to_lines(all_toks, comp.tok)
            end
        end
    end
    return all_toks
end

local function gather_size_specific_tokens(config, components)
    local extra_toks = {}
    local current_size_tags = components.size_variant.size_tags or {}
    
    local function check_comp(comp)
        if comp and comp.size_specific_tokens then
            for tag, token_block in pairs(comp.size_specific_tokens) do
                if table_contains(current_size_tags, tag) then
                    split_to_lines(extra_toks, token_block)
                end
            end
        end
    end

    local function gather_size_toks_recursively(component)
        if component then
            check_comp(component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_size_toks_recursively(selection)
                end
            end
        end
    end

    gather_size_toks_recursively(components.rating)
    gather_size_toks_recursively(components.size_variant)

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_size_toks_recursively(components[conf.name])
    end
    
    return extra_toks
end

local function construct_body_string(config, components, caste_type)
    local body_parts = {}
    local function gather_parts_recursively(component)
        if component then
            local body_token = get_caste_specific_value(component, 'body_token', caste_type)
            if body_token then table.insert(body_parts, body_token) end
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_parts_recursively(selection)
                end
            end
        end
    end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_parts_recursively(components[conf.name])
    end
    return "[BODY:" .. table.concat(body_parts, "") .. "]"
end

local function construct_full_description(config, comps, final_mass, additional_line, include_rating_desc, caste_type)
    local parts = {}
    
    local function add_descriptions_recursively(component)
        if component then
            local desc_part = get_caste_specific_value(component, 'desc_part', caste_type)
            if desc_part then
                table.insert(parts, desc_part)
            end
        end
        if component and component.flowchart_selections then
            for _, selection in ipairs(component.flowchart_selections) do
                add_descriptions_recursively(selection)
            end
        end
    end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        add_descriptions_recursively(comps[conf.name])
    end

    if include_rating_desc and comps.rating and comps.rating.desc_part then table.insert(parts, comps.rating.desc_part) end
    if additional_line and additional_line ~= "" then table.insert(parts, additional_line) end
    if comps.lore then table.insert(parts, comps.lore) end
	
    -- Configuration for description modifiers
    local desc_injectors = {
        { mod = difficulty_calculator, func = "calculate_difficulty", fmt = "/THREAT_RANK = %s" },
        { mod = firewall_calculator, func = "get_firewall_desc_string" },
        { mod = attribute_calculator, func = "get_attribute_desc_string" },
        -- Added Gait Calculator Description Injection
        { mod = gait_calculator, func = "get_gait_description" }
    }

    -- Iterate through injectors
    for _, injector in ipairs(desc_injectors) do
        -- 1. Check if module exists (is a table) and has the function
        if type(injector.mod) == "table" and injector.mod[injector.func] then
            
            -- 2. Call the function
            local result = injector.mod[injector.func](config, comps)
            
            -- 3. Validate result
            if result then
                -- 4. Apply formatting if it exists, otherwise insert raw
                if injector.fmt then
                    table.insert(parts, string.format(injector.fmt, result))
                elseif result ~= "" then
                    table.insert(parts, result)
                end
            end
        end
    end
	
    table.insert(parts, string.format(comps.size_variant.desc_part, final_mass))
    return string.gsub(table.concat(parts, ""), "%s+$", "")
end

local utility_functions = {
    pick_random = pick_random,
    split_to_lines = split_to_lines,
    table_contains = table_contains,
    filter_components_by_tags = filter_components_by_tags,
    description_constructor = construct_full_description,
    body_string_constructor = construct_body_string,
    gather_caste_toks = gather_caste_toks
}

-- #region Main Generation Logic
local function assemble_creature_raw(config, creature_id_suffix, components, numeric_code)
    local sz = components.size_variant
    
    local distribution_to_use = sz.size_distribution_weights
    
    if sz.rating_specific_weights and components.rating and components.rating.tags and components.rating.tags[1] then
        local rating_key = components.rating.tags[1]
        if sz.rating_specific_weights[rating_key] then
            distribution_to_use = sz.rating_specific_weights[rating_key]
        end
    end
    
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    local size_multiplier = sz.favored_size_multiplier_enabled and pick_weighted_random_multiplier(distribution_to_use) or (rand_func(9) + 1)

    local default_adult_size = (sz.base_adult_size_for_random or 0) * size_multiplier
    local temp_child_size = sz.child_body_size or sz.min_raw_size_factor or 0
    local final_adult_size = sz.new_adult_size or default_adult_size
    components.final_adult_size = math.floor(final_adult_size)
    if sz.new_adult_size and default_adult_size > 0 and temp_child_size > 0 then
        components.final_child_size = math.floor(temp_child_size * (final_adult_size / default_adult_size))
    else
        components.final_child_size = temp_child_size
    end
    
    local name_mods = { sz.name_part }
    for tag, suffix in pairs(config.TRAIT_NAME_MODIFIERS) do
        if table_contains(components.creature_tags, tag) then
            table.insert(name_mods, suffix)
            break
        end
    end

    if config.experiment_context then
        table.insert(name_mods, "EX")
    end
    
    table.insert(name_mods, numeric_code)
    components.numeric_code = numeric_code
    
    local name_suffix = "-" .. table.concat(name_mods, "-")
    
    local base_singular, base_plural = name_resolver.get_base_names(config, components)
    local singular = base_singular .. name_suffix
    local plural = base_plural .. name_suffix
    
    local detected_sub_archetype = "UNKNOWN"
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local comp = components[conf.name]
        if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
            detected_sub_archetype = comp.sub_archetype[1] 
            break
        end
    end
    if detected_sub_archetype == "UNKNOWN" and components.sub_archetypes and #components.sub_archetypes > 0 then
        detected_sub_archetype = components.sub_archetypes[1]
    end

    local creature_token = ""
    if config.experiment_context and config.experiment_context.token then
        creature_token = config.experiment_context.token
    else
        local id_clean_part = "ID" 
        local token_middle = table.concat(name_mods, "_")
        creature_token = config.ARCHETYPE_CLASS:upper() .. "_" .. id_clean_part .. "_" .. token_middle:upper() .. "_" .. detected_sub_archetype:upper()
    end
    
    local lines = {}
    table.insert(lines, "[CREATURE:" .. creature_token .. "]")
    
    -- [[ VANILLA PERSISTENCE FIX ]] --
    -- This function MUST be called immediately after the ID is defined.
    -- It injects [GENERATED] and handles the internal ID linking for world history persistence.
    if _G.add_generated_info then
        _G.add_generated_info(lines)
    else
        table.insert(lines, "[GENERATED]")
    end
    -- [[ END FIX ]] --

    table.insert(lines, "[NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    table.insert(lines, "[CASTE_NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    split_to_lines(lines, config.BASE_RAWS)

    if avatar_sphere_rules then
        local sphere_tokens = avatar_sphere_rules.get_sphere_tokens(config, components)
        if sphere_tokens and #sphere_tokens > 0 then
            split_to_lines(lines, sphere_tokens)
        end
    end

    local all_caste_raw_lines = {}
    local shared_descriptor_tokens = config.generate_caste_raws(config, components, all_caste_raw_lines, components.final_adult_size, utility_functions)

    local caste_definitions = {}
    local total_castes = 0
    local is_simple_pair = false 

    for _, line in ipairs(all_caste_raw_lines) do
        local caste_token = line:match("^%s*%[CASTE:([^%]]+)%]")
        if caste_token then
            total_castes = total_castes + 1
            table.insert(caste_definitions, {
                original_line = line,
                token = caste_token,
                is_male = line:match("%[MALE%]") ~= nil,
                is_female = line:match("%[FEMALE%]") ~= nil
            })
        end
    end

    if total_castes == 2 then
        local c1 = caste_definitions[1]
        local c2 = caste_definitions[2]
        if (c1.is_male and c2.is_female) or (c1.is_female and c2.is_male) then
            if (c1.token == "MALE" and c2.token == "FEMALE") or (c1.token == "FEMALE" and c2.token == "MALE") then
                is_simple_pair = true
            end
            local c1_base = c1.token:gsub("_MALE$", ""):gsub("_FEMALE$", "")
            local c2_base = c2.token:gsub("_MALE$", ""):gsub("_FEMALE$", "")
            if c1_base == c2_base then
                 is_simple_pair = true
            end
        end
    end

    local needs_variant_naming = (total_castes > 2) or (total_castes == 2 and not is_simple_pair)
    local new_caste_names = {} 
    
    if needs_variant_naming then
        local variant_counter = 1
        local processed_lines = {} 

        for i, caste_def in ipairs(caste_definitions) do
            if not processed_lines[caste_def.original_line] then
                local variant_name = singular .. "-V" .. variant_counter
                local variant_plural = plural .. "-V" .. variant_counter
                local name_line = "[CASTE_NAME:" .. variant_name .. ":" .. variant_plural .. ":" .. variant_name .. "]"
                
                new_caste_names[caste_def.original_line] = name_line
                processed_lines[caste_def.original_line] = true
                
                local partner_token_str = nil
                if caste_def.is_male then
                    local base_name = caste_def.token:gsub("_MALE$", "")
                    if base_name ~= caste_def.token then 
                         partner_token_str = base_name .. "_FEMALE"
                    end
                elseif caste_def.is_female then
                    local base_name = caste_def.token:gsub("_FEMALE$", "")
                     if base_name ~= caste_def.token then
                        partner_token_str = base_name .. "_MALE"
                    end
                end
                
                if partner_token_str then
                    for j, partner_def in ipairs(caste_definitions) do
                        if i ~= j and partner_def.token == partner_token_str and not processed_lines[partner_def.original_line] then
                            new_caste_names[partner_def.original_line] = name_line
                            processed_lines[partner_def.original_line] = true
                            break 
                        end
                    end
                end
                
                variant_counter = variant_counter + 1
            end
        end
    end

    local reordered_caste_lines = {}
    local current_caste_block = nil

    local function flush_caste_block()
        if not current_caste_block then return end
        
        table.insert(reordered_caste_lines, current_caste_block.caste_line)
        
        local has_existing_caste_name = false
        for _, misc_line in ipairs(current_caste_block.misc) do
            if misc_line:match("^%s*%[CASTE_NAME:") then
                has_existing_caste_name = true
                break
            end
        end
        
        if needs_variant_naming and not has_existing_caste_name and new_caste_names[current_caste_block.caste_line] then
            table.insert(reordered_caste_lines, new_caste_names[current_caste_block.caste_line])
        end

        if current_caste_block.description then table.insert(reordered_caste_lines, current_caste_block.description) end

        local main_body_index = -1
        local max_colons = -1
        if #current_caste_block.body_lines > 0 then
            for i, body_line in ipairs(current_caste_block.body_lines) do
                local _, num_colons = body_line:gsub(":", "")
                if num_colons > max_colons then
                    max_colons = num_colons
                    main_body_index = i
                end
            end
            if main_body_index > 0 then
                table.insert(reordered_caste_lines, current_caste_block.body_lines[main_body_index])
                table.remove(current_caste_block.body_lines, main_body_index)
            end
        end

        for _, body_line in ipairs(current_caste_block.body_lines) do
            table.insert(reordered_caste_lines, body_line)
        end
        
        for _, misc_line in ipairs(current_caste_block.misc) do
            table.insert(reordered_caste_lines, misc_line)
        end
    end

    for _, line in ipairs(all_caste_raw_lines) do
        if line:match("^%s*%[CASTE:") then
            flush_caste_block()
            current_caste_block = { caste_line = line, misc = {}, body_lines = {} }
        elseif current_caste_block then
            if line:match("^%s*%[DESCRIPTION:") then
                current_caste_block.description = line
            elseif line:match("^%s*%[BODY:") then
                table.insert(current_caste_block.body_lines, line)
            else
                table.insert(current_caste_block.misc, line)
            end
        else
            table.insert(reordered_caste_lines, line)
        end
    end
    flush_caste_block()

    for _, line in ipairs(reordered_caste_lines) do
        table.insert(lines, line)
    end
    
    split_to_lines(lines, config.COMMON_BODY_DETAIL_RAWS)

    local creature_level_toks = gather_creature_level_toks(config, components)
    split_to_lines(lines, creature_level_toks)

    local size_specific_toks = gather_size_specific_tokens(config, components)
    split_to_lines(lines, size_specific_toks)

    -- Define a list of rules for injecting tokens.
    -- 'mod': The module object (e.g., difficulty_calculator).
    -- 'func': The name of the function to call on that module.
    -- 'use_split': (Optional) If true, uses split_to_lines(). If false/nil, uses table.insert().
    local token_injectors = {
        { mod = buildingdestroyer_calculator, func = "get_buildingdestroyer_token" },
        { mod = difficulty_calculator,        func = "get_difficulty_token" },
        { mod = population_calculator,        func = "get_population_token" },
        { mod = cluster_calculator,           func = "get_cluster_token" },
        { mod = frequency_calculator,         func = "get_frequency_token" },
        { mod = petvalue_calculator,          func = "get_petvalue_token" },
        { mod = maxage_calculator,            func = "get_maxage_token" },
        { mod = megabeast_calculator,         func = "get_megabeast_token" },
        { mod = existential_variant_rules,    func = "get_existential_token" },
        { mod = firewall_calculator,          func = "get_firewall_token" },
        
        -- These return blocks/lists, so we set use_split = true
        { mod = rating_token_rules,           func = "get_rating_tokens",        use_split = true },
        { mod = natural_skills_calculator,    func = "get_natural_skill_tokens", use_split = true },
        { mod = attribute_calculator,         func = "get_attribute_tokens",     use_split = true },
        -- Added Gait Calculator Token Injection
        { mod = gait_calculator,              func = "generate_gait_lines",      use_split = true }
    }

    -- Iterate through the rules and apply them
    for _, rule in ipairs(token_injectors) do
        -- 1. Check if the module exists and has the function
        if type(rule.mod) == "table" and rule.mod[rule.func] then
            
            -- 2. Call the function safely
            local result = rule.mod[rule.func](config, components)
            
            -- 3. Check if we got a valid result (not nil, not empty string)
            if result and result ~= "" then
                -- Special handling for lists vs single strings
                if type(result) == "table" and #result == 0 then
                    -- Skip empty tables
                elseif rule.use_split then
                    -- Use your existing split_to_lines function for blocks/lists
                    split_to_lines(lines, result)
                else
                    -- Insert directly for single strings
                    table.insert(lines, result)
                end
            end
        end
    end
    
    if config.ENABLE_SIZE_AND_CHILD_GENERATION then
        local child_years = sz.body_size_index_and_child_count
        local adult_size = components.final_adult_size
        local child_size = components.final_child_size
        if child_years and child_years > 0 then
            if child_size > 0 and child_size < adult_size then
                table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(math.floor(child_size)) .. "]")
                table.insert(lines, "[BODY_SIZE:" .. tostring(child_years) .. ":0:" .. tostring(adult_size) .. "]")
            else
                table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(adult_size) .. "]")
            end
            table.insert(lines, "[CHILD:" .. tostring(child_years) .. "]")
        else
            table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(adult_size) .. "]")
        end
    end
    
    split_to_lines(lines, config.COMMON_APPEARANCE_RAWS)
    
    if shared_descriptor_tokens then
        split_to_lines(lines, shared_descriptor_tokens)
    end
    
    return { creature=lines, id=creature_token, weight=10, is_transcendent=false, components=components }
end

local function generate_all_creatures(config)
    local log_func = _G.log or function(...) print(table.concat({...}, "\t")) end
    local log_prefix = config.ARCHETYPE_CLASS:upper() .. "_GENERATOR_LOG"
    log_func(log_prefix .. ": Initializing generation.")
    assign_all_component_ids(config)

    log_func(log_prefix .. ": Analyzing config for valid creature generation paths...")
    local valid_ratings_pool = {}
    local forced_generation_queue = {}
    
    for _, rating_option in ipairs(config.interaction_rating) do
        if rating_option.enabled then
            local is_possible = true
            
            if config.forced_rating then
                 if not table_contains(rating_option.tags, config.forced_rating) then
                     is_possible = false
                 end
            end
            
            if is_possible then
                local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, rating_option.tags, {})
                if #compatible_sizes == 0 then 
                    is_possible = false 
                end

                if is_possible then
                    for _, conf in ipairs(config.COMPONENT_TABLES) do
                        local compatible_addons = filter_components_by_tags(config[conf.table_key], rating_option.tags, {})
                        if #compatible_addons == 0 then
                            is_possible = false
                            log_func(log_prefix .. ": [LOG] ...Invalid: No compatible components in table " .. conf.name)
                            break
                        end
                    end
                end

                if is_possible then
                    table.insert(valid_ratings_pool, rating_option)
                    
                    log_func(log_prefix .. ": [LOG] ...Rating [" .. (rating_option.tags[1] or "UNKNOWN") .. "] validated and added to pool.")
                    
                    if not config.experiment_context then
                        if rating_option.minimum_number and rating_option.minimum_number > 0 then
                            for i=1, rating_option.minimum_number do
                                table.insert(forced_generation_queue, { rating = rating_option, size_tag = nil, sub_archetype = nil })
                            end
                            log_func(log_prefix .. ": [LOG] ...Enqueued " .. rating_option.minimum_number .. " standard demographic generations for rating: " .. (rating_option.tags[1] or "Unknown"))
                        end
                    end
                end
            end
        end
    end

    if #valid_ratings_pool == 0 then
        log_func(log_prefix .. ": FATAL ERROR - No valid creature types can be generated with the current configuration (filters applied). Aborting.")
        return {}
    end

    local num_to_generate
    if config.experiment_context then
        num_to_generate = 1
    else
        local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
        num_to_generate = rand_func( (config.MAX_CREATURES or 30) - (config.MIN_CREATURES or 10) + 1 ) + (config.MIN_CREATURES or 10)
    end

    if config.FORCED_GENERATION_QUEUE and not config.experiment_context then
        for _, forced_req in ipairs(config.FORCED_GENERATION_QUEUE) do
            local target_rating = nil
            for _, r in ipairs(config.interaction_rating) do
                 if r.enabled and r.tags and table_contains(r.tags, forced_req.rating) then
                    target_rating = r
                    break
                end
            end
            
            if target_rating then
                local count = forced_req.count or 1
                for i=1, count do
                    table.insert(forced_generation_queue, { rating = target_rating, size_tag = forced_req.size, sub_archetype = forced_req.sub_archetype })
                end
                num_to_generate = num_to_generate + count
                log_func(log_prefix .. ": [LOG] Added " .. count .. " FORCED " .. (forced_req.size or "ANY") .. " " .. forced_req.rating .. (forced_req.sub_archetype and (" ("..forced_req.sub_archetype..")") or "") .. " to the queue.")
            else
                log_func(log_prefix .. ": [WARNING] FORCED_GENERATION_RATING '" .. forced_req.rating .. "' not found in config.")
            end
        end
    end

    if #forced_generation_queue > num_to_generate then
        if not config.experiment_context then
             log_func(log_prefix .. ": [LOG] Increasing generation count from " .. num_to_generate .. " to " .. #forced_generation_queue .. " to satisfy minimum requirements.")
             num_to_generate = #forced_generation_queue
        end
    end
    
    local all_raw_data = {}
    local successfully_generated_count = 0
    
    local max_attempts = num_to_generate * 200
    if config.experiment_context then
        max_attempts = 10
    end

    log_func(log_prefix .. ": Starting generation of " .. num_to_generate .. " creatures.")

    local forced_entry_failures = 0

    while successfully_generated_count < num_to_generate and max_attempts > 0 do
        max_attempts = max_attempts - 1

        local current_pool = nil
        local current_sub_archetypes = config.forced_sub_archetypes
        local current_forced_size = config.forced_size 
        
        local forced_entry = nil
        if #forced_generation_queue > 0 then
            forced_entry = forced_generation_queue[1] 
            current_pool = { forced_entry.rating }
            current_forced_size = forced_entry.size_tag 
            
            if forced_entry.sub_archetype then
                current_sub_archetypes = { forced_entry.sub_archetype }
            end
        else
            current_pool = valid_ratings_pool
        end

        local selection_successful, components = select_random_creature_components(config, current_pool, current_sub_archetypes, current_forced_size)

        if selection_successful and components then
            local fingerprint = generate_creature_fingerprint(config, components)
            
            local is_unique = not _G.global_creature_fingerprints[fingerprint]
            
            if is_unique then
                _G.global_creature_fingerprints[fingerprint] = true
                
                successfully_generated_count = successfully_generated_count + 1
                local id_suffix = string.format("%03d", successfully_generated_count)
                local numeric_code = generate_numeric_code(4)
                
                local creature_data = assemble_creature_raw(config, id_suffix, components, numeric_code)
                table.insert(all_raw_data, creature_data)
                
                if forced_entry then
                    table.remove(forced_generation_queue, 1)
                    forced_entry_failures = 0 
                    
                    if not config.experiment_context then
                        max_attempts = max_attempts + 200 
                    end
                end
                
                local rating_str = (components.rating and components.rating.tags and components.rating.tags[1]) or "UNKNOWN_RATING"
                local size_str = (components.size_variant and components.size_variant.size_tags and components.size_variant.size_tags[1]) or "UNKNOWN_SIZE"
                
                local arch_str = "UNKNOWN_ARCH"
                for _, conf in ipairs(config.COMPONENT_TABLES) do
                    local comp = components[conf.name]
                    if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                        arch_str = comp.sub_archetype[1]
                        break
                    end
                end
                
                log_func(log_prefix .. ": [SUCCESS] Generated " .. size_str .. " " .. rating_str .. " (" .. arch_str .. ") - Code: " .. numeric_code)

                if config.experiment_context then break end
            else
                if config.experiment_context then
                end
            end
        else
            if forced_entry then
                forced_entry_failures = forced_entry_failures + 1
                
                if forced_entry_failures % 10 == 0 then
                     local forced_sub = forced_entry.sub_archetype and (" ("..forced_entry.sub_archetype..")") or ""
                     log_func("ENGINE_WARNING: Struggling to generate forced entry: " .. (forced_entry.rating.tags[1] or "Unk") .. " " .. (forced_entry.size_tag or "Unk") .. forced_sub .. ". Failures: " .. forced_entry_failures)
                end

                if forced_entry_failures > 50 then
                    local forced_sub = forced_entry.sub_archetype and (" ("..forced_entry.sub_archetype..")") or ""
                    log_func("ENGINE_ERROR: ABORTING forced entry due to excessive failures: " .. (forced_entry.rating.tags[1] or "Unk") .. " " .. (forced_entry.size_tag or "Unk") .. forced_sub)
                    table.remove(forced_generation_queue, 1)
                    forced_entry_failures = 0
                end
            end
        end
    end

    log_func(log_prefix .. ": Generation complete. Generated " .. #all_raw_data .. " total RAW sets.")
    return all_raw_data
end

-- #region Module Definition
local engine_module = {}

engine_module.run_generator = function(config)
    local generated_data = engine_module.generate_data_only(config)
    if generated_data and #generated_data > 0 then
        local all_lines = {}
        for _, obj in ipairs(generated_data) do
            for _, line in ipairs(obj.creature) do
                table.insert(all_lines, line)
            end
        end
        if _G.raws and _G.raws.register_creatures then
            _G.raws.register_creatures(all_lines)
        end
    end
    return generated_data or {}
end

engine_module.generate_data_only = function(config)
    local success, generated_data = pcall(generate_all_creatures, config)
    if not success then
        local log_func = _G.log or print
        log_func("ENGINE_LOG: FATAL ERROR during generate_all_creatures: " .. tostring(generated_data))
        return {}
    end
    return generated_data or {}
end

-- #endregion

-- #region Standalone Execution Block
if arg and arg[1] then
    local function add_current_dir_to_path()
        local info = debug.getinfo(1, "S")
        if info and info.source then 
            local script_path = info.source:match("@?(.*/)")
            if script_path then
                package.path = script_path .. "?.lua;" .. script_path .. "scripts/?.lua;" .. package.path
                print("ENGINE: Path Fix Applied. Root: " .. script_path) 
            end
        end
    end
    add_current_dir_to_path()

    math.randomseed(os.time())
    
    print("ENGINE: Running in STANDALONE mode.")
    local config_file_name = arg[1]:gsub("%.lua$", "")
    
    print("ENGINE: Loading config file: " .. config_file_name .. ".lua")
    local success, config = pcall(require, config_file_name)
    if not success or not config then
        print("ENGINE: FATAL ERROR - Could not load config file '" .. config_file_name .. ".lua'. " .. tostring(config))
        return
    end

    if not config.SAVE_TO_FILE_TOGGLE then
        print("ENGINE: File output is disabled in the config file. Exiting.")
        return
    end

    local generated_data = generate_all_creatures(config)

    print("ENGINE: Checking for Weaponizer...")
    
    local status_wep, weaponizer = pcall(require, "weaponizer_engine")
    local status_cfg, weapon_config = pcall(require, "config_weapons")

    if status_wep and status_cfg and weaponizer and weapon_config then
        print("ENGINE: Weaponizer found. Scanning " .. #generated_data .. " creatures for eligibility...")
        
        local weaponizer_input = {}
        for _, obj in ipairs(generated_data) do
            if obj.id and obj.components then
                local adapter_obj = {
                    id = obj.id,
                    raw_lines = obj.creature, 
                    rating_tags = obj.components.rating.tags,
                    archetypes = { config.ARCHETYPE_CLASS },
                    size_tag = (obj.components.size_variant.size_tags and obj.components.size_variant.size_tags[1]) or "MEDIUM",
                    pop_ratio = 50,
                    sub_archetypes = obj.components.sub_archetypes
                }
                weaponizer_input[obj.id] = adapter_obj
            end
        end

        local modified_count = 0
        for i, obj in ipairs(generated_data) do
             local new_raws = weaponizer.apply_weapons(obj.creature, weapon_config)
             if #new_raws > #obj.creature then
                 modified_count = modified_count + 1
             end
             obj.creature = new_raws
        end

        print("ENGINE: Weaponizer modified " .. modified_count .. " creatures.")
        
    else
        print("ENGINE: Weaponizer or config_weapons.lua not found in path. Skipping.")
        if not status_wep then print("DEBUG: Failed to load weaponizer_engine: " .. tostring(weaponizer)) end
        if not status_cfg then print("DEBUG: Failed to load config_weapons: " .. tostring(weapon_config)) end
    end

    if generated_data and #generated_data > 0 then
        local output_filename = config.OUTPUT_FILENAME or "generated_creatures.txt"
        print("ENGINE: Attempting to write " .. #generated_data .. " creature sets to '" .. output_filename .. "'...")

        local file, err = io.open(output_filename, "w")
        if not file then
            print("ENGINE: FATAL ERROR - Could not open file for writing: " .. output_filename .. " (\"" .. tostring(err) .. "\")")
            return
        end
        
        local file_header = config.ARCHETYPE_CLASS:lower() .. "_creatures"
        file:write(file_header, "\n\n")
        file:write("[OBJECT:CREATURE]", "\n\n")

        for _, creature_obj in ipairs(generated_data) do
            if creature_obj.creature then
                for _, line in ipairs(creature_obj.creature) do
                    file:write(line, "\n")
                end
                file:write("\n")
            end
        end
        
        file:close()
        print("ENGINE: Successfully wrote all data to '" .. output_filename .. "'.")
    else
        print("ENGINE: No creature data was generated. No file written.")
    end
end
-- #endregion

return engine_module