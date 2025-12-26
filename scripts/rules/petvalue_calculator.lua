-- Reads petvalue_rules.lua and calculates a final PETVALUE.
local rules = require("rules.petvalue_rules")

if not rules then
    _G.log("PETVALUE_CALC: ERROR! petvalue_rules.lua not found or failed to load.")
    return {}
end

local M = {}

---
--- Calculates the final petvalue based on size and interaction rating.
---
function M.calculate_petvalue(config, components)
    if not config or not components or not components.rating or not components.size_variant then
        _G.log("PETVALUE_CALC: Missing config or components. Returning 0.")
        return 0
    end

    -- 1. Get the creature's final calculated size (the "base weight").
    -- This is calculated by the engine and stored in the components table.
    local base_size = components.final_adult_size or 0
    if base_size == 0 then
        _G.log("PETVALUE_CALC: Creature final_adult_size is 0. Returning 0.")
        return 0
    end

    -- 2. Get the interaction rating multiplier.
    local interaction_multiplier = 1.0 -- Default multiplier
    if components.rating.tags and #components.rating.tags > 0 then
        local rating_key = components.rating.tags[1]
        if rating_key and rules.INTERACTION_RATING[rating_key] then
            interaction_multiplier = rules.INTERACTION_RATING[rating_key]
        elseif rating_key then
            _G.log("PETVALUE_CALC: No multiplier found for rating '" .. rating_key .. "'. Using 1.0x.")
        end
    end

    -- 3. Get the Archetype multiplier.
    local archetype_multiplier = 1.0 -- Default multiplier
    local archetype_key = config.ARCHETYPE_CLASS
    if archetype_key and rules.ARCHETYPE[archetype_key] then
        archetype_multiplier = rules.ARCHETYPE[archetype_key]
    elseif rules.ARCHETYPE.DEFAULT then
        archetype_multiplier = rules.ARCHETYPE.DEFAULT
    elseif archetype_key then
        _G.log("PETVALUE_CALC: No multiplier found for archetype '" .. archetype_key .. "'. Using 1.0x.")
    end

    -- 4. Get the divisor from the rules.
    local divisor = rules.BASE_PETVALUE_DIVISOR or 1000
    if divisor == 0 then divisor = 1 end -- prevent division by zero

    -- Calculate the final value
    local final_petvalue = (base_size / divisor) * interaction_multiplier * archetype_multiplier
    
    -- Return an integer value, with a minimum of 1.
    local final_integer_value = math.floor(final_petvalue)
    if final_integer_value < 1 then
        final_integer_value = 1
    end

    return final_integer_value
end

---
--- Returns the complete [PETVALUE:X] token string.
---
function M.get_petvalue_token(config, components)
    local value = M.calculate_petvalue(config, components)
    
    if value > 0 then
        return "[PETVALUE:" .. tostring(value) .. "]"
    end
    
    return ""
end

return M