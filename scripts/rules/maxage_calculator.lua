local rules = require("rules.maxage_rules")
if not rules then
    log("MAXAGE_CALC: ERROR! maxage_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- A simple helper to check if a value is in a table
local function table_contains(tbl, val)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end


function M.calculate_maxage(config, components)
    if not config or not components or not components.size_variant then
        log("MAXAGE_CALC: Missing config or components. Using default.")
        return rules.DEFAULT.DEFAULT
    end

    local archetype = config.ARCHETYPE_CLASS
    local size_key = components.size_variant.name_part

    -- 1. Find the correct ruleset for the archetype, or use the default
    -- This correctly ignores the _excluded_ratings key
    local archetype_rules = rules[archetype] or rules.DEFAULT

    -- 2. Find the age pair for the specific size, or use the archetype's default
    local age_pair = archetype_rules[size_key]
    
    if age_pair == nil then
        -- The size key was not found, try the archetype's default
        age_pair = archetype_rules.DEFAULT
    end

    -- 3. If that was also nil, fall back to the global default for that size
    if age_pair == nil then
        age_pair = rules.DEFAULT[size_key]
    end
    
    -- 4. Finally, fall back to the global default's default
    if age_pair == nil then
        age_pair = rules.DEFAULT.DEFAULT
    end

    return age_pair
end

---
--- Returns the formatted [MAXAGE:min:max] token string
---
function M.get_maxage_token(config, components)
    
    -- [[ MODIFIED EXCLUSION LOGIC ]]
    -- Check if this creature's rating is on its archetype's exclusion list
    if rules and config and components and components.rating and components.rating.tags then
        local archetype = config.ARCHETYPE_CLASS
        local rating_tag = components.rating.tags[1] -- Get the primary rating tag
        
        -- Check if the archetype exists in the rules and has an exclusion list
        if archetype and rating_tag and rules[archetype] and rules[archetype]._excluded_ratings then
            
            if table_contains(rules[archetype]._excluded_ratings, rating_tag) then
                -- This rating is excluded. Return an empty string to apply no token.
                return ""
            end
        end
    end
    -- [[ END MODIFIED LOGIC ]]

    -- Original logic resumes if not excluded
    local age_pair = M.calculate_maxage(config, components)
    
    -- If the rules returned 'nil' (e.g. for ALGOMACHINE), return an empty string
    if not age_pair then
        return ""
    end
    
    -- Ensure it's a valid pair
    if type(age_pair) == "table" and #age_pair == 2 then
        return "[MAXAGE:" .. tostring(age_pair[1]) .. ":" .. tostring(age_pair[2]) .. "]"
    end
    
    log("MAXAGE_CALC: WARNING - Invalid age_pair found for " .. (config.ARCHETYPE_CLASS or "N/A") .. ". Returning empty string.")
    return ""
end

return M