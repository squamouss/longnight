local rules = require("rules.population_rules")
if not rules then
    _G.log("POP_CALC: ERROR! population_rules.lua not found or failed to load.")
    return {}
end

local M = {}

local TARGET_RATINGS = {
    ["VERMIN"] = true,
    ["AMBIENT"] = true,
    ["DANGEROUS"] = true,
    ["HAZARDOUS"] = true,
    ["BENIGN"] = true,
    ["PROBLEMATIC"] = true
}

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

function M.get_population_token(config, components)
    if not config or not components or not components.rating or not components.rating.tags or not components.size_variant then
        return ""
    end

    local rating_tag = components.rating.tags[1]
    if not rating_tag or not TARGET_RATINGS[rating_tag] then
        return "" 
    end

    local archetype = config.ARCHETYPE_CLASS or "BIOMACHINE"
    local size_key = components.size_variant.name_part
    local sub_archetype = get_sub_archetype(components, config)

    local archetype_rules = rules.RULES[archetype]
    if not archetype_rules then return "" end

    local size_rules = archetype_rules[size_key]
    if not size_rules then return "" end

    local rating_entry = size_rules[rating_tag]
    if not rating_entry then return "" end

    local pop_string = nil

    if type(rating_entry) == "string" then
        pop_string = rating_entry
    elseif type(rating_entry) == "table" then
        if sub_archetype and rating_entry[sub_archetype] then
            pop_string = rating_entry[sub_archetype]
        else
            pop_string = rating_entry["DEFAULT"]
        end
    end

    if pop_string then
        return "[POPULATION_NUMBER:" .. pop_string .. "]"
    end

    return ""
end

return M