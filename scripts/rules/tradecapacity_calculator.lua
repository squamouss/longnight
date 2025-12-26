
local M = {}
local log = _G.log or function(...) print(table.concat({...}, "\t")) end

local ARCHETYPE_MODIFIERS = {
    CHIMERA = 0.5,
    POLYMERID = 0.5,
    PALEOCHIMERA = 0.5,
    SILICID = 0.5,
    ELASTOMERID = 0.5,
    PROTOCHIMERA = 0.5
}


---
--- Calculates the raw trade capacity value.
---
function M.calculate_trade_capacity(config, components)
    -- Guard clauses: Ensure we have all the data we need.
    if not components or
       not components.rating or
       not components.rating.tags or
       not components.rating.tags[1] or
       not components.final_adult_size or
       components.final_adult_size == 0 or
       not config or 
       not config.ARCHETYPE_CLASS then 
        return 0
    end

    local rating_key = components.rating.tags[1]
    local size = components.final_adult_size
    local archetype = config.ARCHETYPE_CLASS 
    local calculated_capacity = 0

    if rating_key == "NOMAD" then
        -- NOMAD: size / 100
        calculated_capacity = size / 100
        log("TRADECAP_CALC: Creature is NOMAD. Base size: " .. size .. ". Base capacity: " .. calculated_capacity)

    elseif rating_key == "CARRIER" then
        -- CARRIER: (size / 100) * 2
        calculated_capacity = (size / 100) * 2
        log("TRADECAP_CALC: Creature is CARRIER. Base size: " .. size .. ". Base capacity: " .. calculated_capacity)
    
    else
        return 0
    end

    local modifier = ARCHETYPE_MODIFIERS[archetype]
    if modifier then
        calculated_capacity = calculated_capacity * modifier
        log("TRADECAP_CALC: Applying archetype modifier for " .. archetype .. " (" .. modifier .. "x). Final capacity: " .. calculated_capacity)
    end
    
    return math.floor(calculated_capacity)
end

function M.get_trade_capacity_token(config, components)
    local score = M.calculate_trade_capacity(config, components)
    
    if score > 0 then
        return "[TRADE_CAPACITY:" .. tostring(score) .. "]"
    end
    
    return ""
end

return M