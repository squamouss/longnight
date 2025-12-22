local config_data = require("rules.natural_skill_rules")

if not config_data then
    if _G.log then _G.log("SKILLS_CALC: ERROR! natural_skill_rules.lua not found.") end
    return {}
end

local M = {}

function M.get_natural_skill_tokens(config, components)
    if not config or not components then return "" end
    
    -- 1. Identify the Traits
    local archetype = config.ARCHETYPE_CLASS
    local rating_key = (components.rating and components.rating.tags and components.rating.tags[1]) or nil
    local size_key = (components.size_variant and components.size_variant.name_part) or nil

    local generated_tokens = {}

    -- 2. Loop through every skill defined in the config
    for _, skill_name in ipairs(config_data.TRACKED_SKILLS) do
        
        -- Start with Base
        local final_score = config_data.BASE_LEVEL

        -- Add Archetype Modifier
        if archetype and config_data.ARCHETYPE[archetype] and config_data.ARCHETYPE[archetype][skill_name] then
            final_score = final_score + config_data.ARCHETYPE[archetype][skill_name]
        end

        -- Add Rating Modifier
        if rating_key and config_data.RATING[rating_key] and config_data.RATING[rating_key][skill_name] then
            final_score = final_score + config_data.RATING[rating_key][skill_name]
        end

        -- Add Size Modifier
        if size_key and config_data.SIZE[size_key] and config_data.SIZE[size_key][skill_name] then
            final_score = final_score + config_data.SIZE[size_key][skill_name]
        end

        -- 3. Clamp Negative Numbers to Zero
        if final_score < 0 then 
            final_score = 0 
        end

        -- 4. Generate Token
        -- Note: [NATURAL_SKILL:SKILL:0] is valid in DF (Dabbling).
        -- If you only want tokens for skills > 0, change ">= 0" to "> 0".
        if final_score >= 0 then
            table.insert(generated_tokens, "[NATURAL_SKILL:" .. skill_name .. ":" .. tostring(final_score) .. "]")
        end
    end

    return table.concat(generated_tokens, "\n")
end

return M