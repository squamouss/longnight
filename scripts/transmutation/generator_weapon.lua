local function script_log(...)
    if _G.log then _G.log(...) end
end

local M = {}

-- =============================================================================
--  HELPER FUNCTIONS
-- =============================================================================
local function split_to_lines(current_lines_table, raw_block)
    if not raw_block then return current_lines_table end
    
    local content_type = type(raw_block)
    if content_type == 'string' then
        for line in raw_block:gmatch("[^\r\n]+") do
            if line:match("%S") then 
                table.insert(current_lines_table, line)
            end
        end
    elseif content_type == 'table' then
        for _, line in ipairs(raw_block) do
            if type(line) == 'string' and line:match("%S") then
                 table.insert(current_lines_table, line)
            end
        end
    end
    return current_lines_table
end

local function table_merge(t1, t2)
    for _, v in ipairs(t2) do
        table.insert(t1, v)
    end
    return t1
end

-- Ensure add_generated_info is available
local function add_generated_info(lines)
    if _G.add_generated_info then
        _G.add_generated_info(lines)
    else
        table.insert(lines, "[GENERATED]")
    end
end

-- =============================================================================
--  CONFIGURATION & CONSTANTS
-- =============================================================================
local MAKE_REACTIONS_FREE_FOR_TESTING = true

local NODE_MAP = {
    { name = "First Weapon Node",  syn_class = "WEAPON_NODE_1" },
    { name = "Second Weapon Node", syn_class = "WEAPON_NODE_2" },
    { name = "Third Weapon Node",  syn_class = "WEAPON_NODE_3" },
    { name = "Fourth Weapon Node", syn_class = "WEAPON_NODE_4" },
    { name = "Fifth Weapon Node",  syn_class = "WEAPON_NODE_5" },
    { name = "Sixth Weapon Node",  syn_class = "WEAPON_NODE_6" },
    { name = "Seventh Weapon Node",syn_class = "WEAPON_NODE_7" },
    { name = "Eighth Weapon Node", syn_class = "WEAPON_NODE_8" },
    { name = "Ninth Weapon Node",  syn_class = "WEAPON_NODE_9" },
    { name = "Tenth Weapon Node",  syn_class = "WEAPON_NODE_10" },
}

local UNLOCK_TIERS = {
    { suffix = "TIER_1", prob = 1 },
    { suffix = "TIER_2", prob = 5 },
    { suffix = "TIER_3", prob = 10 },
}

-- =============================================================================
--  BUILDER FUNCTIONS
-- =============================================================================

local function build_secret_interaction(config, node_data, i)
    local lines = {}
    table.insert(lines, string.format("[INTERACTION:%s_NODE%d_SECRET]", config.SECRET_PREFIX, i))
    add_generated_info(lines)

    -- CHANGED: Generate specific class name (e.g. AUTOGUN_NODE10)
    local syn_class = string.format("%s_NODE%d", config.ID_PREFIX, i)
    
    -- Helper for shorter format calls
    local function f(fmt, ...) return string.format(fmt, ...) end

    table.insert(lines, "    [I_SOURCE:DEITY]")
    table.insert(lines, "        [IS_USAGE_HINT:MAJOR_CURSE]")
    table.insert(lines, "        [IS_HIST_STRING_1: the infodeity was challenged in the Datasphere by ]")
    table.insert(lines, f("        [IS_HIST_STRING_2: who gained Combat Program- %s (%s) from them]", config.SECRET_NAME, node_data.name))
    
    table.insert(lines, "    [I_SOURCE:SECRET]")
    table.insert(lines, f("        [IS_NAME:the Combat Program- %s (%s)]", config.SECRET_NAME, node_data.name))
    table.insert(lines, "        [IS_SECRET_GOAL:IMMORTALITY]")
    table.insert(lines, "        [IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]")
    table.insert(lines, "        [IS_SECRET:MUNDANE_RECORDING_POSSIBLE:BOOK_INSTRUCTION:SECRET_COMBAT]")
    
    table.insert(lines, "    [I_SOURCE:INGESTION]")
    table.insert(lines, "        [IS_HIST_STRING_1: consumed the nanite-infused blood of ]")
    table.insert(lines, "        [IS_HIST_STRING_2: and gained their power]")
    
    table.insert(lines, "    [I_TARGET:A:CREATURE]")
    table.insert(lines, "        [IT_LOCATION:CONTEXT_CREATURE]")
    table.insert(lines, "        [IT_REQUIRES:CAN_LEARN]")
    table.insert(lines, f("        [IT_REQUIRES:CAN_SPEAK][IT_CANNOT_HAVE_SYNDROME_CLASS:%s]", syn_class))
    
    table.insert(lines, "    [I_EFFECT:ADD_SYNDROME]")
    table.insert(lines, "        [IE_TARGET:A]")
    table.insert(lines, "        [IE_IMMEDIATE]")
    table.insert(lines, f("        [IE_ARENA_NAME:%s %s]", config.WEAPON_NAME, node_data.name))
    table.insert(lines, "        [SYNDROME]")
    table.insert(lines, f("            [SYN_CLASS:%s]", syn_class))
    table.insert(lines, "            [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]")
    table.insert(lines, "            [CE_BODY_MAT_INTERACTION:MAT_TOKEN:RESERVED_BLOOD:START:0]")
    table.insert(lines, f("                [CE:INTERACTION:%s_NODE%d_SECRET]", config.SECRET_PREFIX, i))
    table.insert(lines, "                [CE:SYNDROME_TAG:SYN_INJECTED]")
    table.insert(lines, "            [CE_CAN_DO_INTERACTION:PROB:100:START:0]")
    table.insert(lines, f("                [CDI:ADV_NAME:download %s_NODE%d]", config.ID_PREFIX, i))
    table.insert(lines, "                [CDI:USAGE_HINT:DEFEND]")
    table.insert(lines, f("                [CDI:INTERACTION:%s_NODE%d]", config.PAYLOAD_PREFIX, i))
    table.insert(lines, "                [CDI:TARGET:A:SELF_ONLY]")
    table.insert(lines, f("                [CDI:WAIT_PERIOD:%d]", config.CONSTRUCT_WAIT_PERIOD))
    table.insert(lines, f("                [CDI:VERB:%s]", config.CONSTRUCT_VERB))

    return lines
