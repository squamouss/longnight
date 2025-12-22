-- =====================================================================================
-- CREATURE GENERATOR MASTER LIBRARY
-- Centralizes shared utility functions, rule calculators, and raw assembly logic.
-- =====================================================================================

local M = {}

-- [[ RULE CALCULATOR IMPORTS ]] --
local function safe_require(path)
    local status, mod = pcall(require, path)
    if status then return mod else return nil end
end

M.difficulty = safe_require("rules.difficulty_calculator")
M.firewall = safe_require("rules.firewall_calculator")
M.petvalue = safe_require("rules.petvalue_calculator")
M.maxage = safe_require("rules.maxage_calculator")
M.buildingdestroyer = safe_require("rules.buildingdestroyer_calculator")
M.name_resolver = safe_require("rules.name_resolver")
M.rating_tokens = safe_require("rules.rating_token_rules")
M.megabeast = safe_require("rules.megabeast_calculator")
M.avatar_spheres = safe_require("rules.avatar_sphere_rules")
M.existential = safe_require("rules.existential_variant_rules")
M.natural_skills = safe_require("rules.natural_skill_calculator")
M.population = safe_require("rules.population_calculator")
M.frequency = safe_require("rules.frequency_calculator")
M.cluster = safe_require("rules.cluster_calculator")
M.trade_capacity = safe_require("rules.tradecapacity_calculator")
M.gait = safe_require("rules.gait_calculator")
M.attribute = safe_require("rules.attribute_calculator")

-- [[ BASIC UTILITIES ]] --

function M.deep_copy(original)
    if not original then return nil end
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            v = M.deep_copy(v)
        end
        copy[k] = v
    end
    return copy
end

function M.split_to_lines(current_lines_table, raw_block)
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

function M.table_contains(tbl, val)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end

function M.pick_random(tbl)
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

function M.generate_numeric_code(num_digits)
    local code = ""
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    for i = 1, num_digits do
        code = code .. rand_func(10)
    end
    return code
end

function M.pick_weighted_random_multiplier(distribution_weights)
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

-- [[ COMPONENT FILTERING ]] --

function M.filter_components_by_tags(component_list, rating_tags, size_tags, valid_sub_archetypes)
    local filtered_list = {}
    for _, component in ipairs(component_list) do
        local archetype_ok = true
        if valid_sub_archetypes and #valid_sub_archetypes > 0 then
            if component.sub_archetype and #component.sub_archetype > 0 then
                local match_found = false
                for _, comp_arch in ipairs(component.sub_archetype) do
                    if M.table_contains(valid_sub_archetypes, comp_arch) then
                        match_found = true
                        break
                    end
                end
                if not match_found then archetype_ok = false end
            end
        end

        if archetype_ok then
            local rating_ok = true
            if component.eligible_rating_tags and #component.eligible_rating_tags > 0 then
                rating_ok = false
                for _, req_tag in ipairs(component.eligible_rating_tags) do
                    if M.table_contains(rating_tags, req_tag) then
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
                        if M.table_contains(size_tags, req_tag) then
                            size_ok = true
                            break
                        end
                    end
                end
                if size_ok then table.insert(filtered_list, component) end
            end
        end
    end
    return filtered_list
end

-- [[ ID ASSIGNMENT ]] --

function M.assign_unique_ids(tbl, prefix)
    prefix = prefix or "id"
    for i, entry in ipairs(tbl) do entry.id = prefix .. "_" .. i end
end

function M.assign_all_component_ids(config)
    if config._ids_assigned then return end
    M.assign_unique_ids(config.interaction_rating, "rating")
    M.assign_unique_ids(config.generic_body_size_variants, "size_variant")
    if config.non_sophont_caste_groups then
        M.assign_unique_ids(config.non_sophont_caste_groups, "caste_group")
    end
    for _, component_config in ipairs(config.COMPONENT_TABLES) do
        M.assign_unique_ids(config[component_config.table_key], component_config.name)
    end
    if config.flowchart_data then
        for key, flowchart_table in pairs(config.flowchart_data) do
            M.assign_unique_ids(flowchart_table, key)
        end
    end
    config._ids_assigned = true
end

-- [[ FLOWCHART & DATA HELPERS ]] --

function M.get_caste_specific_value(component, base_key, caste_type)
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

function M.process_flowchart_tables(config, components, tables_to_process, parent_component)
    if not tables_to_process or #tables_to_process == 0 then return true end
    for _, table_name in ipairs(tables_to_process) do
        local flowchart_table = config.flowchart_data and config.flowchart_data[table_name]
        if flowchart_table then
            local compatible_options = M.filter_components_by_tags(flowchart_table, components.rating.tags, components.size_variant.size_tags or {}, components.sub_archetypes)
            local chosen_flowchart_entry = M.deep_copy(M.pick_random(compatible_options))
            if not chosen_flowchart_entry then return false end
            
            if not parent_component.flowchart_selections then
                parent_component.flowchart_selections = {}
            end
            table.insert(parent_component.flowchart_selections, chosen_flowchart_entry)

            if chosen_flowchart_entry.next_tables and #chosen_flowchart_entry.next_tables > 0 then
                local success = M.process_flowchart_tables(config, components, chosen_flowchart_entry.next_tables, chosen_flowchart_entry)
                if not success then return false end
            end
        else
            return false
        end
    end
    return true
