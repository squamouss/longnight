local M = {}

-- ============================================================================
-- HELPERS
-- ============================================================================

local function extract_caste_blocks(raw_lines)
    local caste_blocks = {} 
    if not raw_lines then return caste_blocks end
    local current_block = nil
    for _, line in ipairs(raw_lines) do
        if line:match("^%s*%[CASTE:") then
            if current_block then table.insert(caste_blocks, current_block) end
            current_block = { lines = {}, id = line:match("^%s*%[CASTE:([^:%]]+)%]") }
            table.insert(current_block.lines, line)
        elseif current_block then
            table.insert(current_block.lines, line)
        end
    end
    if current_block then table.insert(caste_blocks, current_block) end
    return caste_blocks
end

local function format_weapon_name(key)
    if not key then return "" end
    local text = key:gsub("_", " ")
    text = text:lower()
    return text
end

-- Optimized Set-based check (O(1)) if available, else O(N) fallback
local function table_contains(tbl, val)
    if not tbl then return false end
    if tbl[val] == true then return true end -- Fast path for sets
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end

local function inject_suffix_into_name_tag(line, suffix, force_caste_token)
    local token, content = line:match("^%s*%[([^:]+):(.+)%]")
    if not token or not content then return line end
    local parts = {}
    for part in content:gmatch("[^:]+") do
        local clean = part:gsub("%]$", "")
        table.insert(parts, clean)
    end
    for i = 1, #parts do
        parts[i] = parts[i] .. suffix
    end
    local output_token = force_caste_token and "CASTE_NAME" or token
    return string.format("[%s:%s]", output_token, table.concat(parts, ":"))
end

local function is_eligible(creature_data, weapon_data, debug_mode)
    if weapon_data.eligible_archetypes then
        local arch_match = false
        if creature_data.archetypes then
            for _, arch in ipairs(creature_data.archetypes) do
                if table_contains(weapon_data.eligible_archetypes, arch) then
                    arch_match = true
                    break
                end
            end
        end
        if not arch_match then return false end
    end
    if weapon_data.eligible_size_tags then
        if not table_contains(weapon_data.eligible_size_tags, creature_data.size_tag) then
            return false
        end
    end
    if weapon_data.eligible_rating_tags then
        local rating_match = false
        if creature_data.rating_tags then
            for _, tag in ipairs(creature_data.rating_tags) do
                if table_contains(weapon_data.eligible_rating_tags, tag) then
                    rating_match = true
                    break
                end
            end
        end
        if not rating_match then return false end
    end
    if weapon_data.eligible_sub_archetypes then
        local sub_match = false
        if creature_data.sub_archetypes then
            for _, sub in ipairs(creature_data.sub_archetypes) do
                if table_contains(weapon_data.eligible_sub_archetypes, sub) then
                    sub_match = true
                    break
                end
            end
        end
        if not sub_match then return false end
    end
    return true
end

local function sort_loadout_by_priority(loadout)
    table.sort(loadout, function(a, b)
        local p1 = a.priority or 999
        local p2 = b.priority or 999
        if p1 == p2 then
            return (a.key or "") < (b.key or "")
        end
        return p1 < p2
    end)
end

local function build_modified_description(original_description, loadout)
    local weapon_names_list = {}
    for _, w_def in ipairs(loadout) do
        -- Fix: Ignore placeholder weapons with description "_" or "NULL"
        if w_def.description ~= "_" and w_def.description ~= "NULL" then
            local d_name = w_def.description or "Weapon"
            if not w_def.description and w_def.key then
                 d_name = format_weapon_name(w_def.key)
            end
            table.insert(weapon_names_list, d_name)
        end
    end
    local armaments_str = ""
    if #weapon_names_list > 0 then
        armaments_str = " _______________________________________________________ __________/ ARMAMENTS = " .. table.concat(weapon_names_list, "||")
    end
    local final_desc_str = ""
    local base_desc = original_description or ""
    local pre_mass, post_mass = base_desc:match("^(.-)(/ APPROX_MASS=.*)$")
    if pre_mass and post_mass and armaments_str ~= "" then
        local clean_pre = pre_mass:gsub("%s+$", "") 
        final_desc_str = clean_pre .. armaments_str .. "" .. post_mass
    elseif armaments_str ~= "" then
        final_desc_str = base_desc .. armaments_str
    else
        final_desc_str = base_desc
    end
    return "[DESCRIPTION:" .. final_desc_str .. "]"