end

local function build_payload_ce_block(config, node_data, size_class, cooldown, start_time, end_time, max_targets, node_index)
    -- CHANGED: ADV_NAME:fire AUTOGUN_NODE1
    local adv_name = string.format("fire %s_NODE%d", config.ID_PREFIX, node_index)
    
    return string.format([[
        [SYNDROME]
            [SYN_AFFECTED_CLASS:%s]
            [CE_CAN_DO_INTERACTION:PROB:100:START:%d:END:%d:DWF_STRETCH:%d]
                [CDI:ADV_NAME:%s]
                [CDI:USAGE_HINT:ATTACK]
                [CDI:INTERACTION:MATERIAL_EMISSION]
                [CDI:MATERIAL:%s:%s]
                [CDI:TARGET:C:%s]
                [CDI:TARGET_RANGE:C:%d]
                [CDI:MAX_TARGET_NUMBER:C:%d]
                [CDI:WAIT_PERIOD:%d]
                [CDI:VERB:%s]
]], 
    size_class, start_time, end_time, config.PAYLOAD_DWF_STRETCH, adv_name,
    config.PAYLOAD_PROJECTILE_MAT, config.PAYLOAD_PROJECTILE_TYPE, 
    config.PAYLOAD_TARGET_TYPE, 
    config.PAYLOAD_RANGE, 
    max_targets, 
    cooldown, 
    config.PAYLOAD_VERB
    )
end

local function build_payload_interaction(config, node_data, i)
    local lines = {
        string.format("[INTERACTION:%s_NODE%d]", config.PAYLOAD_PREFIX, i),
    }
    add_generated_info(lines)

    table.insert(lines, "    [I_TARGET:A:CREATURE]")
    table.insert(lines, "        [IT_LOCATION:CONTEXT_CREATURE]")
    table.insert(lines, "        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]")
    table.insert(lines, "    [I_EFFECT:ADD_SYNDROME]")
    table.insert(lines, "        [IE_TARGET:A]")
    table.insert(lines, "        [IE_IMMEDIATE]")
    
    local cooldowns = config.PAYLOAD_COOLDOWNS
    local max_targets = config.PAYLOAD_MAX_TARGETS
    
    local start_time = config.PAYLOAD_TELEGRAPH_TICKS
    local end_time = start_time + config.PAYLOAD_WINDOW_DURATION

    -- CHANGED: Added 'i' as the last argument to build_payload_ce_block calls
    table_merge(lines, split_to_lines({}, 
        build_payload_ce_block(config, node_data, "SIZE_MEDIUM", cooldowns.NORMAL, start_time, end_time, max_targets.NORMAL, i)
    ))
    table_merge(lines, split_to_lines({}, 
        build_payload_ce_block(config, node_data, "SIZE_LARGE", cooldowns.LARGE, start_time, end_time, max_targets.LARGE, i)
    ))
    table_merge(lines, split_to_lines({}, 
        build_payload_ce_block(config, node_data, "SIZE_HUGE", cooldowns.HUGE, start_time, end_time, max_targets.HUGE, i)
    ))
    
    return lines
