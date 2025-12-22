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

local function table_contains(tbl, val)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end

-- ============================================================================
-- CORE LOGIC
-- ============================================================================

function M.apply_weapons(raw_lines, weapon_config, forced_theme, metadata)
    if not weapon_config or not weapon_config.WEAPONS then return raw_lines end
    
    local final_lines = {}
    local caste_blocks = extract_caste_blocks(raw_lines)
    local header_lines = {}
    local footer_lines = {}
    
    -- Separate header/footer
    local in_caste = false
    for _, line in ipairs(raw_lines) do
        if line:match("^%s*%[CASTE:") then in_caste = true end
        if not in_caste then
            table.insert(header_lines, line)
        end
    end
    
    -- Reconstruct header
    for _, l in ipairs(header_lines) do table.insert(final_lines, l) end

    -- Process each caste variant
    for _, block in ipairs(caste_blocks) do
        -- Add base caste lines
        for _, l in ipairs(block.lines) do table.insert(final_lines, l) end
        
        -- VARIANCE LOGIC START
        local assigned_exclusion_groups = {}
        local active_themes = {}
        
        if forced_theme then
            active_themes[forced_theme] = true
        end

        -- 1. Gather Candidates
        local valid_candidates = {}
        
        for key, weapon_def in pairs(weapon_config.WEAPONS) do
            local passed = true
            
            -- A. Metadata Filters
            if metadata then
                -- Archetype Check
                if weapon_def.eligible_archetypes then
                    if not metadata.archetype or not table_contains(weapon_def.eligible_archetypes, metadata.archetype) then
                        passed = false
                    end
                end
                
                -- Sub-Archetype Check
                if passed and weapon_def.eligible_sub_archetypes then
                    if not metadata.sub_archetypes then
                        passed = false
                    else
                        local sub_match = false
                        for _, sub in ipairs(metadata.sub_archetypes) do
                             if table_contains(weapon_def.eligible_sub_archetypes, sub) then
                                 sub_match = true
                                 break
                             end
                        end
                        if not sub_match then passed = false end
                    end
                end
                
                -- Size Check
                if passed and weapon_def.eligible_size_tags then
                    if not metadata.size_tag or not table_contains(weapon_def.eligible_size_tags, metadata.size_tag) then
                        passed = false
                    end
                end
                
                -- Rating Check
                if passed and weapon_def.eligible_rating_tags then
                     if not metadata.rating_tags then
                         passed = false
                     else
                         local rate_match = false
                         for _, rtag in ipairs(metadata.rating_tags) do
                             if table_contains(weapon_def.eligible_rating_tags, rtag) then
                                 rate_match = true
                                 break
                             end
                         end
                         if not rate_match then passed = false end
                     end
                end
            end
            
            if passed then
                table.insert(valid_candidates, { key = key, def = weapon_def, priority = weapon_def.priority or 10 })
            end
        end

        -- 2. Sort Candidates by Priority
        table.sort(valid_candidates, function(a,b) return a.priority > b.priority end)

        -- 3. Selection Loop
        for _, candidate in ipairs(valid_candidates) do
            local weapon = candidate.def
            local allow = true
            
            -- Exclusion Group Check
            if weapon.exclusion_group then
                if assigned_exclusion_groups[weapon.exclusion_group] then
                    allow = false
                end
            end
            
            -- Theme Conflict Check
            if allow and weapon.theme then
                -- Check if it conflicts with ANY active theme
                for act_theme, _ in pairs(active_themes) do
                    if weapon_config.THEME_CONFLICTS[act_theme] then
                        if table_contains(weapon_config.THEME_CONFLICTS[act_theme], weapon.theme) then
                            allow = false
                            break
                        end
                    end
                end
            end
            
            -- Probability Check
            if allow then
                local chance = weapon.pop_ratio_multiplier or 0.1 -- Default 10%
                if forced_theme and weapon.theme == forced_theme then
                     chance = 0.8 -- Boost forced themes
                end
                
                -- Roll
                if math.random() > chance then
                    allow = false
                end
            end
            
            -- Apply
            if allow then
                if weapon.exclusion_group then assigned_exclusion_groups[weapon.exclusion_group] = true end
                if weapon.theme then active_themes[weapon.theme] = true end
                
                local w_name = format_weapon_name(candidate.key)
                table.insert(final_lines, "[DESCRIPTION:It is equipped with a " .. w_name .. ".]")
                if weapon.body then table.insert(final_lines, weapon.body) end
                if weapon.interaction then table.insert(final_lines, weapon.interaction) end
            end
        end
        
        table.insert(final_lines, "[CREATURE_CLASS:WEAPONIZED_VARIANT]")
        table.insert(final_lines, "") 
    end
    
    return final_lines
end

-- Adapter function to maintain list compatibility
function M.generate_for_list(creature_list, weapon_config)
    local all_generated_lines = {}
    local total_variants = 0
    
    for _, creature_data in ipairs(creature_list) do
        local theme = creature_data.forced_theme
        
        -- Safe Archetype Handling: 
        -- If 'archetypes' (plural) is present, pluck the first one for 'archetype' (singular).
        -- If 'archetype' (singular) is present, use it.
        local arch_singular = creature_data.archetype
        if not arch_singular and creature_data.archetypes and #creature_data.archetypes > 0 then
            arch_singular = creature_data.archetypes[1]
        end
        
        -- Safe Sub-Archetype Handling:
        -- Ensure 'sub_archetypes' is always a list for the check logic
        local sub_list = creature_data.sub_archetypes
        if not sub_list and creature_data.sub_archetype then
            sub_list = { creature_data.sub_archetype }
        end

        local metadata = {
            rating_tags = creature_data.rating_tags,
            archetype = arch_singular, 
            size_tag = creature_data.size_tag,
            sub_archetypes = sub_list
        }

        local new_lines = M.apply_weapons(creature_data.raw_lines, weapon_config, theme, metadata)
        
        if #new_lines > 0 then
            for _, line in ipairs(new_lines) do
                table.insert(all_generated_lines, line)
            end
            total_variants = total_variants + 1
        end
    end
    
    return all_generated_lines, total_variants
end

return M