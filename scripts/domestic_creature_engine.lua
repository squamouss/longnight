-- #region Utility Functions
local difficulty_calculator = require("rules.difficulty_calculator")
local firewall_calculator = require("rules.firewall_calculator")
local petvalue_calculator = require("rules.petvalue_calculator")
local maxage_calculator = require("rules.maxage_calculator")
local buildingdestroyer_calculator = require("rules.buildingdestroyer_calculator") 
local megabeast_calculator = require("rules.megabeast_calculator")
local tradecapacity_calculator = require("rules.tradecapacity_calculator") 
local name_resolver = require("rules.name_resolver")
local rating_token_rules = require("rules.rating_token_rules")
local natural_skills_calculator = require("rules.natural_skill_calculator")
local gait_calculator = require("rules.gait_calculator")

local status_att, attribute_calculator = pcall(require, "rules.attribute_calculator")

local status_wep, weaponizer_module = pcall(require, "weaponizer_engine")
local status_conf, weapon_configs = pcall(require, "config_weapons")

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

local function create_plural_by_id(singular_name)
    local base, rest = singular_name:match("^(.-)( ID.*)$")
    if base and rest then
        return base .. "s" .. rest
    else
        return singular_name .. "s"
    end
end

local function split_to_lines(current_lines_table, raw_block)
    if not raw_block then return current_lines_table end
    
    local content_type = type(raw_block)
    if content_type == 'string' then
        for line in raw_block:gmatch("[^\r\n]+") do
            if line:match("%S") then -- Only add non-empty lines
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

local function rand_range(min_val, max_val)
    if min_val > max_val then min_val = max_val end
    if _G.trandom then
        return (_G.trandom(max_val - min_val + 1) or 0) + min_val
    else
        return math.random(min_val, max_val)
    end
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
            local rating_ok
            if not component.eligible_rating_tags or #component.eligible_rating_tags == 0 then
                rating_ok = true
            else
                rating_ok = false
                for _, req_tag in ipairs(component.eligible_rating_tags) do
                    if table_contains(rating_tags, req_tag) then
                        rating_ok = true
                        break
                    end
                end
            end

            if rating_ok then
                local size_ok
                if not component.eligible_size_tags or #component.eligible_size_tags == 0 then
                    size_ok = true
                elseif size_tags and #size_tags == 0 then
                    size_ok = true
                else
                    size_ok = false
                    if size_tags and #size_tags > 0 then
                        for _, req_tag in ipairs(component.eligible_size_tags) do
                            if table_contains(size_tags, req_tag) then
                                size_ok = true
                                break
                            end
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

local function select_random_creature_components(config, preferred_ratings_pool, valid_sub_archetypes)
    local components = { creature_tags = {}, sub_archetypes = valid_sub_archetypes }
    
    -- If no preferred pool is passed (e.g. normal generation), use all enabled ratings
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

    -- [[ MODIFIED: Pass sub-archetypes ]]
    local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, components.rating.tags, {}, valid_sub_archetypes)
    
    components.size_variant = deep_copy(pick_random(compatible_sizes))
    if not components.size_variant then return false, nil end
    
    components.size_variant.tags = components.size_variant.size_tags 

    local current_size_tags = components.size_variant.size_tags or {}
    for _, tag in ipairs(current_size_tags) do table.insert(components.creature_tags, tag) end


    for _, conf in ipairs(config.COMPONENT_TABLES) do
        -- [[ MODIFIED: Pass sub-archetypes ]]
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

-- [[ NEW FUNCTION: Gathers tokens specific to size variant from components ]]
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
-- [[ END NEW FUNCTION ]]

local utility_functions = {
    pick_random = pick_random,
    split_to_lines = split_to_lines,
    table_contains = table_contains,
    filter_components_by_tags = filter_components_by_tags,
    description_constructor = construct_full_description,
    body_string_constructor = construct_body_string,
    gather_caste_toks = gather_caste_toks
}
-- #endregion

