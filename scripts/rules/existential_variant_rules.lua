local M = {}

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local VARIANT_POOLS = {
    BIOMACHINE = {
        DEVIL = {
            GNT = {
                { token = "[SEMIMEGABEAST]", weight = 100, log_name = "DEVIL SEMIMEGABEAST" }
            },
            TTN = {
                { token = "[MEGABEAST]", weight = 50, log_name = "DEVIL SEMIMEGABEAST" },
                { token = "[FEATURE_BEAST]", weight = 50, log_name = "DEVIL FORGOTTENBEAST" }
            }
        },
        OGRE = {
            GNT = {
                { token = "[SEMIMEGABEAST]", weight = 100, log_name = "OGRE SEMIMEGABEAST" }
            },
            TTN = {
                { token = "[MEGABEAST]", weight = 20, log_name = "OGRE SEMIMEGABEAST" },
                { token = "[FEATURE_BEAST]", weight = 80, log_name = "OGRE FORGOTTENBEAST" }
            }
        }
    }
}


-- ============================================================================
-- INTERNAL LOGIC
-- ============================================================================
local function pick_weighted(pool)
    if not pool then return "" end
    
    local total_weight = 0
    for _, item in ipairs(pool) do
        total_weight = total_weight + (item.weight or 1)
    end

    if total_weight == 0 then return "" end

    local rand_val
    if _G.trandom then
        rand_val = _G.trandom(total_weight)
    else
        rand_val = math.random(0, total_weight - 1)
    end

    local current = 0
    for _, item in ipairs(pool) do
        current = current + (item.weight or 1)
        if rand_val < current then
            return item.token
        end
    end
    
    return ""
end

local function detect_sub_archetype(config, components)
    if not components then return "UNKNOWN" end
    
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

    return "UNKNOWN"
end

local function detect_size_key(components)
    if components and components.size_variant and components.size_variant.name_part then
        return components.size_variant.name_part -- e.g., "GNT", "TTN"
    end
    return "DEFAULT"
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

--- Checks if the creature is EXISTENTIAL, matches exact criteria, then returns weighted token.
function M.get_existential_token(config, components)
    -- 1. Safety Checks
    if not components or not components.rating or not components.rating.tags then
        return ""
    end

    -- 2. Check for the specific Rating Tag
    local is_target_rating = false
    for _, tag in ipairs(components.rating.tags) do
        if tag == "EXISTENTIAL" then
            is_target_rating = true
            break
        end
    end

    if not is_target_rating then
        return ""
    end

    -- 3. Identify Context
    local archetype = (config and config.ARCHETYPE_CLASS) or "DEFAULT"
    local sub_archetype = detect_sub_archetype(config, components)
    local size_key = detect_size_key(components)

    -- 4. Strict Selection (No Fallbacks)
    -- If any step returns nil, the chain breaks and returns ""
    local arch_pool = VARIANT_POOLS[archetype]
    if not arch_pool then return "" end

    local sub_pool = arch_pool[sub_archetype]
    if not sub_pool then return "" end

    local size_pool = sub_pool[size_key]
    if not size_pool then return "" end

    -- 5. Calculate and return
    return pick_weighted(size_pool)
end

return M