end

local function build_inorganic_tablet(config, node_data, i)
    local lines = {}
    table.insert(lines, string.format("[INORGANIC:%s%d_PROGRAM]", config.ID_PREFIX, i))
    add_generated_info(lines)

    -- CHANGED: Generate specific class name (e.g. AUTOGUN_NODE10)
    local syn_class = string.format("%s_NODE%d", config.ID_PREFIX, i)

    local rest_of_raw = string.format([[
    [USE_MATERIAL_TEMPLATE:MUSCLE_TABLET_TEMPLATE][MEAT][SPECIAL]
    [STATE_NAME_ADJ:ALL_SOLID:%s- %s][DISPLAY_COLOR:%s][TILE:%s]
    [MELTING_POINT:12070]
    [SOLID_DENSITY:400]
    [MEAT_NAME:NONE:data packet- %s_NODE%d:data packets- %s_NODE%d:]
    [SYNDROME]
        [SYN_INGESTED]
        [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]
		
        [CE_CAN_DO_INTERACTION:PROB:100:START:0]
            [CDI:ADV_NAME:download %s_NODE%d]
            [CDI:USAGE_HINT:DEFEND]
            [CDI:INTERACTION:%s_NODE%d]
            [CDI:TARGET:A:SELF_ONLY]
            [CDI:WAIT_PERIOD:%d]
            [CDI:VERB:%s]
]],
    config.TABLET_NAME, node_data.name, config.TABLET_COLOR, config.TABLET_TILE,
    config.ID_PREFIX, i, config.ID_PREFIX, i, -- CHANGED: MEAT_NAME format
    syn_class, syn_class, -- Changed from node_data.syn_class
    config.ID_PREFIX, i, -- CHANGED: ADV_NAME:download AUTOGUN_NODE1
    config.PAYLOAD_PREFIX, i,
    config.CONSTRUCT_WAIT_PERIOD,
    config.CONSTRUCT_VERB
    )
    
    table_merge(lines, split_to_lines({}, rest_of_raw))
    return lines
end

local function build_fortress_reaction(config, node_data, i)
    local lines = {
        string.format("[REACTION:%s%d_PROGRAM]", config.ID_PREFIX, i),
    }
    add_generated_info(lines)

    table.insert(lines, string.format("    [NAME:Combat Program- %s- %s]", config.WEAPON_NAME, node_data.name))
    table.insert(lines, string.format("    [FORTRESS_MODE_ENABLED][BUILDING:%s:NONE]", config.FORT_BUILDING))
    
    if not MAKE_REACTIONS_FREE_FOR_TESTING then
        table.insert(lines, string.format("    [REAGENT:blank tablet:1:TOOL:%s:%s]", config.FORT_REAGENT_TABLET, config.FORT_REAGENT_MATERIAL))
    end
    
    table.insert(lines, string.format("    [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s%d_PROGRAM]", config.ID_PREFIX, i))
    table.insert(lines, "    [SKILL:EXTRACT_STRAND]")
    table.insert(lines, string.format("    [DESCRIPTION:An edible tablet that grants an eligible life form a permanent %s, designated %s.]", config.WEAPON_NAME, node_data.name))
    table.insert(lines, string.format("    [CATEGORY:%s]", config.FORT_CATEGORY_ID))
    
    if i == 1 then
        table.insert(lines, string.format("    [CATEGORY_NAME:%s]", config.FORT_CATEGORY_NAME))
        table.insert(lines, string.format("    [CATEGORY_DESCRIPTION:%s]", config.FORT_CATEGORY_DESC))
    end
    
    return lines
end

local function build_adventure_reaction(config, node_data, i)
    local lines = {
        string.format("[REACTION:%s%d_PROGRAM_ADV]", config.ID_PREFIX, i),
    }
    add_generated_info(lines)

    table.insert(lines, string.format("    [NAME:combat program- %s- %s]", config.WEAPON_NAME, node_data.name))
    table.insert(lines, "    [ADVENTURE_MODE_ENABLED]")
    
    if not MAKE_REACTIONS_FREE_FOR_TESTING then
        table.insert(lines, string.format("    [REAGENT:scrap:%d:TOOL:%s:%s]", config.ADV_SCRAP_COST, config.ADV_REAGENT_SCRAP, config.ADV_REAGENT_MATERIAL))
        table.insert(lines, string.format("    [REAGENT:tool:1:TOOL:%s:NONE:NONE][PRESERVE_REAGENT]", config.ADV_REAGENT_TOOL))
    end
    
    table.insert(lines, string.format("    [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s%d_PROGRAM]", config.ID_PREFIX, i))
    table.insert(lines, "    [SKILL:EXTRACT_STRAND]")
    table.insert(lines, string.format("    [CATEGORY:%s]", config.ADV_CATEGORY_ID))

    if i == 1 then
        table.insert(lines, string.format("    [CATEGORY_NAME:%s]", config.ADV_CATEGORY_NAME))
        table.insert(lines, string.format("    [CATEGORY_DESCRIPTION:%s]", config.ADV_CATEGORY_DESC))
    end
    
    return lines
