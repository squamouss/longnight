local MSTR = require("creature_generator_master")

-- [[ GLOBAL FINGERPRINT REGISTRY ]] --
if not _G.global_creature_fingerprints then
    _G.global_creature_fingerprints = {}
end

-- #region Core Generation Logic

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

    components.rating = MSTR.deep_copy(MSTR.pick_random(preferred_ratings_pool))
    if not components.rating then return false, nil end
    for _, tag in ipairs(components.rating.tags) do table.insert(components.creature_tags, tag) end

    local compatible_sizes = MSTR.filter_components_by_tags(config.generic_body_size_variants, components.rating.tags, {}, valid_sub_archetypes)
    
    if forced_size_tag then
        if type(forced_size_tag) == "string" and forced_size_tag:lower() == "any" then
             -- Do nothing, keep compatible_sizes as is.
        else
            local specific_size_pool = {}
            for _, sz in ipairs(compatible_sizes) do
                local match = false
                if type(forced_size_tag) == "table" then
                    for _, tag in ipairs(forced_size_tag) do
                        if sz.size_tags and MSTR.table_contains(sz.size_tags, tag) then
                            match = true
                            break
                        end
                    end
                else
                    if sz.size_tags and MSTR.table_contains(sz.size_tags, forced_size_tag) then
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

    components.size_variant = MSTR.deep_copy(MSTR.pick_random(compatible_sizes))
    if not components.size_variant then 
        return false, nil 
    end
    
    components.size_variant.tags = components.size_variant.size_tags 

    local current_size_tags = components.size_variant.size_tags or {}
    for _, tag in ipairs(current_size_tags) do table.insert(components.creature_tags, tag) end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local compatible_addons = MSTR.filter_components_by_tags(config[conf.table_key], components.rating.tags, current_size_tags, valid_sub_archetypes)
        local chosen_component = MSTR.deep_copy(MSTR.pick_random(compatible_addons))
        if not chosen_component then return false, nil end
        
        components[conf.name] = chosen_component
        if chosen_component.tags then
            for _, tag in ipairs(chosen_component.tags) do table.insert(components.creature_tags, tag) end
        end

        if chosen_component.next_tables and #chosen_component.next_tables > 0 then
            local flowchart_success = MSTR.process_flowchart_tables(config, components, chosen_component.next_tables, chosen_component)
            if not flowchart_success then
                return false, nil
            end
        end
    end
    
    components.lore = MSTR.pick_random(config.generic_creature_lore_snippets)
    if not components.lore then return false, nil end

    return true, components
end

