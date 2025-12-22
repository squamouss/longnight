local rules = require("rules.frequency_rules")
if not rules then
    _G.log("FREQ_CALC: ERROR! frequency_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- Helper to extract sub-archetype (Shared logic with population_calculator)
local function get_sub_archetype(components, config)
    if config and config.COMPONENT_TABLES then
        for _, conf in ipairs(config.COMPONENT_TABLES) do
            local comp = components[conf.name]
            if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                return comp.sub_archetype[1]
            end
        end
    end
    if components.sub_archetypes and #components.sub_archetypes > 0 then
        return components.sub_archetypes[1]
    end
    return nil
end

function M.calculate_frequency(config, components)
    if not config or not components or not components.rating or not components.rating.tags or not components.size_variant then
        return rules.DEFAULT_FREQUENCY
    end

    local rating_tag = components.rating.tags[1]
    local archetype = config.ARCHETYPE_CLASS or "BIOMACHINE"
    local size_key = components.size_variant.name_part
    local sub_archetype = get_sub_archetype(components, config)

    -- 1. Find Archetype Rules
    local archetype_rules = rules.RULES[archetype]
    if not archetype_rules then 
        return rules.DEFAULT_FREQUENCY 
    end

    -- 2. Find Size Rules
    local size_rules = archetype_rules[size_key]
    if not size_rules then 
        return rules.DEFAULT_FREQUENCY 
    end

    -- 3. Resolve Rating/Sub-Archetype value
    local freq_value = nil
    
    -- Check for direct rating match
    local rating_entry = size_rules[rating_tag]
    
    if rating_entry then
        if type(rating_entry) == "number" then
            freq_value = rating_entry
        elseif type(rating_entry) == "table" then
            -- Handle sub-archetype overrides if entry is a table
            if sub_archetype and rating_entry[sub_archetype] then
                freq_value = rating_entry[sub_archetype]
            else
                freq_value = rating_entry["DEFAULT"]
            end
        end
    else
        -- Fallback to size default if specific rating not found
        if size_rules["DEFAULT"] then
            freq_value = size_rules["DEFAULT"]
        end
    end

    return freq_value or rules.DEFAULT_FREQUENCY
end

function M.get_frequency_token(config, components)
    local freq_val = M.calculate_frequency(config, components)
    
    -- Optimization: 50 is default in DF, we can omit it to save file space, 
    -- or include it for clarity. Including it for now.
    return "[FREQUENCY:" .. tostring(freq_val) .. "]"
end

return M