end

-- =============================================================================
--  UNLOCK SYSTEM BUILDERS
-- =============================================================================

-- 1. Per-Weapon Unlock (e.g., NANOWEB_UNLOCK_TIER_1)
local function build_tier_unlocks(config)
    local lines = {}
    
    for _, tier in ipairs(UNLOCK_TIERS) do
        table.insert(lines, string.format("[INTERACTION:%s_UNLOCK_%s]", config.ID_PREFIX, tier.suffix))
        add_generated_info(lines)

        local header = [[
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
]]
        table_merge(lines, split_to_lines({}, header))

        for i, node_data in ipairs(NODE_MAP) do
            -- CHANGED: Generate specific class name (e.g. AUTOGUN_NODE10)
            local syn_class = string.format("%s_NODE%d", config.ID_PREFIX, i)

            local synd_block = string.format([[
        [SYNDROME]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [CE_CAN_DO_INTERACTION:PROB:%d:START:0]
                [CDI:ADV_NAME:download %s_NODE%d]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:INTERACTION:%s_NODE%d]
                [CDI:TARGET:A:SELF_ONLY]
                [CDI:WAIT_PERIOD:%d]
                [CDI:VERB:%s]
]],
            syn_class, syn_class, -- Changed from node_data.syn_class
            tier.prob,
            config.ID_PREFIX, i, -- CHANGED: ADV_NAME:download AUTOGUN_NODE1
            config.PAYLOAD_PREFIX, i,
            config.CONSTRUCT_WAIT_PERIOD,
            config.CONSTRUCT_VERB
            )
            table_merge(lines, split_to_lines({}, synd_block))
        end
    end
    return lines
end

-- 2. Global "All Guns" Unlock (e.g., ALL_GUNS_UNLOCK_TIER_1)
local function build_all_guns_unlocks(loaded_configs)
    local lines = {}
    
    for _, tier in ipairs(UNLOCK_TIERS) do
        -- Create one massive interaction for this tier
        table.insert(lines, string.format("[INTERACTION:ALL_GUNS_UNLOCK_%s]", tier.suffix))
        add_generated_info(lines)

        local header = [[
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
]]
        table_merge(lines, split_to_lines({}, header))

        -- Loop through EVERY loaded weapon config
        for _, config in ipairs(loaded_configs) do
            if config then
                -- Loop through EVERY node (1-10) for this config
                for i, node_data in ipairs(NODE_MAP) do
                    -- CHANGED: Generate specific class name (e.g. AUTOGUN_NODE10)
                    local syn_class = string.format("%s_NODE%d", config.ID_PREFIX, i)

                    local synd_block = string.format([[
        [SYNDROME]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [CE_CAN_DO_INTERACTION:PROB:%d:START:0]
                [CDI:ADV_NAME:download %s_NODE%d]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:INTERACTION:%s_NODE%d]
                [CDI:TARGET:A:SELF_ONLY]
                [CDI:WAIT_PERIOD:%d]
                [CDI:VERB:%s]
]],
                    syn_class, syn_class, -- Changed from node_data.syn_class
                    tier.prob,
                    config.ID_PREFIX, i, -- CHANGED: ADV_NAME:download AUTOGUN_NODE1
                    config.PAYLOAD_PREFIX, i,
                    config.CONSTRUCT_WAIT_PERIOD,
                    config.CONSTRUCT_VERB
                    )
                    table_merge(lines, split_to_lines({}, synd_block))
                end
            end
        end
    end
    return lines
end

-- =============================================================================
--  MAIN GENERATION LOOPS
-- =============================================================================

