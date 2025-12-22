
local rules = require("rules.difficulty_rules")

if not rules then
    _G.log("DIFFICULTY_CALC: ERROR! difficulty_rules.lua not found or failed to load.")
    return {}
end

local M = {}

function M.calculate_difficulty(config, components)
    if not config or not components or not components.rating or not components.size_variant then
        _G.log("DIFFICULTY_CALC: Missing config or components. Returning base difficulty.")
        return rules.BASE_DIFFICULTY or 0
    end

    local total_difficulty = rules.BASE_DIFFICULTY or 0

    -- 1. Add score for Archetype
    local archetype = config.ARCHETYPE_CLASS
    if archetype and rules.ARCHETYPE[archetype] then
        total_difficulty = total_difficulty + rules.ARCHETYPE[archetype]
    end

    -- 2. Add score for Size Variant
    local size_key = components.size_variant.name_part
    if size_key and rules.SIZE_VARIANT[size_key] then
        total_difficulty = total_difficulty + rules.SIZE_VARIANT[size_key]
    end

    -- 3. Add score for Interaction Rating
    if components.rating.tags and #components.rating.tags > 0 then
        local rating_key = components.rating.tags[1]
        if rating_key and rules.INTERACTION_RATING[rating_key] then
            total_difficulty = total_difficulty + rules.INTERACTION_RATING[rating_key]
        end
    end
    
    if total_difficulty < 0 then total_difficulty = 0 end

    return math.floor(total_difficulty)
end

function M.get_difficulty_token(config, components)
    local score = M.calculate_difficulty(config, components)
    
    if score > 0 then
        return "[DIFFICULTY:" .. tostring(score) .. "]"
    end
    
    return ""
end

return M