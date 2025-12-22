local rules = require("rules.attribute_rules")
if not rules then
    _G.log("ATTRIBUTE_CALC: ERROR! attribute_rules.lua not found.")
    return {}
end

local M = {}

-- List of valid attributes to scan for
local VALID_ATTRIBUTES = {
    -- Physical
    "STRENGTH", "AGILITY", "TOUGHNESS", "ENDURANCE", "RECUPERATION", "DISEASE_RESISTANCE",
    -- Mental
    "ANALYTICAL_ABILITY", "FOCUS", "WILLPOWER", "CREATIVITY", "INTUITION", "PATIENCE", 
    "MEMORY", "LINGUISTIC_ABILITY", "SPATIAL_SENSE", "KINESTHETIC_SENSE", "MUSICALITY",
    "EMPATHY", "SOCIAL_AWARENESS"
}

-- Mapping tokens
local ATTRIBUTE_TYPE_MAP = {
    ["STRENGTH"] = "PHYS_ATT_RANGE",
    ["AGILITY"] = "PHYS_ATT_RANGE",
    ["TOUGHNESS"] = "PHYS_ATT_RANGE",
    ["ENDURANCE"] = "PHYS_ATT_RANGE",
    ["RECUPERATION"] = "PHYS_ATT_RANGE",
    ["DISEASE_RESISTANCE"] = "PHYS_ATT_RANGE",
}

-- Custom Short Names for Description String
local ATTRIBUTE_SHORT_NAMES = {
    ["STRENGTH"] = "STRONG",
    ["AGILITY"] = "AGILE",
    ["TOUGHNESS"] = "TOUGH",
    ["ENDURANCE"] = "ENDURE",
    ["RECUPERATION"] = "RECOVER",
    ["DISEASE_RESISTANCE"] = "DIS_RES",
    ["ANALYTICAL_ABILITY"] = "ANALYZE",
    ["FOCUS"] = "FOCUS",
    ["WILLPOWER"] = "WIL_PWR",
    ["CREATIVITY"] = "CREATIV",
    ["INTUITION"] = "INTUITN",
    ["PATIENCE"] = "PATIENC",
    ["MEMORY"] = "MEMORY",
    ["LINGUISTIC_ABILITY"] = "LNGUIST",
    ["SPATIAL_SENSE"] = "SPT_SNS",
    ["KINESTHETIC_SENSE"] = "KIN_SNS",
    ["MUSICALITY"] = "MUSIC",
    ["EMPATHY"] = "EMPATHY",
    ["SOCIAL_AWARENESS"] = "SOC_AWR"
}

local function get_token_prefix(attr)
    return ATTRIBUTE_TYPE_MAP[attr] or "MENT_ATT_RANGE"
end

-- Shared Logic: Calculates the raw +/- score for all attributes
local function calculate_net_attribute_scores(config, components)
    local attribute_scores = {}
    for _, attr in ipairs(VALID_ATTRIBUTES) do
        attribute_scores[attr] = 0
    end

    local function process_weights(comp)
        if comp and comp.attribute_weight then
            for attr, weight_str in pairs(comp.attribute_weight) do
                if attribute_scores[attr] and type(weight_str) == "string" then
                    for i = 1, #weight_str do
                        local char = string.sub(weight_str, i, i)
                        if char == "+" then
                            attribute_scores[attr] = attribute_scores[attr] + 1
                        elseif char == "-" then
                            attribute_scores[attr] = attribute_scores[attr] - 1
                        end
                    end
                end
            end
        end
    end

    -- Scan sequence
    process_weights(components.rating)
    process_weights(components.size_variant)
    if config.COMPONENT_TABLES then
        for _, conf in ipairs(config.COMPONENT_TABLES) do
            local main_comp = components[conf.name]
            if main_comp then
                process_weights(main_comp)
                if main_comp.flowchart_selections then
                    for _, selection in ipairs(main_comp.flowchart_selections) do
                        process_weights(selection)
                    end
                end
            end
        end
    end

    return attribute_scores
end

-- 1. Generate RAW Tokens
function M.get_attribute_tokens(config, components)
    local final_tokens = {}
    local scores = calculate_net_attribute_scores(config, components)

    for _, attr in ipairs(VALID_ATTRIBUTES) do
        local score = scores[attr]
        
        if score ~= 0 then
            if score > 4 then score = 4 end
            if score < -4 then score = -4 end

            local tier_name = rules.TIERS[score]
            local range_str = rules.RANGES[tier_name]

            if range_str then
                local prefix = get_token_prefix(attr)
                local token = string.format("[%s:%s:%s]", prefix, attr, range_str)
                table.insert(final_tokens, token)
            end
        end
    end

    return final_tokens
end

-- 2. Generate Description String
-- Format: / APPROX_STAT = | STR= '+' || AGI= '----' |
function M.get_attribute_desc_string(config, components)
    local scores = calculate_net_attribute_scores(config, components)
    local parts = {}

    for _, attr in ipairs(VALID_ATTRIBUTES) do
        local score = scores[attr]
        if score ~= 0 then
            -- Clamp for display logic
            if score > 4 then score = 4 end
            if score < -4 then score = -4 end

            -- Determine Symbol
            local symbol = ""
            if score == 4 then symbol = "++++"      -- Was MAX
            elseif score == 3 then symbol = "+++"
            elseif score == 2 then symbol = "++"
            elseif score == 1 then symbol = "+"
            elseif score == -1 then symbol = "-"
            elseif score == -2 then symbol = "--"
            elseif score == -3 then symbol = "---"
            elseif score == -4 then symbol = "----" -- Was ZERO
            end

            -- Get Short Name
            local short_name = ATTRIBUTE_SHORT_NAMES[attr] or attr
            
            -- Format item: STR= '+'
            table.insert(parts, short_name .. "= (" .. symbol .. ")")
        end
    end

    -- Assemble final string
    if #parts > 0 then
        -- Join parts with " || " separator
        local content = table.concat(parts, " || ")
        -- Wrap in the requested container format
        return " _______________________________________________________ __________/ APPROX_STAT= | " .. content .. " |"
    end
    
    return ""
end

return M