-- #region Main Generation Logic
local function assemble_creature_raw(config, id_prefix, creature_id_suffix, components, numeric_code, civ_animal_class_tag)
    local sz = components.size_variant
    
    -- [[ MODIFIED: RATING-SPECIFIC SIZE LOGIC ]] --
    local distribution_to_use = sz.size_distribution_weights
    
    -- Check if the component size variant has specific weights for the current rating
    if sz.rating_specific_weights and components.rating and components.rating.tags and components.rating.tags[1] then
        local rating_key = components.rating.tags[1]
        if sz.rating_specific_weights[rating_key] then
            distribution_to_use = sz.rating_specific_weights[rating_key]
        end
    end
    
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    local size_multiplier = sz.favored_size_multiplier_enabled and pick_weighted_random_multiplier(distribution_to_use) or (rand_func(9) + 1)
    -- [[ END MODIFIED ]] --

    local default_adult_size = (sz.base_adult_size_for_random or 0) * size_multiplier
    local temp_child_size = sz.child_body_size or sz.min_raw_size_factor or 0
    local final_adult_size = sz.new_adult_size or default_adult_size
    components.final_adult_size = math.floor(final_adult_size)
    if sz.new_adult_size and default_adult_size > 0 and temp_child_size > 0 then
        components.final_child_size = math.floor(temp_child_size * (final_adult_size / default_adult_size))
    else
        components.final_child_size = temp_child_size
    end
    
    -- 1. BUILD THE IDENTIFIER STRING LIST
    local name_mods = { sz.name_part }
    for tag, suffix in pairs(config.TRAIT_NAME_MODIFIERS) do
        if table_contains(components.creature_tags, tag) then
            table.insert(name_mods, suffix)
            break
        end
    end
    table.insert(name_mods, numeric_code)
    components.numeric_code = numeric_code
    
    -- 2. CONSTRUCT DISPLAY NAME
    local name_suffix = "-" .. table.concat(name_mods, "-")
    
    local base_singular, base_plural = name_resolver.get_base_names(config, components)
    local singular = base_singular .. name_suffix
    local plural = base_plural .. name_suffix
    
    -- 3. DETECT SUB-ARCHETYPE (e.g. "DEVIL")
    local detected_sub_archetype = "UNKNOWN"
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local comp = components[conf.name]
        if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
            detected_sub_archetype = comp.sub_archetype[1]
            break
        end
    end
    -- Fallback
    if detected_sub_archetype == "UNKNOWN" and components.sub_archetypes and #components.sub_archetypes > 0 then
        detected_sub_archetype = components.sub_archetypes[1]
    end

    -- 4. CONSTRUCT RAW TOKEN (e.g. BIOMACHINE_DOMESTIC_MDM_SPNT_1111_DEVIL)
    -- Clean suffix, remove hyphens
    local token_middle = table.concat(name_mods, "_")
    
    local creature_token = config.ARCHETYPE_CLASS:upper() .. "_" .. id_prefix:upper() .. "_" .. token_middle:upper() .. "_" .. detected_sub_archetype:upper()
    
    local lines = {}
    table.insert(lines, "[CREATURE:" .. creature_token .. "]")
    
    -- [[ VANILLA PERSISTENCE FIX ]] --
    -- Inject [GENERATED] via the official helper to ensure world.dat persistence.
    if _G.add_generated_info then
        _G.add_generated_info(lines)
    else
        table.insert(lines, "[GENERATED]")
    end
    -- [[ END FIX ]] --

    table.insert(lines, "[NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    table.insert(lines, "[CASTE_NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    split_to_lines(lines, config.BASE_RAWS)

    if civ_animal_class_tag then
        table.insert(lines, "[CREATURE_CLASS:" .. civ_animal_class_tag .. "]")
    end
    
    local all_caste_raw_lines = {}
    assert(type(config.generate_caste_raws) == "function", "Config is missing 'generate_caste_raws' function!")
    
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
                -- CASTE DESIGNATION LOGIC: Appends -V1, -V2 etc.
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

    -- [[ NEW LOGIC CALL: Add size-specific tokens ]]
    local size_specific_toks = gather_size_specific_tokens(config, components)
    split_to_lines(lines, size_specific_toks)
    -- [[ END NEW LOGIC ]]

    -- Define a list of rules for injecting tokens.
    -- 'mod': The module object (e.g., difficulty_calculator).
    -- 'func': The name of the function to call on that module.
    -- 'use_split': (Optional) If true, uses split_to_lines(). If false/nil, uses table.insert().
    local token_injectors = {
        { mod = buildingdestroyer_calculator, func = "get_buildingdestroyer_token" },
        { mod = difficulty_calculator,        func = "get_difficulty_token" },
        { mod = petvalue_calculator,          func = "get_petvalue_token" },
        { mod = maxage_calculator,            func = "get_maxage_token" },
        { mod = megabeast_calculator,         func = "get_megabeast_token" },
        { mod = tradecapacity_calculator,     func = "get_trade_capacity_token" },
        { mod = avatar_sphere_rules,          func = "get_sphere_tokens",        use_split = true },
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
    
    -- [[ MODIFIED: Return ID so we can select it later ]]
    return { creature=lines, id=creature_token, weight=10, is_transcendent=false, components=components }
end

-- Helper to find forced themes from entity definitions
local function detect_civ_theme(civ_archetype, civ_tag)

    
    return nil
end

function generate_domestic_creatures_for_civs(generated_civs, domestic_rules)
    local log_func = _G.log or function(...) print(table.concat({...}, "\t")) end
    log_func("DOMESTIC_ENGINE_LOG: Initializing domestic creature generation.")

    if not generated_civs or #generated_civs == 0 then
        log_func("DOMESTIC_ENGINE_LOG: No civilizations were generated. Skipping domestic creature generation.")
        return
    end

    if not domestic_rules or not domestic_rules.archetype_map then
        log_func("DOMESTIC_ENGINE_LOG: domestic_rules.lua is missing or invalid. Skipping.")
        return
    end

    local all_domestic_creature_raws = {}
    local all_domestic_creature_objects = {}
    
    local domestic_creature_counter = 0
    local global_fingerprints = {} 
    
    local successful_creatures_by_config_and_rating = {}

    for _, civ_info in ipairs(generated_civs) do
        local civ_archetype = civ_info.archetype
        local civ_tag = civ_info.animal_class_tag 
        
        log_func("DOMESTIC_ENGINE_LOG: Processing civ: " .. civ_tag .. " (Archetype: " .. civ_archetype .. ")")

        -- [[ DETECT FORCED THEME ]] --
        local forced_theme = nil
        
        
        if civ_info.weapon_theme then
            forced_theme = civ_info.weapon_theme
            log_func("DOMESTIC_ENGINE_LOG: Civ " .. civ_tag .. " has forced weapon theme: " .. forced_theme)
        end
        -- [[ DETECT FORCED THEME ]]

        local potential_config_rules = domestic_rules.archetype_map[civ_archetype]
        
        if not potential_config_rules or #potential_config_rules == 0 then
            log_func("DOMESTIC_ENGINE_LOG: No domestic creature configs found for archetype: " .. civ_archetype .. ". Skipping civ.")
            goto continue_civ_loop
        end
        
        local valid_rules_for_this_civ = {}
        for _, rule in ipairs(potential_config_rules) do
            local is_valid = true
            
            if rule.required_sub_archetype then
                if rule.required_sub_archetype ~= civ_info.sub_archetype then
                    is_valid = false
                end
            end

            if is_valid then
                table.insert(valid_rules_for_this_civ, rule)
            end
        end

        if #valid_rules_for_this_civ == 0 then
            log_func("DOMESTIC_ENGINE_LOG: WARNING - No rules matched sub-archetype requirements for " .. civ_tag .. ". Reverting to full list.")
            valid_rules_for_this_civ = potential_config_rules
        end
        
        local chosen_rule = pick_random(valid_rules_for_this_civ)
        
        if not chosen_rule or not chosen_rule.config then
             log_func("DOMESTIC_ENGINE_LOG: Weighted config pick failed for archetype: " .. civ_archetype .. ". Skipping civ.")
             goto continue_civ_loop
        end

        local config = chosen_rule.config
        local rating_overrides = chosen_rule.ratings or {}
        
        local effective_sub_archetype = civ_info.sub_archetype
        
        if chosen_rule.sub_archetype_ratings and civ_info.sub_archetype and not chosen_rule.sub_archetype_ratings[civ_info.sub_archetype] then
            if chosen_rule.sub_archetype_access and chosen_rule.sub_archetype_access[civ_info.sub_archetype] then
                local access_list = chosen_rule.sub_archetype_access[civ_info.sub_archetype]
                if access_list and #access_list > 0 then
                    effective_sub_archetype = access_list[1]
                end
            end
        end

        if chosen_rule.sub_archetype_ratings and effective_sub_archetype then
             local specific_ratings = chosen_rule.sub_archetype_ratings[effective_sub_archetype]
             if specific_ratings then
                 rating_overrides = specific_ratings
                 log_func(config.ARCHETYPE_CLASS:upper() .. "_DOMESTIC_LOG: Switching to specific ratings table for sub-archetype: " .. effective_sub_archetype .. " (Founder: " .. (civ_info.sub_archetype or "None") .. ")")
             end
        end
        
        local log_prefix = config.ARCHETYPE_CLASS:upper() .. "_DOMESTIC_LOG"
        assign_all_component_ids(config) 

        log_func(log_prefix .. ": Generating creature set for civ " .. civ_tag .. " from ruleset.")

        for rating_tag, override in pairs(rating_overrides) do
            
            local target_rating = nil
            for _, rating_option in ipairs(config.interaction_rating) do
                if rating_option.tags and rating_option.tags[1] == rating_tag then
                    target_rating = rating_option
                    break
                end
            end

            if not target_rating then
                log_func(log_prefix .. ": WARNING - domestic_rules.lua requests rating '"..rating_tag.."', but it doesn't exist in config.interaction_rating. Skipping.")
                goto continue_rating_loop 
            end

            local target_sub_archetypes = nil 
            
            if chosen_rule.forced_sub_archetype then
                target_sub_archetypes = { chosen_rule.forced_sub_archetype }
                log_func(log_prefix .. ": Enforcing FORCED sub-archetype [" .. chosen_rule.forced_sub_archetype .. "] for civ " .. civ_tag)
            
            elseif chosen_rule.sub_archetype_access and civ_info.sub_archetype then
                 local allowed = chosen_rule.sub_archetype_access[civ_info.sub_archetype]
                 if allowed then
                     target_sub_archetypes = allowed
                     log_func(log_prefix .. ": Enforcing ACCESS-MAPPED sub-archetypes [" .. table.concat(allowed, ", ") .. "] for civ " .. civ_tag .. " (Founder was " .. civ_info.sub_archetype .. ")")
                 end

            elseif chosen_rule.inherit_sub_archetype and civ_info.sub_archetype then
                target_sub_archetypes = { civ_info.sub_archetype }
                log_func(log_prefix .. ": Enforcing INHERITED sub-archetype [" .. civ_info.sub_archetype .. "] for civ " .. civ_tag)
            end

            local is_possible = false
            local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, target_rating.tags, {}, target_sub_archetypes)
            
            if #compatible_sizes > 0 then
                for _, size_variant in ipairs(compatible_sizes) do
                    local this_size_is_possible = true
                    local current_size_tags = size_variant.size_tags or {}
                    
                    for _, conf in ipairs(config.COMPONENT_TABLES) do
                        local compatible_addons = filter_components_by_tags(config[conf.table_key], target_rating.tags, current_size_tags, target_sub_archetypes)
                        if #compatible_addons == 0 then
                            this_size_is_possible = false
                            break
                        end
                    end
                    
                    if this_size_is_possible then
                        is_possible = true
                        break
                    end
                end
            end
            
            if not is_possible then
                log_func(log_prefix .. ": WARNING - Cannot generate '"..rating_tag.."' for civ "..civ_tag..". No valid component/size combination found (data contradiction or impossible sub-archetype constraints).")
                goto continue_rating_loop 
            end

            local num_to_gen = 0
            if override.min and override.max then
                num_to_gen = override.min
                local potential_extras = override.max - override.min
                if potential_extras > 0 then
                    local base_chance = override.base_chance or 0.80 
                    local decay_factor = override.decay_factor or 0.60
                    local current_threshold = base_chance
                    for k = 1, potential_extras do
                        local roll = 0
                        if _G.trandom then
                            roll = (_G.trandom(100) + 1) / 100.0
                        else
                            roll = math.random()
                        end
                        if roll <= current_threshold then
                            num_to_gen = num_to_gen + 1
                            current_threshold = current_threshold * decay_factor
                        else
                            break
                        end
                    end
                end
            end
            
            if num_to_gen > 0 then
                log_func(log_prefix .. ": Civ " .. civ_tag .. " will get " .. num_to_gen .. " creatures of rating: " .. rating_tag .. " (Diminishing returns applied)")
            end

            for i = 1, num_to_gen do
                local max_attempts_per_creature = 100 
                local generated_successfully = false
                
                while not generated_successfully and max_attempts_per_creature > 0 do
                    max_attempts_per_creature = max_attempts_per_creature - 1
                    
                    local selection_successful, components = select_random_creature_components(config, {target_rating}, target_sub_archetypes)
                    
                    if selection_successful and components then
                        local fingerprint = generate_creature_fingerprint(config, components)
                        
                        if not global_fingerprints[fingerprint] then
                            domestic_creature_counter = domestic_creature_counter + 1
                            local id_suffix = string.format("%03d", domestic_creature_counter)
                            local numeric_code = generate_numeric_code(4)
                            
                            local creature_data = assemble_creature_raw(config, "DOMESTIC", id_suffix, components, numeric_code, civ_tag)
                            
                            local config_key = config.ARCHETYPE_CLASS
                            local rating_key = components.rating.tags and components.rating.tags[1]
                            
                            if rating_key then
                                if not successful_creatures_by_config_and_rating[config_key] then
                                    successful_creatures_by_config_and_rating[config_key] = {}
                                end
                                if not successful_creatures_by_config_and_rating[config_key][rating_key] then
                                    successful_creatures_by_config_and_rating[config_key][rating_key] = {}
                                end
                                table.insert(successful_creatures_by_config_and_rating[config_key][rating_key], creature_data.creature)
                            end

                            table.insert(all_domestic_creature_raws, creature_data.creature)
                            
                            local domestic_obj = {
                                id = creature_data.id,
                                raw_lines = creature_data.creature, 
                                rating_tags = components.rating.tags,
                                archetypes = { config.ARCHETYPE_CLASS },
                                size_tag = (components.size_variant.size_tags and components.size_variant.size_tags[1]) or "MEDIUM",
                                pop_ratio = 50,
                                -- [[ NEW: PASS FORCED THEME ]] --
                                forced_theme = forced_theme
                                -- [[ END NEW ]]
                            }
                            table.insert(all_domestic_creature_objects, domestic_obj)

                            global_fingerprints[fingerprint] = true
                            generated_successfully = true
                            
                            log_func(log_prefix .. ": Generated creature " .. creature_data.creature[1] .. " (" .. i .. "/" .. num_to_gen .. ") for civ " .. civ_tag)
                        end
                    end
                end 
                
                if not generated_successfully then
                    local config_key = config.ARCHETYPE_CLASS
                    local rating_key = target_rating.tags and target_rating.tags[1]
                    
                    log_func(log_prefix .. ": WARNING - Failed to generate a *unique* creature for rating '" .. (rating_key or "N/A") .. "' after 100 attempts.")

                    local fallback_list = nil
                    if config_key and rating_key and 
                       successful_creatures_by_config_and_rating[config_key] and 
                       successful_creatures_by_config_and_rating[config_key][rating_key] then
                        fallback_list = successful_creatures_by_config_and_rating[config_key][rating_key]
                    end

                    if fallback_list and #fallback_list > 0 then
                        local chosen_index
                        if _G.trandom then
                            chosen_index = _G.trandom(#fallback_list) + 1
                        else
                            chosen_index = math.random(1, #fallback_list)
                        end
                        
                        local chosen_fallback_creature_raws = fallback_list[chosen_index]

                        if chosen_fallback_creature_raws then
                            local insertion_index = #chosen_fallback_creature_raws + 1
                            for i, line in ipairs(chosen_fallback_creature_raws) do
                                if line:match("^%s*%[CASTE:") then
                                    insertion_index = i
                                    break
                                end
                            end
                            table.insert(chosen_fallback_creature_raws, insertion_index, "[CREATURE_CLASS:" .. civ_tag .. "]")
                            log_func(log_prefix .. ": ...FALLBACK SUCCESS. Added civ tag '" .. civ_tag .. "' to a pre-existing creature (at line " .. insertion_index .. ") of rating '" .. rating_key .. "'.")
                        else
                             log_func(log_prefix .. ": ...FALLBACK FAILED. Chosen fallback index was nil. Civ " .. civ_tag .. " will not have this animal.")
                        end
                    else
                        log_func(log_prefix .. ": ...FALLBACK FAILED. No pre-existing creatures with config '" .. (config_key or "N/A") .. "' and rating '" .. (rating_key or "N/A") .. "' were found. Civ " .. civ_tag .. " will not have this animal.")
                    end
                end
            end 
            
            ::continue_rating_loop:: 
        end 
        
        ::continue_civ_loop::
    end 

    log_func("DOMESTIC_ENGINE_LOG: Generation complete. Registering " .. #all_domestic_creature_raws .. " total domestic creatures.")
    
    if _G.raws and _G.raws.register_creatures and #all_domestic_creature_raws > 0 then
        if weaponizer_module and weapon_configs and #all_domestic_creature_objects > 0 then
            log_func("DOMESTIC_ENGINE_LOG: Handing off " .. #all_domestic_creature_objects .. " creatures to Weaponizer...")
            
            local weapon_raws, w_count = weaponizer_module.generate_for_list(all_domestic_creature_objects, weapon_configs)
            
            if weapon_raws and #weapon_raws > 0 then
                log_func("DOMESTIC_ENGINE_LOG: Weaponizer returned " .. #weapon_raws .. " lines (" .. w_count .. " variants).")
                table.insert(all_domestic_creature_raws, weapon_raws)
            else
                log_func("DOMESTIC_ENGINE_LOG: Weaponizer returned no variants.")
            end
        end

        local flat_list_of_raws = {}
        for _, creature_raw_table in ipairs(all_domestic_creature_raws) do
            for _, line in ipairs(creature_raw_table) do
                table.insert(flat_list_of_raws, line)
            end
        end
        _G.raws.register_creatures(flat_list_of_raws)
        log_func("DOMESTIC_ENGINE_LOG: Successfully registered all domestic creatures.")
    else
        log_func("DOMESTIC_ENGINE_LOG: No domestic creatures to register.")
    end
end

local engine_module = {}
engine_module.generate_domestic_creatures_for_civs = generate_domestic_creatures_for_civs
return engine_module