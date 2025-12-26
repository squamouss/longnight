-- Reads buildingdestroyer_rules.lua and provides a function to get the token.
local rules = require("rules.buildingdestroyer_rules")
if not rules then
    _G.log("BLDG_CALC: ERROR! buildingdestroyer_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- Private helper function to find the rule level
local function get_destroyer_level(archetype, size_key, rating_tag)
    if not archetype or not size_key or not rating_tag then return nil end

    -- 1. Check for an Archetype Exception first.
    -- This handles specific overrides (e.g., DEVIANT + MDM + DANGEROUS)
    if rules.ARCHETYPE_EXCEPTIONS[archetype] then
        local exception_rules_for_size = rules.ARCHETYPE_EXCEPTIONS[archetype][size_key]
        if exception_rules_for_size then
            -- Check for a specific rating in the exception block
            if exception_rules_for_size[rating_tag] then
                return exception_rules_for_size[rating_tag]
            end
            -- Check for a size-default in the exception block
            if exception_rules_for_size._DEFAULT then
                return exception_rules_for_size._DEFAULT
            end
        end
    end

    -- 2. If no archetype exception was found, check the BASE_RULES.
    local base_rules_for_size = rules.BASE_RULES[size_key]
    if base_rules_for_size then
        -- Check for a specific rating in the base rules
        if base_rules_for_size[rating_tag] then
            return base_rules_for_size[rating_tag]
        end
        -- Check for a size-default in the base rules
        if base_rules_for_size._DEFAULT then
            return base_rules_for_size._DEFAULT
        end
    end

    return nil -- No rule found
end

---
--- Returns the formatted [BUILDINGDESTROYER:X] token string
---
function M.get_buildingdestroyer_token(config, components)
    -- 1. Validate input data
    if not config or not components or not components.rating or not components.rating.tags or
       not components.size_variant or not components.size_variant.name_part then
        return "" -- Not enough info
    end

    local archetype = config.ARCHETYPE_CLASS
    local rating_tag = components.rating.tags[1]
    local size_key = components.size_variant.name_part

    -- 2. Get the rule level using the new logic
    -- The size check is now part of the get_destroyer_level function
    local level = get_destroyer_level(archetype, size_key, rating_tag)

    -- 3. Format and return the token
    if level then
        return "[BUILDINGDESTROYER:" .. tostring(level) .. "]"
    end

    return "" -- No applicable rule
end

return M