end

-- Check conflict between two themes
local function themes_are_conflicting(t1, t2, conflict_table)
    if not conflict_table then return false end
    local u1 = t1 or "UNIVERSAL"
    local u2 = t2 or "UNIVERSAL"
    if u1 == "UNIVERSAL" or u2 == "UNIVERSAL" then return false end
    if u1 == u2 then return false end

    -- Check T1 vs T2
    if conflict_table[u1] and table_contains(conflict_table[u1], u2) then return true end
    -- Check T2 vs T1
    if conflict_table[u2] and table_contains(conflict_table[u2], u1) then return true end
    
    return false
end

-- ============================================================================
-- SINGLE CREATURE INTERFACE
-- ============================================================================

-- OPTIMIZED: Now accepts `creature_metadata` directly to avoid re-parsing tags
function M.apply_weapons(raw_lines, weapon_config, forced_theme, creature_metadata)
    local header_lines = {}
    local caste_lines_raw = {} 
    local footer_lines = {}    
    local root_name_line = nil 
    local mode = "HEADER" 
    
    -- We still need to parse lines to separate header/castes/footer, but we skip tag extraction logic if metadata exists
    for i, line in ipairs(raw_lines) do
        if not root_name_line and line:match("^%s*%[NAME:") then
            root_name_line = line
        end
        
        -- Fallback Parsing: Only do this if metadata is missing (Legacy Mode)
        if not creature_metadata then
             -- (Parsing logic omitted for optimization path, but kept structure for legacy support if needed)
        end

        if mode == "HEADER" then
            if line:match("^%s*%[CASTE:") then
                mode = "CASTES"
                table.insert(caste_lines_raw, line)
            else
                table.insert(header_lines, line)
            end
        elseif mode == "CASTES" then
            if line:match("^%s*%[SELECT_CASTE:ALL%]") then
                mode = "FOOTER"
                table.insert(footer_lines, line)
            else
                table.insert(caste_lines_raw, line)
            end
        elseif mode == "FOOTER" then
            table.insert(footer_lines, line)
        end
    end
    
    -- Construct the creature data object for eligibility checks
    local creature_data_for_check = {}
    
    if creature_metadata then
        -- Fast Path: Use provided metadata
        creature_data_for_check = {
            rating_tags = creature_metadata.rating_tags or {},
            archetypes = creature_metadata.archetypes or {},
            size_tag = creature_metadata.size_tag or "MEDIUM",
            sub_archetypes = creature_metadata.sub_archetypes or {}
        }
    else
        -- Fallback Path: Re-scan lines (Slow)
        -- Only triggers if calling code didn't update to pass metadata
        local rating_tags_set = {}
        local archetypes_set = {}
        local all_tags = {}
        local size_tag = "MEDIUM"
        
        for _, line in ipairs(raw_lines) do
            for class in line:gmatch("%[CREATURE_CLASS:([^%]]+)%]") do
                if class:match("^SIZE_") then
                    size_tag = class:gsub("SIZE_", "")
                else
                    table.insert(all_tags, class)
                    rating_tags_set[class] = true
                    archetypes_set[class] = true
                end
            end
        end
        
        local sub_archetypes = {}
        for _, tag in ipairs(all_tags) do
            for _, parent in ipairs(all_tags) do
                if tag ~= parent then
                    local prefix = parent .. "_"
                    if tag:find(prefix, 1, true) == 1 then
                        local sub = tag:sub(#prefix + 1)
                        table.insert(sub_archetypes, sub)
                    end
                end
            end
        end
        
        local rating_tags = {}
        for k,_ in pairs(rating_tags_set) do table.insert(rating_tags, k) end
        local archetypes = {}
        for k,_ in pairs(archetypes_set) do table.insert(archetypes, k) end
        
        creature_data_for_check = {
            rating_tags = rating_tags,
            archetypes = archetypes,
            size_tag = size_tag,
            sub_archetypes = sub_archetypes
        }
    end
    
    local eligible_weapons_all = {}
    
    for weapon_key, weapon_data in pairs(weapon_config.WEAPONS) do
        weapon_data.key = weapon_key
        if is_eligible(creature_data_for_check, weapon_data, false) then
            table.insert(eligible_weapons_all, weapon_data)
        end
    end

    if #eligible_weapons_all == 0 then return raw_lines end

    local theme_buckets = {}
    for _, w in ipairs(eligible_weapons_all) do
        local t = w.theme or "UNIVERSAL"
        if not theme_buckets[t] then theme_buckets[t] = {} end
        table.insert(theme_buckets[t], w)
    end
    
    local selected_theme = "UNIVERSAL"
    
    if forced_theme then
        local mapped_theme = forced_theme
        if weapon_config.WEAPON_THEME_MAP and weapon_config.WEAPON_THEME_MAP[forced_theme] then
            mapped_theme = weapon_config.WEAPON_THEME_MAP[forced_theme]
        end

        if theme_buckets[mapped_theme] and #theme_buckets[mapped_theme] > 0 then
            selected_theme = mapped_theme
        else
            local available_themes = {}
            for t, _ in pairs(theme_buckets) do 
                if t ~= "UNIVERSAL" then table.insert(available_themes, t) end 
            end
            
            if #available_themes > 0 then
                local rand_func = _G.trandom or math.random
                local idx = _G.trandom and (rand_func(#available_themes) + 1) or rand_func(#available_themes)
                selected_theme = available_themes[idx]
            end
        end
    else
        local available_themes = {}
        for t, _ in pairs(theme_buckets) do 
            if t ~= "UNIVERSAL" then table.insert(available_themes, t) end 
        end
        if #available_themes > 0 then
            local rand_func = _G.trandom or math.random
            local idx = _G.trandom and (rand_func(#available_themes) + 1) or rand_func(#available_themes)
            selected_theme = available_themes[idx]
        end
    end
    
    local eligible_weapons = {}
    
    -- Filter 1: Check compatibility against the SELECTED_THEME
    for theme_key, weapons_list in pairs(theme_buckets) do
        local is_compat = false
        if theme_key == selected_theme or theme_key == "UNIVERSAL" then
            is_compat = true
        else
            if not themes_are_conflicting(selected_theme, theme_key, weapon_config.THEME_CONFLICTS) then
                is_compat = true
            end
        end
        if is_compat then
            for _, w in ipairs(weapons_list) do table.insert(eligible_weapons, w) end
        end
    end
    
    if #eligible_weapons == 0 then return raw_lines end
    
    local groups = {}
    local standalone = {}
    for _, w in ipairs(eligible_weapons) do
        if w.exclusion_group then
            if not groups[w.exclusion_group] then groups[w.exclusion_group] = {} end
            table.insert(groups[w.exclusion_group], w)
        else
            table.insert(standalone, w)
        end
    end

    local potential_loadouts = {}
    local group_names = {}
    for k,_ in pairs(groups) do table.insert(group_names, k) end
    
    -- Recursive Combine with Cross-Check
    local function recursive_combine(group_idx, current_loadout)
        -- Optimization: Cap permutations to prevent freeze on complex creatures
        if #potential_loadouts >= 20 then return end 

        if group_idx > #group_names then
            -- Base case: Add standalones (also checking their conflicts)
            local final = {}
            for _, w in ipairs(current_loadout) do table.insert(final, w) end
            
            -- Filter standalones against the built loadout
            for _, w in ipairs(standalone) do
                local safe = true
                for _, ex in ipairs(final) do
                    if themes_are_conflicting(w.theme, ex.theme, weapon_config.THEME_CONFLICTS) then
                        safe = false; break
                    end
                end
                if safe then table.insert(final, w) end
            end
            
            table.insert(potential_loadouts, final)
            return
        end
        
        local g_name = group_names[group_idx]
        local options = groups[g_name]
        
        for _, w in ipairs(options) do
            -- Filter 2: Check compatibility against ITEMS CURRENTLY IN LOADOUT
            local is_safe_to_add = true
            
            for _, existing_item in ipairs(current_loadout) do
                if themes_are_conflicting(w.theme, existing_item.theme, weapon_config.THEME_CONFLICTS) then
                    is_safe_to_add = false
                    break
                end
            end
            
            if is_safe_to_add then
                local next_l = {}
                for _, existing in ipairs(current_loadout) do table.insert(next_l, existing) end
                table.insert(next_l, w)
                recursive_combine(group_idx + 1, next_l)
            end
        end
    end
    
    recursive_combine(1, {})
    if #groups == 0 and #standalone > 0 then 
        -- If no groups, just check standalone consistency
        local valid_standalone = {}
        for _, w in ipairs(standalone) do
             local safe = true
             for _, ex in ipairs(valid_standalone) do
                 if themes_are_conflicting(w.theme, ex.theme, weapon_config.THEME_CONFLICTS) then
                     safe = false; break
                 end
             end
             if safe then table.insert(valid_standalone, w) end
        end
        potential_loadouts = { valid_standalone } 
    end
    
    if #potential_loadouts == 0 then return raw_lines end

    local final_lines = {}
    for _, l in ipairs(header_lines) do table.insert(final_lines, l) end
    local original_caste_blocks = extract_caste_blocks(caste_lines_raw)
    
    for i, loadout in ipairs(potential_loadouts) do
        sort_loadout_by_priority(loadout)
        
        local combined_pop_mult = 1.0
        for _, w in ipairs(loadout) do
            if w.pop_ratio_multiplier then
                combined_pop_mult = combined_pop_mult * w.pop_ratio_multiplier
            end
        end
        
        local loadout_suffix = "-W" .. i
        local id_suffix = "_W" .. i
        for _, block in ipairs(original_caste_blocks) do
            local new_caste_id = block.id .. id_suffix
            table.insert(final_lines, "[CASTE:" .. new_caste_id .. "]")
            local caste_name_found = false
            for line_idx, line in ipairs(block.lines) do
                if not line:match("^%s*%[CASTE:") then
                    local processed_line = line:gsub("%[POP_RATIO:(%d+)%]", function(val)
                        local ratio = tonumber(val)
                        if ratio then
                            local new_ratio = math.max(1, math.floor(ratio * combined_pop_mult))
                            return "[POP_RATIO:" .. new_ratio .. "]"
                        end
                        return val
                    end)

                    if processed_line:match("^%s*%[DESCRIPTION:") then
                        local old_desc = processed_line:match("^%s*%[DESCRIPTION:(.+)%]"):gsub("%]$", "")
                        local new_desc_line = build_modified_description(old_desc, loadout)
                        table.insert(final_lines, new_desc_line)
                    elseif processed_line:match("^%s*%[CASTE_NAME:") then
                        caste_name_found = true
                        local new_name_line = inject_suffix_into_name_tag(processed_line, loadout_suffix, true)
                        table.insert(final_lines, new_name_line)
                    else
                        table.insert(final_lines, processed_line)
                    end
                end
            end
            if not caste_name_found and root_name_line then
                local new_name_line = inject_suffix_into_name_tag(root_name_line, loadout_suffix, true)
                table.insert(final_lines, new_name_line)
            end
            for _, weapon in ipairs(loadout) do
                if weapon.body then table.insert(final_lines, weapon.body) end
                if weapon.interaction then table.insert(final_lines, weapon.interaction) end
            end
            table.insert(final_lines, "[CREATURE_CLASS:WEAPONIZED_VARIANT]")
            table.insert(final_lines, "") 
        end
    end
    for _, l in ipairs(footer_lines) do table.insert(final_lines, l) end
    return final_lines
end

-- Adapter function to maintain list compatibility
function M.generate_for_list(creature_list, weapon_config)
    local all_generated_lines = {}
    local total_variants = 0
    
    for _, creature_data in ipairs(creature_list) do
        local theme = creature_data.forced_theme
        
        -- Construct metadata object from list item to pass to apply_weapons
        local metadata = {
            rating_tags = creature_data.rating_tags,
            archetypes = creature_data.archetypes,
            size_tag = creature_data.size_tag,
            sub_archetypes = creature_data.sub_archetypes
        }

        local new_lines = M.apply_weapons(creature_data.raw_lines, weapon_config, theme, metadata)
        
        if #new_lines > 0 then
            for _, line in ipairs(new_lines) do
                table.insert(all_generated_lines, line)
            end
            for _, l in ipairs(new_lines) do
                if l:match("WEAPONIZED_VARIANT") then total_variants = total_variants + 1 end
            end
        end
    end
    return all_generated_lines, total_variants
end

return M