local utility_functions = {
    pick_random = MSTR.pick_random,
    split_to_lines = MSTR.split_to_lines,
    table_contains = MSTR.table_contains,
    filter_components_by_tags = MSTR.filter_components_by_tags,
    description_constructor = MSTR.construct_full_description,
    body_string_constructor = MSTR.construct_body_string,
    gather_caste_toks = MSTR.gather_caste_toks
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
    local size_multiplier = sz.favored_size_multiplier_enabled and MSTR.pick_weighted_random_multiplier(distribution_to_use) or (rand_func(9) + 1)

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
        if MSTR.table_contains(components.creature_tags, tag) then
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
    
    local base_singular, base_plural = MSTR.name_resolver.get_base_names(config, components)
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
    
    if _G.add_generated_info then
        _G.add_generated_info(lines)
    else
        table.insert(lines, "[GENERATED]")
    end

    table.insert(lines, "[NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    table.insert(lines, "[CASTE_NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    MSTR.split_to_lines(lines, config.BASE_RAWS)

    if MSTR.avatar_spheres then
        local sphere_tokens = MSTR.avatar_spheres.get_sphere_tokens(config, components)
        if sphere_tokens and #sphere_tokens > 0 then
            MSTR.split_to_lines(lines, sphere_tokens)
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
    
    MSTR.split_to_lines(lines, config.COMMON_BODY_DETAIL_RAWS)

    local creature_level_toks = MSTR.gather_creature_level_toks(config, components)
    MSTR.split_to_lines(lines, creature_level_toks)

    local size_specific_toks = MSTR.gather_size_specific_tokens(config, components)
    MSTR.split_to_lines(lines, size_specific_toks)

    -- [[ GAIT INJECTION ]] --
    if MSTR.gait then
        local gait_tokens = MSTR.safe_get_gait_tokens(config, components)
        if gait_tokens and gait_tokens ~= "" then
             MSTR.split_to_lines(lines, gait_tokens)
        end
    end

    if MSTR.buildingdestroyer then
        local bldg_token = MSTR.buildingdestroyer.get_buildingdestroyer_token(config, components)
        if bldg_token ~= "" then
            table.insert(lines, bldg_token)
        end
    end

    if MSTR.difficulty then
        local difficulty_token = MSTR.difficulty.get_difficulty_token(config, components)
        if difficulty_token ~= "" then
            table.insert(lines, difficulty_token)
        end
    end
    
    if MSTR.population then
        local pop_token = MSTR.population.get_population_token(config, components)
        if pop_token and pop_token ~= "" then
            table.insert(lines, pop_token)
        end
    end
    
    if MSTR.cluster then
        local cluster_token = MSTR.cluster.get_cluster_token(config, components)
        if cluster_token ~= "" then
            table.insert(lines, cluster_token)
        end
    end
    
    if MSTR.frequency then
        local freq_token = MSTR.frequency.get_frequency_token(config, components)
        if freq_token ~= "" then
            table.insert(lines, freq_token)
        end
    end
    
    if MSTR.petvalue then
        local petvalue_token = MSTR.petvalue.get_petvalue_token(config, components)
        if petvalue_token ~= "" then
            table.insert(lines, petvalue_token)
        end
    end
    
    if MSTR.maxage then
        local maxage_token = MSTR.maxage.get_maxage_token(config, components)
        if maxage_token ~= "" then
            table.insert(lines, maxage_token)
        end
    end
    
    if MSTR.megabeast then
        local megabeast_token = MSTR.megabeast.get_megabeast_token(config, components)
        if megabeast_token ~= "" then
            table.insert(lines, megabeast_token)
        end
    end
    
    if MSTR.existential then
        local variant_token = MSTR.existential.get_existential_token(config, components)
        if variant_token ~= "" then
            table.insert(lines, variant_token)
        end
    end
    
    if MSTR.rating_tokens then
        local rating_tokens = MSTR.rating_tokens.get_rating_tokens(config, components)
        if rating_tokens and #rating_tokens > 0 then
            MSTR.split_to_lines(lines, rating_tokens)
        end
    end
    
    if MSTR.natural_skills then
        local skill_tokens = MSTR.natural_skills.get_natural_skill_tokens(config, components)
        if skill_tokens and skill_tokens ~= "" then
            MSTR.split_to_lines(lines, skill_tokens)
        end
    end
    
    if MSTR.firewall then
        local fw_token = MSTR.firewall.get_firewall_token(config, components)
        if fw_token ~= "" then
            table.insert(lines, fw_token)
        end
    end

    if MSTR.attribute then
        local attr_tokens = MSTR.attribute.get_attribute_tokens(config, components)
        if attr_tokens and #attr_tokens > 0 then
            MSTR.split_to_lines(lines, attr_tokens)
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
    
    MSTR.split_to_lines(lines, config.COMMON_APPEARANCE_RAWS)
    
    if shared_descriptor_tokens then
        MSTR.split_to_lines(lines, shared_descriptor_tokens)
    end
    
    return { creature=lines, id=creature_token, weight=10, is_transcendent=false, components=components }
end

local function generate_all_creatures(config)
    local log_func = _G.log or function(...) print(table.concat({...}, "\t")) end
    local log_prefix = config.ARCHETYPE_CLASS:upper() .. "_GENERATOR_LOG"
    log_func(log_prefix .. ": Initializing generation.")
    MSTR.assign_all_component_ids(config)

    log_func(log_prefix .. ": Analyzing config for valid creature generation paths...")
    local valid_ratings_pool = {}
    local forced_generation_queue = {}
    
    for _, rating_option in ipairs(config.interaction_rating) do
        if rating_option.enabled then
            local is_possible = true
            
            if config.forced_rating then
                 if not MSTR.table_contains(rating_option.tags, config.forced_rating) then
                     is_possible = false
                 end
            end
            
            if is_possible then
                local compatible_sizes = MSTR.filter_components_by_tags(config.generic_body_size_variants, rating_option.tags, {})
                if #compatible_sizes == 0 then 
                    is_possible = false 
                end

                if is_possible then
                    for _, conf in ipairs(config.COMPONENT_TABLES) do
                        local compatible_addons = MSTR.filter_components_by_tags(config[conf.table_key], rating_option.tags, {})
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
                 if r.enabled and r.tags and MSTR.table_contains(r.tags, forced_req.rating) then
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
                local numeric_code = MSTR.generate_numeric_code(4)
                
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
        
        local modified_count = 0
        for i, obj in ipairs(generated_data) do
            local actual_size = (obj.components.size_variant.size_tags and obj.components.size_variant.size_tags[1]) or "MEDIUM"
            local sub_arch = nil
            if obj.components.sub_archetypes and #obj.components.sub_archetypes > 0 then
                sub_arch = obj.components.sub_archetypes
            end

            -- [[ CRITICAL FIX: METADATA CONSTRUCTION ]]
            local metadata = {
                rating_tags = obj.components.rating.tags,
                size_tag = actual_size,
                archetype = config.ARCHETYPE_CLASS,
                sub_archetypes = sub_arch 
            }
             
            local new_raws = weaponizer.apply_weapons(obj.creature, weapon_config, nil, metadata)
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