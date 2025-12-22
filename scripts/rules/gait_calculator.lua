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

-- ============================================================================\
-- Helper: Recursive Net Speed Calculation
-- ============================================================================\
local function calculate_net_gaits(config, components)
    local net_gaits = {}

    -- 1. Initialize from config if present
    if config then
        for _, gait_key in ipairs(rules.VALID_GAITS) do
            if config[gait_key] then
                net_gaits[gait_key] = (net_gaits[gait_key] or 0) + config[gait_key]
            end
        end
    end

    -- 2. Recursive scanner for component tables
    local function scan_comp(comp)
        if not comp or type(comp) ~= "table" then return end
        
        -- Check for gaits in the current component
        if comp.gaits then
            for gait_key, value in pairs(comp.gaits) do
                net_gaits[gait_key] = (net_gaits[gait_key] or 0) + value
            end
        end

        -- Recurse into flowchart selections
        if comp.flowchart_selections then
            for _, sub_comp in ipairs(comp.flowchart_selections) do
                scan_comp(sub_comp)
            end
        end
    end

    -- 3. Scan top-level components
    if components then
        for _, comp in pairs(components) do
            scan_comp(comp)
        end
    end

    return net_gaits
end

-- ============================================================================\
-- Token Generation: Applying Variations
-- ============================================================================\
function M.generate_gait_lines(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local generated_lines = {}

    for _, gait_key in ipairs(rules.VALID_GAITS) do
        local lookup_speed = net_gaits[gait_key]
        if lookup_speed and lookup_speed > 0 then
            -- Cap the speed index at 87 (max defined in rules)
            if lookup_speed > 87 then lookup_speed = 87 end
            
            local speed_string = rules.SPEED_MAP[lookup_speed]
            if speed_string then
                -- The "Old" Way: Pass the gait key and the full speed string to a variation
                local line = string.format("[APPLY_CREATURE_VARIATION:%s:%s]", gait_key, speed_string)
                table.insert(generated_lines, line)
            else
                if _G.log then _G.log("GAIT_CALC: Warning - No speed map found for KPH: " .. tostring(lookup_speed)) end
            end
        end
    end

    return generated_lines
end

-- ============================================================================\
-- Description: Flavor Text
-- ============================================================================\
function M.get_gait_description(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local parts = {}

    for _, gait_key in ipairs(rules.VALID_GAITS) do
        local speed = net_gaits[gait_key]
        if speed and speed > 0 then
            local short_name = GAIT_SHORT_NAMES[gait_key] or "MOVE"
            table.insert(parts, short_name .. " = " .. speed .. " kph")
        end
    end

    if #parts > 0 then
        local content = table.concat(parts, " || ")
        return " _______________________________________________________ __________/ APPROX_SPEED= | " .. content
    end

    return ""
end

return M