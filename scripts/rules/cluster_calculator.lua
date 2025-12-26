local rules = require("rules.cluster_rules")
if not rules then
    _G.log("CLUSTER_CALC: ERROR! cluster_rules.lua not found or failed to load.")
    return {}
end

local M = {}

-- [[ SCANNER: Check tokens for overrides ]] --
local function get_token_override_key(components)
    local tokens_to_check = {}
    if components.size_variant and components.size_variant.tok then
        table.insert(tokens_to_check, components.size_variant.tok)
    end
    
    for _, raw_block in ipairs(tokens_to_check) do
        local raw_string = ""
        if type(raw_block) == "table" then
            raw_string = table.concat(raw_block, "\n")
        else
            raw_string = tostring(raw_block)
        end
        
        -- Priority Check: Colonies usually override other behaviors
        if string.find(raw_string, "VERMIN_SOIL_COLONY") then
            return "COLONY"
        elseif string.find(raw_string, "VERMIN_FISH") then
            return "FISH"
        end
    end
    
    return nil
end

local function get_sub_archetype(components, config)
    if config and config.COMPONENT_TABLES then
        for _, conf in ipairs(config.COMPONENT_TABLES) do
            local comp = components[conf.name]
            if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                return comp.sub_archetype[1]
            end
        end
    end
    if components.sub_archetypes and #components.sub_archetypes > 0 then
        return components.sub_archetypes[1]
    end
    return nil
end

-- [[ HELPER: Weighted Pick ]] --
local function pick_weighted_rule(options_list)
    local total_weight = 0
    for _, opt in ipairs(options_list) do
        total_weight = total_weight + (opt.weight or 1)
    end
    
    local rand_func = _G.trandom or math.random
    local roll
    if _G.trandom then
        roll = _G.trandom(total_weight)
    else
        roll = math.random(0, total_weight - 1)
    end
    
    local current = 0
    for _, opt in ipairs(options_list) do
        current = current + (opt.weight or 1)
        if roll < current then
            return opt
        end
    end
    return options_list[1] -- Fallback
end

function M.calculate_cluster_range(config, components)
    if not config or not components or not components.rating or not components.size_variant then
        return 1, 1
    end

    local archetype = config.ARCHETYPE_CLASS or "BIOMACHINE"
    local size_key = components.size_variant.name_part
    local sub_archetype = get_sub_archetype(components, config)
    local rating_tag = components.rating.tags and components.rating.tags[1]

    -- 1. Find Archetype Rules
    local archetype_rules = rules.RULES[archetype]
    if not archetype_rules then return 1, 1 end

    -- 2. Find Size Rules
    local size_rules = archetype_rules[size_key]
    if not size_rules then return 1, 1 end

    -- 3. Determine Rule Key (Override vs Rating)
    local rule_key = get_token_override_key(components)
    
    if not rule_key then
        -- If no override token, use the standard rating
        rule_key = rating_tag
    end

    -- 4. Resolve Entry
    local entry = nil
    
    if rule_key and size_rules[rule_key] then
        entry = size_rules[rule_key]
    else
        entry = size_rules["DEFAULT"]
    end

    if not entry then return 1, 1 end

    -- Handle Sub-Archetype override if entry is nested
    if entry[sub_archetype] then
        entry = entry[sub_archetype]
    end
    
    -- [[ NEW: Handle Multiple Options (Weighted List) ]] --
    -- If 'entry' is an array (has integer keys), pick one.
    if entry[1] then
        entry = pick_weighted_rule(entry)
    end

    -- 5. Calculate Decay Logic
    local min_val = entry.min or 1
    local max_cap = entry.max_cap or 1
    local decay = entry.decay or 0.0

    if max_cap <= min_val then
        return min_val, min_val
    end

    local calculated_max = min_val
    local rand_func = _G.trandom or math.random

    for i = min_val, max_cap - 1 do
        local roll = 0
        if _G.trandom then
            roll = (_G.trandom(100) + 1) / 100.0
        else
            roll = math.random()
        end

        if roll <= decay then
            calculated_max = calculated_max + 1
        else
            break 
        end
    end

    return min_val, calculated_max
end

function M.get_cluster_token(config, components)
    local min, max = M.calculate_cluster_range(config, components)
    
    if min == 1 and max == 1 then
        return "" 
    end

    return "[CLUSTER_NUMBER:" .. tostring(min) .. ":" .. tostring(max) .. "]"
end

return M