local function GenerateWeaponSystem(config, interaction_buffer, inorganic_buffer, reaction_buffer)
    script_log("Generating weapon system: " .. config.WEAPON_NAME)

    -- 1. Standard Components
    for i, node_data in ipairs(NODE_MAP) do
        local secret = build_secret_interaction(config, node_data, i)
        if interaction_buffer then table_merge(interaction_buffer, secret) end
        
        local payload = build_payload_interaction(config, node_data, i)
        if interaction_buffer then table_merge(interaction_buffer, payload) end
        
        local inorganic = build_inorganic_tablet(config, node_data, i)
        if inorganic_buffer then table_merge(inorganic_buffer, inorganic) end
        
        local f_react = build_fortress_reaction(config, node_data, i)
        if reaction_buffer then table_merge(reaction_buffer, f_react) end
        
        local a_react = build_adventure_reaction(config, node_data, i)
        if reaction_buffer then table_merge(reaction_buffer, a_react) end
    end

    -- 2. Individual Tiered Unlocks
    local unlocks = build_tier_unlocks(config)
    if interaction_buffer then table_merge(interaction_buffer, unlocks) end
end

-- Main Function
function M.generate_all_custom_weapon_systems(loaded_configs)
    script_log("--- Generating All Custom Weapon Systems (Transmutation Module) ---")
    
    if MAKE_REACTIONS_FREE_FOR_TESTING then
        script_log("WARNING: MAKE_REACTIONS_FREE_FOR_TESTING is TRUE. All weapon reactions will be free.")
    end

    local master_interaction_buffer = {}
    local master_inorganic_buffer = {}
    local master_reaction_buffer = {}

    -- A. Process Individual Weapons
    if loaded_configs then
        for _, config in ipairs(loaded_configs) do
            if config then
                script_log("WEAPON_GEN: Processing config for " .. (config.WEAPON_NAME or "UNKNOWN"))
                GenerateWeaponSystem(config, master_interaction_buffer, master_inorganic_buffer, master_reaction_buffer)
            else
                script_log("WEAPON_GEN: ERROR - A weapon config was nil. Skipping.")
            end
        end
        
        -- B. Process Global "All Guns" Unlocks
        script_log("WEAPON_GEN: Generating Global 'All Guns' Unlocks...")
        local global_unlocks = build_all_guns_unlocks(loaded_configs)
        table_merge(master_interaction_buffer, global_unlocks)
    end

    -- C. Batch Registration
    if #master_interaction_buffer > 0 then
        script_log("WEAPON_GEN: Batch registering " .. #master_interaction_buffer .. " interaction lines...")
        if _G.raws and _G.raws.register_interactions then
            _G.raws.register_interactions(master_interaction_buffer)
        end
    end

    if #master_inorganic_buffer > 0 then
        script_log("WEAPON_GEN: Batch registering " .. #master_inorganic_buffer .. " inorganic lines...")
        if _G.raws and _G.raws.register_inorganics then
            _G.raws.register_inorganics(master_inorganic_buffer)
        end
    end

    if #master_reaction_buffer > 0 then
        script_log("WEAPON_GEN: Batch registering " .. #master_reaction_buffer .. " reaction lines...")
        if _G.raws and _G.raws.register_reactions then
            _G.raws.register_reactions(master_reaction_buffer)
        end
    end
    
    script_log("--- Custom Weapon System Generation (Transmutation Module) COMPLETE ---")
end

-- =============================================================================
--  STANDALONE LOADER (for testing outside DF)
-- =============================================================================
if ... == nil then
    local outfile = "output_weapons.txt"
    local f = io.open(outfile, "w")
    if f then f:write("--- GENERATED WEAPON SYSTEM OUTPUT ---\n"); f:close() end

    local function append_to_file(header, lines)
        local f = io.open(outfile, "a")
        if not f then return end
        f:write("\n" .. header .. "\n")
        for _, line in ipairs(lines) do f:write(line .. "\n") end
        f:close()
    end

    -- Mock environment
    _G.raws = {
        register_interactions = function(lines) append_to_file("[OBJECT:INTERACTION]", lines) end,
        register_inorganics = function(lines) append_to_file("[OBJECT:INORGANIC]", lines) end,
        register_reactions = function(lines) append_to_file("[OBJECT:REACTION]", lines) end,
    }

    local master_file = "config_weapons_master"
    local loaded_configs = {}
    
    local status, conf = pcall(require, master_file)
    if not status then 
        status, conf = pcall(dofile, master_file .. ".lua") 
    end
    
    if status and conf then
        -- config_weapons_master returns a LIST of configs, so we use it directly
        loaded_configs = conf
        print("Loaded master config: " .. master_file)
        
        if #loaded_configs > 0 then
            M.generate_all_custom_weapon_systems(loaded_configs)
            print("Generation complete. Output written to: " .. outfile)
        else
             print("ERROR: Master config loaded but empty.")
        end
    else
        print("ERROR: Could not load " .. master_file .. ".lua")
        print(conf) -- Print error message
    end
end

return M