end

-- [[ TOKEN GATHERING ]] --

function M.gather_caste_toks(config, components, caste_type)
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
    for _, conf in ipairs(config.COMPONENT_TABLES) do gather_toks_recursively(components[conf.name]) end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp then
            local tok_block
            if caste_type == "non_sophont" then tok_block = comp.tok
            elseif caste_type == "mundane" then tok_block = comp.mundane_tok
            elseif caste_type == "core" then tok_block = comp.core_tok or comp.mundane_tok
            elseif caste_type == "transcendent" then tok_block = comp.transcendent_tok end
            if tok_block then M.split_to_lines(all_toks, tok_block) end
        end
    end
    return all_toks
end

function M.gather_creature_level_toks(config, components)
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
    for _, conf in ipairs(config.COMPONENT_TABLES) do gather_toks_recursively(components[conf.name]) end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp and comp.tok then
            local has_caste_override = comp.mundane_tok or comp.core_tok
            if not has_caste_override then M.split_to_lines(all_toks, comp.tok) end
        end
    end
    return all_toks
end

function M.gather_size_specific_tokens(config, components)
    local extra_toks = {}
    local current_size_tags = components.size_variant.size_tags or {}
    
    local function check_comp(comp)
        if comp and comp.size_specific_tokens then
            for tag, token_block in pairs(comp.size_specific_tokens) do
                if M.table_contains(current_size_tags, tag) then
                    M.split_to_lines(extra_toks, token_block)
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
    for _, conf in ipairs(config.COMPONENT_TABLES) do gather_size_toks_recursively(components[conf.name]) end
    return extra_toks
end

-- [[ DESCRIPTION & BODY ASSEMBLY ]] --

function M.construct_body_string(config, components, caste_type)
    local body_parts = {}
    local function gather_parts_recursively(component)
        if component then
            local body_token = M.get_caste_specific_value(component, 'body_token', caste_type)
            if body_token then table.insert(body_parts, body_token) end
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_parts_recursively(selection)
                end
            end
        end
    end
    for _, conf in ipairs(config.COMPONENT_TABLES) do gather_parts_recursively(components[conf.name]) end
    return "[BODY:" .. table.concat(body_parts, "") .. "]"
end

function M.construct_full_description(config, comps, final_mass, additional_line, include_rating_desc, caste_type)
    local parts = {}
    local function add_descriptions_recursively(component)
        if component then
            local desc_part = M.get_caste_specific_value(component, 'desc_part', caste_type)
            if desc_part then table.insert(parts, desc_part) end
        end
        if component and component.flowchart_selections then
            for _, selection in ipairs(component.flowchart_selections) do
                add_descriptions_recursively(selection)
            end
        end
    end

    for _, conf in ipairs(config.COMPONENT_TABLES) do add_descriptions_recursively(comps[conf.name]) end
    if include_rating_desc and comps.rating and comps.rating.desc_part then table.insert(parts, comps.rating.desc_part) end
    if additional_line and additional_line ~= "" then table.insert(parts, additional_line) end
    if comps.lore then table.insert(parts, comps.lore) end
    
    if M.difficulty then
        local score = M.difficulty.calculate_difficulty(config, comps)
        table.insert(parts, "/THREAT_RANK = " .. tostring(score) .. "")
    end
    
    if M.firewall then
        local fw_desc = M.firewall.get_firewall_desc_string(config, comps)
        table.insert(parts, fw_desc)
    end

    if M.attribute and M.attribute.get_attribute_desc_string then
        local att_desc = M.attribute.get_attribute_desc_string(config, comps)
        table.insert(parts, att_desc)
    end

    -- [[ NEW: GAIT DESCRIPTION INJECTION ]] --
    if M.gait and M.gait.get_gait_description then
        local gait_desc = M.gait.get_gait_description(config, comps)
        if gait_desc ~= "" then
            table.insert(parts, gait_desc)
        end
    end
    
    table.insert(parts, string.format(comps.size_variant.desc_part, final_mass))
    return string.gsub(table.concat(parts, ""), "%s+$", "")
end

-- [[ GAIT SYSTEM HOOK ]] --

function M.safe_get_gait_tokens(config, components)
    if not M.gait then return "" end
    -- Updated to search for generate_gait_strings specifically
    local func = M.gait.generate_gait_strings or M.gait.generate_gait_lines or M.gait.get_gait_tokens
    if func then
        return func(config, components)
    else
        return ""
    end
end

return M