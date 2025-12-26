-- config/rules/firewall_calculator.lua

local log = _G.log or function(...) end

-- ============================================================================
-- 1. ROBUST MODULE LOADING
-- ============================================================================
-- We use a helper to try loading the rules from 'rules/' folder first,
-- and then fall back to the root folder. This fixes issues where running
-- standalone scripts might not find the files if they aren't in a strict subdirectory.

local function load_affinity_module(module_name)
    -- 1. Try "rules.module_name" (Standard DF structure)
    local status, mod = pcall(require, "rules." .. module_name)
    if status and mod then return mod end

    -- 2. Try "module_name" (Flat/Standalone structure)
    status, mod = pcall(require, module_name)
    if status and mod then return mod end

    return nil
end

local digital_rules = load_affinity_module("affinity_digital")
if not digital_rules then
    log("FIREWALL_CALC: ERROR! 'affinity_digital.lua' could not be found in 'rules/' or root. Using defaults (Score 0).")
    digital_rules = { ARCHETYPE_BASE = {}, RATING_MODIFIERS = {}, SUB_ARCHETYPE_MODIFIERS = {} }
end

local energy_rules = load_affinity_module("affinity_energy")
if not energy_rules then
    log("FIREWALL_CALC: WARNING! 'affinity_energy.lua' not found. Using defaults.")
    energy_rules = { ARCHETYPE_BASE = {}, RATING_MODIFIERS = {}, SUB_ARCHETYPE_MODIFIERS = {} }
end

local nanite_rules = load_affinity_module("affinity_nanite")
if not nanite_rules then
    log("FIREWALL_CALC: WARNING! 'affinity_nanite.lua' not found. Using defaults.")
    nanite_rules = { ARCHETYPE_BASE = {}, RATING_MODIFIERS = {}, SUB_ARCHETYPE_MODIFIERS = {} }
end

local M = {}

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================

-- Helper to extract the Sub-Archetype string (e.g., "HORROR", "DEVIL", "HUMAN")
local function get_sub_archetype(components, config)
    -- 1. Check specific component definition tables first
    if config and config.COMPONENT_TABLES then
        for _, conf in ipairs(config.COMPONENT_TABLES) do
            local comp = components[conf.name]
            if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                return comp.sub_archetype[1]
            end
        end
    end
    -- 2. Fallback to the general sub_archetypes list in components
    if components.sub_archetypes and #components.sub_archetypes > 0 then
        return components.sub_archetypes[1]
    end
    return "UNKNOWN"
end

-- Generic function to calculate a score based on a specific ruleset
local function calculate_score_generic(rules, config, components)
    if not config or not components or not components.rating then
        return 0
    end

    -- Extract Key Identifiers
    local archetype = config.ARCHETYPE_CLASS or "DEFAULT"
    local rating_tag = (components.rating.tags and components.rating.tags[1]) or "DEFAULT"
    local sub_archetype = get_sub_archetype(components, config)

    -- 1. Base Score
    local base_table = rules.ARCHETYPE_BASE or {}
    local base = base_table[archetype] or base_table["DEFAULT"] or 0

    -- 2. Rating Modifier
    local rating_table = rules.RATING_MODIFIERS or {}
    local r_mod = rating_table[rating_tag] or 0
    
    -- 3. Sub-Archetype Modifier
    local sub_table = rules.SUB_ARCHETYPE_MODIFIERS or {}
    local s_mod = sub_table[sub_archetype] or 0

    -- Sum and Clamp
    local total = base + r_mod + s_mod
    
    if total < 0 then total = 0 end
    -- Assuming a theoretical max cap of 6 (S rank), but the logic allows higher if needed.
    if total > 6 then total = 6 end 

    return math.floor(total)
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

-- Calculates the Digital / Firewall score
function M.calculate_firewall_score(config, components)
    return calculate_score_generic(digital_rules, config, components)
end

-- Calculates the Energy Flux score
function M.calculate_energy_score(config, components)
    return calculate_score_generic(energy_rules, config, components)
end

-- Calculates the Nanomachine Density score
function M.calculate_nanomachine_score(config, components)
    return calculate_score_generic(nanite_rules, config, components)
end

-- Generates the Creature Class Tokens for all 3 affinities
-- Returns a string of tokens.
-- Result: "[CREATURE_CLASS:INNATE_FIREWALL_#]\n[CREATURE_CLASS:INNATE_ENERGY_#]..."
function M.get_firewall_token(config, components)
    local fw_score = M.calculate_firewall_score(config, components)
    local en_score = M.calculate_energy_score(config, components)
    local nano_score = M.calculate_nanomachine_score(config, components)
    
    return "[CREATURE_CLASS:INNATE_FIREWALL_" .. fw_score .. "]\n" ..
           "[CREATURE_CLASS:INNATE_ENERGY_" .. en_score .. "]\n" ..
           "[CREATURE_CLASS:INNATE_NANOMACHINE_" .. nano_score .. "]"
end

-- Generates the Visual Description String for the View Unit screen
-- Result example: " ________________/NET_DEFENSE_5/ENERGY_FLUX_3/NANO_DENSITY_1"
-- This uses underscores to create a visual separator in the UI.
function M.get_firewall_description_string(config, components)
    -- Calculate scores safely (default to 0 on nil)
    local fw_score = M.calculate_firewall_score(config, components) or 0
    local en_score = M.calculate_energy_score(config, components) or 0
    local nano_score = M.calculate_nanomachine_score(config, components) or 0
    
    -- Construct the string. 
    local desc = " _______________________________________________________ __________/NET_DEFENSE_" .. fw_score .. "/ENERGY_FLUX_" .. en_score .. "/NANO_DENSITY_" .. nano_score
    
    return desc
end

return M