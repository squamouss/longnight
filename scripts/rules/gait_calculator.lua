local rules = require("rules.gait_rules")
if not rules then
    if _G.log then _G.log("GAIT_CALC: ERROR! gait_rules.lua not found.") end
    return {}
end

local M = {}

local GAIT_SHORT_NAMES = {
    ["STANDARD_BIPED_GAITS"]        = "MOVE",
    ["STANDARD_QUADRUPED_GAITS"]    = "MOVE",
    ["STANDARD_FLYING_GAITS"]       = "FLY",
    ["STANDARD_SWIMMING_GAITS"]     = "SWIM",
    ["STANDARD_CRAWLING_GAITS"]     = "CRAWL",
    ["STANDARD_CLIMBING_GAITS"]     = "CLIMB",
    ["STANDARD_WALK_CRAWL_GAITS"]   = "CRAWL"
}

-- ============================================================================
-- Helper: Calculate Net Speed (KPH)
-- ============================================================================
-- Iterates through config, archetype, and components to sum up speed per gait type.
local function calculate_net_gaits(config, components)
    local net_gaits = {}

    -- Initialize from config if present
    if config then
        for _, gait_key in ipairs(rules.VALID_GAITS) do
            if config[gait_key] then
                net_gaits[gait_key] = (net_gaits[gait_key] or 0) + config[gait_key]
            end
        end
    end

    -- Iterate over components (e.g., archetype, size_variant, special_traits)
    if components then
        for _, comp_data in pairs(components) do
            if type(comp_data) == "table" then
                for _, gait_key in ipairs(rules.VALID_GAITS) do
                    if comp_data[gait_key] then
                        net_gaits[gait_key] = (net_gaits[gait_key] or 0) + comp_data[gait_key]
                    end
                end
            end
        end
    end

    return net_gaits
end

-- ============================================================================
-- Generator: Gait Strings (for RAWs)
-- ============================================================================
-- Returns a table of [APPLY_CREATURE_VARIATION:...] strings
function M.generate_gait_strings(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local generated_lines = {}

    for gait_key, speed_kph in pairs(net_gaits) do
        if speed_kph > 0 then
            -- Clamp speed to 87 (max defined in map)
            local lookup_speed = math.floor(speed_kph)
            if lookup_speed > 87 then lookup_speed = 87 end
            if lookup_speed < 1 then lookup_speed = 1 end

            local speed_string = rules.SPEED_MAP[lookup_speed]
            
            if speed_string then
                -- Format: [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:...]
                local line = string.format("[APPLY_CREATURE_VARIATION:%s:%s]", gait_key, speed_string)
                table.insert(generated_lines, line)
            else
                if _G.log then _G.log("GAIT_CALC: Warning - No speed map found for KPH: " .. tostring(lookup_speed)) end
            end
        end
    end

    return generated_lines
end

-- ============================================================================
-- Description: Flavor Text
-- ============================================================================
-- Returns a formatted string for the creature description
function M.get_gait_description(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local parts = {}

    -- We iterate through the VALID_GAITS list to maintain consistent order in the text
    for _, gait_key in ipairs(rules.VALID_GAITS) do
        local speed = net_gaits[gait_key]
        
        if speed and speed > 0 then
            local short_name = GAIT_SHORT_NAMES[gait_key] or "MOVE"
            -- Format: BIPED= 30 kph
            table.insert(parts, short_name .. "= " .. speed .. " kph")
        end
    end

    -- Assemble final string
    if #parts > 0 then
        local content = table.concat(parts, " || ")
        -- Matches the style of your attribute calculator
        return " _______________________________________________________ __________/ APPROX_SPEED= | " .. content
    end

    return ""
end

return M