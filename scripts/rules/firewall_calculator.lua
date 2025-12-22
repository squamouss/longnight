local rules = require("rules.firewall_rules")
if not rules then
    _G.log("FIREWALL_CALC: ERROR! firewall_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- Helper to find sub-archetype from components
local function get_sub_archetype(components, config)
    -- Check specific components first (e.g., body plans)
    if config and config.COMPONENT_TABLES then
        for _, conf in ipairs(config.COMPONENT_TABLES) do
            local comp = components[conf.name]
            if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                return comp.sub_archetype[1]
            end
        end
    end
    -- Fallback to general list
    if components.sub_archetypes and #components.sub_archetypes > 0 then
        return components.sub_archetypes[1]
    end
    return "UNKNOWN"
end

-- 1. Calculate the raw score
function M.calculate_firewall_score(config, components)
    if not config or not components or not components.rating then
        return 0
    end

    -- Determine Variables
    local archetype = config.ARCHETYPE_CLASS or "DEFAULT"
    local rating_tag = (components.rating.tags and components.rating.tags[1]) or "DEFAULT"
    local sub_archetype = get_sub_archetype(components, config)

    -- Get Base Value
    local score = rules.ARCHETYPE_BASE[archetype] or rules.ARCHETYPE_BASE["DEFAULT"] or 0

    -- Apply Rating Modifier
    local rating_mod = rules.RATING_MODIFIERS[rating_tag] or 0
    score = score + rating_mod

    -- Apply Sub-Archetype Modifier
    local sub_mod = rules.SUB_ARCHETYPE_MODIFIERS[sub_archetype] or 0
    score = score + sub_mod

    -- Clamp Result (0 to 5)
    if score < 0 then score = 0 end
    if score > 6 then score = 6 end
    
    return math.floor(score)
end

-- 2. Return the hidden token [CREATURE_CLASS:FIREWALL_#]
function M.get_firewall_token(config, components)
    local score = M.calculate_firewall_score(config, components)
    return "[CREATURE_CLASS:INNATE_FIREWALL_" .. score .. "]"
end

-- 3. Return the description string "/ E_DEFENSE= #"
-- This is called by the engine's description constructor
function M.get_firewall_desc_string(config, components)
    local score = M.calculate_firewall_score(config, components)
    return " _______________________________________________________ __________/NET_DEFENSE_THRESHOLD = " .. score
end

return M