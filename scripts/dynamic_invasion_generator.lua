-- ====================================================================
-- MODULE REQUIREMENTS
-- ====================================================================
local data_manager = require("civ_data.data_manager")
local flowchart_data = data_manager.flowchart_data
local common_data = data_manager.common_data
local creature_engine = require("creature_generator_engine")

local all_generated_invasion_civ_raws = {}

-- ====================================================================
-- UTILITY FUNCTIONS
-- ====================================================================

local function log(msg)
    if _G.log then _G.log(msg) end
end

local function split_to_lines(tbl, str)
    if str then
        table.insert(tbl, str)
    end
    return tbl
end

local function weighted_pick_random(t)
    if not t or #t == 0 then return nil end
    local total_weight = 0
    for _, item in ipairs(t) do
        total_weight = total_weight + (item.weight or 1)
    end
    if total_weight == 0 then return nil end
    local random_value = math.random() * total_weight
    local current_weight = 0
    for _, item in ipairs(t) do
        current_weight = current_weight + (item.weight or 1)
        if random_value <= current_weight then return item end
    end
    return nil
end

local function weighted_pick_random_no_replace(t)
    if not t or #t == 0 then return nil end
    local total_weight = 0
    for _, item in ipairs(t) do
        total_weight = total_weight + (item.weight or 1)
    end
    if total_weight == 0 then return nil end
    local random_value = math.random() * total_weight
    local current_weight = 0
    for i, item in ipairs(t) do
        current_weight = current_weight + (item.weight or 1)
        if random_value <= current_weight then
            table.remove(t, i)
            return item
        end
    end
    return nil
end

local function apply_flowchart_data(civ_tbl, flowchart_specific)
    if not flowchart_specific then return civ_tbl end
    for _, name in ipairs(flowchart_specific) do
        local data = flowchart_data[name]
        if data then
            -- Assuming simple string insertion or complex handling depending on data structure
            -- Using a generic insertion here based on common patterns
            if type(data) == "table" then
                for _, line in ipairs(data) do
                    table.insert(civ_tbl, line)
                end
            elseif type(data) == "string" then
                table.insert(civ_tbl, data)
            end
        end
    end
    return civ_tbl
end

local function detect_weapon_theme_from_lines(civ_tbl)
    -- Simple heuristic to detect weapon themes if present in the raw lines
    for _, line in ipairs(civ_tbl) do
        if line:find("WEAPON_THEME") then
            return line:match("WEAPON_THEME:([%w_]+)")
        end
    end
    return nil
end

-- ====================================================================
-- MAIN GENERATION HOOK
-- ====================================================================

local function prepare_civilization_data_hook(config)
    log("INV_GEN_LOG: Starting Invasion Force Preparation Hook...")
    
    if not creature_engine.forced_creature_types then
        log("INV_GEN_LOG: No forced creature types found in registry.")
        return
    end

    local forced_types = creature_engine.forced_creature_types
    local civ_counter = 1

    -- [[ FIX APPLIED: FILTER BY CONFIG ]] --
    -- Previously, this loop iterated over ALL forced_creature_types every time the hook ran.
    -- Now, we check if the candidate's archetype matches the current config's archetype.
    
    for token, candidate in pairs(forced_types) do
        local should_generate = false
        
        -- Check 1: Does the candidate have an explicit archetype field?
        if candidate.archetype and config.ARCHETYPE_CLASS then
            if candidate.archetype == config.ARCHETYPE_CLASS then
                should_generate = true
            end
        -- Check 2: Fallback - Does the token string contain the archetype class?
        elseif config.ARCHETYPE_CLASS and string.find(token, config.ARCHETYPE_CLASS) then
            should_generate = true
        end

        if should_generate then
            log("INV_GEN_LOG: Processing forced candidate: " .. token)

            local civ_tbl = {}
            local entity_id = "MOUNTED_INVASION_FORCE_" .. token
            
            -- Basic Entity Definition
            split_to_lines(civ_tbl, "[ENTITY:" .. entity_id .. "]")
            split_to_lines(civ_tbl, "[CREATURE:" .. token .. "]")
            split_to_lines(civ_tbl, "[TRANSLATION:GOBLIN]") -- Defaulting to Goblin for invasions
            split_to_lines(civ_tbl, "[DIGGER:ITEM_WEAPON_PICK]")
            split_to_lines(civ_tbl, "[WEAPON:ITEM_WEAPON_AXE_BATTLE]")
            split_to_lines(civ_tbl, "[WEAPON:ITEM_WEAPON_SPEAR]")
            split_to_lines(civ_tbl, "[ARMOR:ITEM_ARMOR_BREASTPLATE:COMMON]")
            
            -- Hostile behaviors
            split_to_lines(civ_tbl, "[SIEGER]")
            split_to_lines(civ_tbl, "[AMBUSHER]")
            split_to_lines(civ_tbl, "[BABYSNATCHER]")
            split_to_lines(civ_tbl, "[ITEM_THIEF]")
            split_to_lines(civ_tbl, "[SKULKING]") 
            
            -- Process Entity Tables defined in the candidate
            local flowchart_specific = {}
            local common_specific = {}

            if candidate.entity_tables then
                for _, tbl_name in ipairs(candidate.entity_tables) do
                    if flowchart_data and flowchart_data[tbl_name] then
                        table.insert(flowchart_specific, tbl_name)
                    elseif common_data and common_data[tbl_name] then
                        table.insert(common_specific, tbl_name)
                    end
                end
            end

            -- 1. Apply Common Data (Random Pick)
            for _, name in ipairs(common_specific) do
                local data = common_data[name]
                if data then
                    local entry = weighted_pick_random(data)
                    if entry then
                        split_to_lines(civ_tbl, entry.value)
                    end
                end
            end

            -- 2. Apply Flowchart Data (Hierarchical)
            civ_tbl = apply_flowchart_data(civ_tbl, flowchart_specific)

            -- [[ NEW LOGIC: Scan the generated civ_tbl to find the weapon theme ]] --
            local detected_theme = detect_weapon_theme_from_lines(civ_tbl)
            if detected_theme then
                if candidate.data_entry then
                    candidate.data_entry.weapon_theme = detected_theme
                end
                log("INV_GEN_LOG: Detected Weapon Theme [" .. detected_theme .. "] for invasion civ " .. token)
            end
            -- [[ END NEW LOGIC ]] --

            table.insert(all_generated_invasion_civ_raws, civ_tbl)
            log("INV_GEN_LOG: Prepared invasion entity for " .. token)
            
            civ_counter = civ_counter + 1
        end
    end
end

local function generate_civilizations_hook()
    log("INV_GEN_LOG: Invasion Generation Hook Called (No-op, separate registration used).")
end

local M = {}
M.prepare_civilization_data_hook = prepare_civilization_data_hook
M.generate_civilizations_hook = generate_civilizations_hook
M.register_all_generated_civilizations = function()
    if raws and raws.register_entities and #all_generated_invasion_civ_raws > 0 then
        log("INV_GEN_LOG: Registering " .. #all_generated_invasion_civ_raws .. " invasion entities...")
        for _, entity in ipairs(all_generated_invasion_civ_raws) do
            raws.register_entities(entity)
        end
        -- Clear after registration to prevent duplicate registration if called multiple times
        all_generated_invasion_civ_raws = {} 
    else
        log("INV_GEN_LOG: No invasion entities to register.")
    end
end

return M