-- Requires rules/megabeast_rules.lua
local rules = require("rules.megabeast_rules")
if not rules then
    _G.log("MEGABEAST_CALC: ERROR! megabeast_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- Private helper function to find the tag
local function get_megabeast_tag(size_key, rating_tag)
    if not size_key or not rating_tag then return nil end

    -- Check if the size key exists, then if the rating key exists inside it
    if rules.RULES[size_key] and rules.RULES[size_key][rating_tag] then
        -- Return the tag string, e.g., "[MEGABEAST]"
        return rules.RULES[size_key][rating_tag]
    end

    return nil -- No rule found
end

---
--- Returns the formatted tag string (e.g., "[MEGABEAST]") or ""
---
function M.get_megabeast_token(config, components)
    -- 1. Validate input data
    if not config or not components or not components.rating or not components.rating.tags or
       not components.size_variant or not components.size_variant.name_part then
        return "" -- Not enough info
    end

    local rating_tag = components.rating.tags[1]
    local size_key = components.size_variant.name_part

    -- 2. Get the tag string from our rules
    local tag = get_megabeast_tag(size_key, rating_tag)

    -- 3. Return the tag or an empty string
    if tag then
        return tag
    end

    return "" -- No applicable rule
end

return M