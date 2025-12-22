local function script_log(...)
    if _G.log then 
        _G.log(...) 
    else
        print(...)
    end
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

local function add_generated_info(lines)
    if _G.add_generated_info then
        _G.add_generated_info(lines)
    else
        table.insert(lines, "[GENERATED]")
    end
end

-- =============================================================================
--  DEFAULTS & CONSTANTS
-- =============================================================================
local MAKE_REACTIONS_FREE_FOR_TESTING = true

local TIER_DATA = {
    PRIMARY     = { perc = 100, magnitude = 200, adv_cost = 40, fort_cost = 1, reagent_suffix = "_PRIMARY" },
    SECONDARY   = { perc = 80,  magnitude = 180, adv_cost = 20, fort_cost = 1, reagent_suffix = "_SECONDARY" },
    TERTIARY    = { perc = 60,  magnitude = 160, adv_cost = 10, fort_cost = 1, reagent_suffix = "_TERTIARY" },
    QUATERNARY  = { perc = 40,  magnitude = 140, adv_cost = 5,  fort_cost = 1, reagent_suffix = "_QUATERNARY" },
    QUINARY     = { perc = 20,  magnitude = 120, adv_cost = 2,  fort_cost = 1, reagent_suffix = "_QUINARY" }
}

-- Mapped Copy Counts for World Gen Frequency
local COPY_COUNTS = {
    PRIMARY     = 2,
    SECONDARY   = 4,
    TERTIARY    = 6,
    QUATERNARY  = 8,
    QUINARY     = 10
}

local LEVEL_MAP = {
    { key = "PRIMARY",    token = "100_PER_UP", name = "Primary" },
    { key = "SECONDARY",  token = "80_PER_UP",  name = "Secondary" },
    { key = "TERTIARY",   token = "60_PER_UP",  name = "Tertiary" },
    { key = "QUATERNARY", token = "40_PER_UP",  name = "Quaternary" },
    { key = "QUINARY",    token = "20_PER_UP",  name = "Quinary" }
}

-- Restored Tiered Probability Table
local UNLOCK_PROBABILITIES = {
    TIER_1 = { QUINARY = 20, QUATERNARY = 15, TERTIARY = 10, SECONDARY = 5,  PRIMARY = 1 },
    TIER_2 = { QUINARY = 40, QUATERNARY = 30, TERTIARY = 20, SECONDARY = 10, PRIMARY = 5 },
    TIER_3 = { QUINARY = 80, QUATERNARY = 60, TERTIARY = 40, SECONDARY = 25, PRIMARY = 10 }
}

local DEFAULTS = {
    BUFF_DURATION_TICKS = 10000,
    FORT_BUILDING = "N_MATTER_REFINERY",
    FORT_REAGENT_PREFIX = "ITEM_TOOL_TABLET_INCOMPLETE",
    FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    FORT_CATEGORY_ID = "PROGRAM_BODY",
    FORT_CATEGORY_NAME = "Body Programs",
    FORT_CATEGORY_DESC = "Create physical data packets granting users multipliers to various attributes.",
    ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
    ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
    ADV_CATEGORY_ID = "PROGRAM_BODY_ADV",
    ADV_CATEGORY_NAME = "Body Programs",
    ADV_CATEGORY_DESC = "Attribute enhancers",
    ABILITY_WAIT_PERIOD = 2400,
    ABILITY_USAGE_HINT = "DEFEND"
}

-- Global master unlock probability (used only for universal unlocker)
local UNIVERSAL_PROB = 10 

-- =============================================================================
--  ID GENERATORS
-- =============================================================================
local function gen_id(config, level)
    return config.short_name .. "_" .. level.token
end

local function gen_payload_id(config, level)
    return config.payload_prefix .. "_" .. level.token
end

local function gen_secret_id(config, level)
    return config.secret_prefix .. "_" .. level.token .. "_SECRET"
end

local function gen_inorganic_id(config, level)
    return config.id_prefix .. "_" .. level.token .. "_PROGRAM"
end

-- =============================================================================
--  RAW BUILDERS
-- =============================================================================

-- 1. Payload Interaction (Restored Stack Prevention Classes)
local function build_payload_interaction(config, level)
    local lines = {}
    local interaction_id = gen_payload_id(config, level)
    local internal_id = gen_id(config, level)
    local magnitude = TIER_DATA[level.key].magnitude
    local duration = config.BUFF_DURATION_TICKS or DEFAULTS.BUFF_DURATION_TICKS
    
    table.insert(lines, "[INTERACTION:" .. interaction_id .. "]")
    add_generated_info(lines)
    
    local static_header = [[
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [SYNDROME]
]]
    table_merge(lines, split_to_lines({}, static_header))
    table.insert(lines, "            [SYN_NAME:" .. internal_id .. "]")

    if config.type == "PHYSICAL" then
        table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0:END:%d:DWF_STRETCH:144]", config.id, magnitude, duration))
    elseif config.type == "MENTAL" then
        table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0:END:%d:DWF_STRETCH:144]", config.id, magnitude, duration))
    elseif config.type == "SPEED" then
        table.insert(lines, string.format("            [CE_SPEED_CHANGE:SPEED_PERC:%d:ABRUPT:START:0:END:%d:DWF_STRETCH:144]", magnitude, duration))
    end
    
    return lines
end

-- 2. Inorganic Tablet (Restored Stack Prevention Classes)
local function build_inorganic_tablet(config, level)
    local lines = {}
    local inorganic_id = gen_inorganic_id(config, level)
    local payload_id = gen_payload_id(config, level)
    local internal_id = gen_id(config, level)
    local verb = config.verbs[level.key] or "perform a generic buff:performs a generic buff:NA"
    local wait_period = config.ABILITY_WAIT_PERIOD or DEFAULTS.ABILITY_WAIT_PERIOD
    local usage_hint = config.usage_hint or DEFAULTS.ABILITY_USAGE_HINT

    table.insert(lines, "[INORGANIC:" .. inorganic_id .. "]")
    add_generated_info(lines)

    local tablet_raw = string.format([[
    [USE_MATERIAL_TEMPLATE:MUSCLE_TABLET_TEMPLATE][MEAT][SPECIAL]
    [STATE_NAME_ADJ:ALL_SOLID:%s core implant]
    [DISPLAY_COLOR:7:11:0][TILE:'#']
    [MELTING_POINT:12070][SOLID_DENSITY:400]
    [MEAT_NAME:NONE:data packet- %s:data packets- %s]
    [SYNDROME]
        [SYN_INGESTED]
        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]
        [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
        [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
    [CE_CAN_DO_INTERACTION:PROB:100:START:0:ABRUPT]
        [CDI:ADV_NAME:%s]
        [CDI:TARGET:A:SELF_ONLY]
        [CDI:INTERACTION:%s]
        [CDI:USAGE_HINT:%s]
        [CDI:MAX_TARGET_NUMBER:A:1]
        [CDI:VERB:%s]
        [CDI:WAIT_PERIOD:%d]
]], 
    internal_id,
    internal_id, internal_id,
    config.short_name, config.short_name, -- Attribute Class
    level.key, level.key,                 -- Tier Class
    internal_id,
    payload_id,
    usage_hint,
    verb,
    wait_period
    )
    
    table_merge(lines, split_to_lines({}, tablet_raw))
    return lines
end

-- 3. Secret Interaction (Modified for Copy Mechanic)
local function build_secret_interaction(config, level)
    local all_lines = {}
    local interaction_entries = {}
    
    local base_secret_id = gen_secret_id(config, level)
    local payload_id = gen_payload_id(config, level)
    local internal_id = gen_id(config, level)
    local verb = config.verbs[level.key] or "perform a generic buff:performs a generic buff:NA"
    local wait_period = config.ABILITY_WAIT_PERIOD or DEFAULTS.ABILITY_WAIT_PERIOD
    local hist_string = string.format("who gained %s from them", internal_id)
    
    local copy_count = COPY_COUNTS[level.key] or 1
    
    for i = 0, (copy_count - 1) do
        local current_lines = {}
        local secret_id = (i > 0) and (base_secret_id .. "_COPY_" .. i) or base_secret_id

        table.insert(current_lines, "[INTERACTION:" .. secret_id .. "]")
        add_generated_info(current_lines)

        local secret_raw = string.format([[
    [I_SOURCE:DEITY]
        [IS_USAGE_HINT:MAJOR_CURSE]
        [IS_HIST_STRING_1: the infodeity was challenged in the Datasphere by ]
        [IS_HIST_STRING_2: %s]
    [I_SOURCE:SECRET]
        [IS_NAME:%s]
        [IS_SECRET_GOAL:IMMORTALITY]
        [IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]
        [IS_SECRET:MUNDANE_RECORDING_POSSIBLE:BOOK_INSTRUCTION:SECRET_CORE]
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_REQUIRES:CAN_LEARN]
        [IT_REQUIRES:CAN_SPEAK]
        [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
        [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [IE_ARENA_NAME:%s]
        [SYNDROME]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]
            [CE_CAN_DO_INTERACTION:PROB:100:START:0:ABRUPT]
                [CDI:ADV_NAME:%s]
                [CDI:TARGET:A:SELF_ONLY]
                [CDI:INTERACTION:%s]
                [CDI:VERB:%s]
                [CDI:WAIT_PERIOD:%d]
]],
        hist_string, 
        internal_id,
        config.short_name, -- Attribute Class
        level.key,         -- Tier Class
        internal_id,
        config.short_name, config.short_name,
        level.key, level.key,
        internal_id,
        payload_id,
        verb,
        wait_period
        )
        
        table_merge(current_lines, split_to_lines({}, secret_raw))
        table.insert(interaction_entries, { id = secret_id, raws = current_lines })
        table_merge(all_lines, current_lines)
    end
    
    return all_lines, interaction_entries
end

-- 4. Reactions
local function build_reactions(config, level, is_first)
    local lines = {}
    local inorganic_id = gen_inorganic_id(config, level)
    local internal_id = gen_id(config, level)
    local tier_info = TIER_DATA[level.key]
    
    -- Fortress Mode
    table.insert(lines, "[REACTION:CRAFT_" .. internal_id .. "]")
    add_generated_info(lines)
    table.insert(lines, "[NAME:" .. internal_id .. "]")
    table.insert(lines, "[BUILDING:" .. DEFAULTS.FORT_BUILDING .. ":NONE]")
    if not MAKE_REACTIONS_FREE_FOR_TESTING then
        local reagent = string.format("blank tablet:%d:TOOL:%s%s:%s", tier_info.fort_cost, DEFAULTS.FORT_REAGENT_PREFIX, tier_info.reagent_suffix, DEFAULTS.FORT_REAGENT_MATERIAL)
        table.insert(lines, "[REAGENT:" .. reagent .. "]")
    end
    table.insert(lines, "[PRODUCT:100:1:MEAT:NONE:INORGANIC:" .. inorganic_id .. "]")
    table.insert(lines, "[SKILL:EXTRACT_STRAND][FORTRESS_MODE_ENABLED]")
    table.insert(lines, "[DESCRIPTION:An edible tablet granting technical data for " .. internal_id .. ".]")
    table.insert(lines, "[CATEGORY:" .. DEFAULTS.FORT_CATEGORY_ID .. "]")
    if is_first then
        table.insert(lines, "    [CATEGORY_NAME:" .. DEFAULTS.FORT_CATEGORY_NAME .. "]")
        table.insert(lines, "    [CATEGORY_DESCRIPTION:" .. DEFAULTS.FORT_CATEGORY_DESC .. "]")
    end

    -- Adventure Mode
    table.insert(lines, "[REACTION:ADV_CRAFT_" .. internal_id .. "]")
    add_generated_info(lines)
    table.insert(lines, "[NAME:" .. internal_id .. "]")
    table.insert(lines, "[ADVENTURE_MODE_ENABLED]")
    if not MAKE_REACTIONS_FREE_FOR_TESTING then
        local scrap = string.format("scrap:%d:TOOL:%s:%s", tier_info.adv_cost, DEFAULTS.ADV_REAGENT_SCRAP, DEFAULTS.ADV_REAGENT_MATERIAL)
        local tool = string.format("tool:1:TOOL:%s:NONE:NONE][PRESERVE_REAGENT]", DEFAULTS.ADV_REAGENT_TOOL)
        table.insert(lines, "[REAGENT:" .. scrap .. "]")
        table.insert(lines, "[REAGENT:" .. tool .. "]")
    end
    table.insert(lines, "[PRODUCT:100:1:MEAT:NONE:INORGANIC:" .. inorganic_id .. "]")
    table.insert(lines, "[SKILL:EXTRACT_STRAND]")
    table.insert(lines, "[DESCRIPTION:An edible tablet granting technical data for " .. internal_id .. ".]")
    table.insert(lines, "[CATEGORY:" .. DEFAULTS.ADV_CATEGORY_ID .. "]")
    if is_first then
        table.insert(lines, "    [CATEGORY_NAME:" .. DEFAULTS.ADV_CATEGORY_NAME .. "]")
        table.insert(lines, "    [CATEGORY_DESCRIPTION:" .. DEFAULTS.ADV_CATEGORY_DESC .. "]")
    end

    return lines
end

-- =============================================================================
--  UNLOCK SYSTEM BUILDERS (RESTORED TIERED UNLOCKS)
-- =============================================================================

local function build_specific_unlocks(config)
    local lines = {}
    
    for tier_name, probs in pairs(UNLOCK_PROBABILITIES) do
        local interaction_id = string.format("%s_UNLOCK_%s", config.short_name, tier_name)
        
        table.insert(lines, string.format("[INTERACTION:%s]", interaction_id))
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
        
        for _, level in ipairs(LEVEL_MAP) do
            local prob = probs[level.key] or 0
            if prob > 0 then
                local payload_id = gen_payload_id(config, level)
                local internal_id = gen_id(config, level)
                
                local synd_block = string.format([[
        [SYNDROME]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [SYN_CLASS:%s][SYN_IMMUNE_CLASS:%s]
            [CE_CAN_DO_INTERACTION:PROB:%d:START:0:ABRUPT]
                [CDI:ADV_NAME:Manifest %s]
                [CDI:TARGET:A:SELF_ONLY]
                [CDI:INTERACTION:%s]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:MAX_TARGET_NUMBER:A:1]
                [CDI:WAIT_PERIOD:2400]
]],
                config.short_name, config.short_name,
                level.key, level.key,
                prob,
                internal_id,
                payload_id
                )
                table_merge(lines, split_to_lines({}, synd_block))
            end
        end
    end
    
    return lines
end

local function build_universal_unlock(configs)
    local lines = {}
    table.insert(lines, "[INTERACTION:GEN_ATTR_MASTER_UNLOCK]")
    add_generated_info(lines)
    local header = [[
    [I_SOURCE:REGION]
    [I_TARGET:A:CREATURE]
    [IT_LOCATION:CONTEXT_CREATURE]
    [I_EFFECT:ADD_SYNDROME]
    [IE_TARGET:A][IE_IMMEDIATE]
    [SYNDROME]
    [SYN_NAME:Attribute Potential Unlocked]
]]
    table_merge(lines, split_to_lines({}, header))

    for _, config in ipairs(configs) do
        for _, level in ipairs(LEVEL_MAP) do
            local payload_id = gen_payload_id(config, level)
            local internal_id = gen_id(config, level)
            table.insert(lines, string.format("    [CE_CAN_DO_INTERACTION:PROB:%d:START:0:ABRUPT]", UNIVERSAL_PROB))
            table.insert(lines, "        [CDI:ADV_NAME:Manifest " .. internal_id .. "]")
            table.insert(lines, "        [CDI:INTERACTION:" .. payload_id .. "]")
            table.insert(lines, "        [CDI:TARGET:A:SELF_ONLY][CDI:USAGE_HINT:DEFEND]")
        end
    end
    return lines
end

local function build_physical_speed_unlock(configs)
    local lines = {}
    table.insert(lines, "[INTERACTION:GEN_ATTR_PHYS_SPEED_UNLOCK]")
    add_generated_info(lines)
    local header = [[
    [I_SOURCE:REGION]
    [I_TARGET:A:CREATURE]
    [IT_LOCATION:CONTEXT_CREATURE]
    [I_EFFECT:ADD_SYNDROME]
    [IE_TARGET:A][IE_IMMEDIATE]
    [SYNDROME]
    [SYN_NAME:Physical Potential Unlocked]
]]
    table_merge(lines, split_to_lines({}, header))

    for _, config in ipairs(configs) do
        if config.type == "PHYSICAL" or config.type == "SPEED" then
            for _, level in ipairs(LEVEL_MAP) do
                local payload_id = gen_payload_id(config, level)
                local internal_id = gen_id(config, level)
                table.insert(lines, string.format("    [CE_CAN_DO_INTERACTION:PROB:%d:START:0:ABRUPT]", UNIVERSAL_PROB))
                table.insert(lines, "        [CDI:ADV_NAME:Force " .. internal_id .. "]")
                table.insert(lines, "        [CDI:INTERACTION:" .. payload_id .. "]")
                table.insert(lines, "        [CDI:TARGET:A:SELF_ONLY][CDI:USAGE_HINT:DEFEND]")
            end
        end
    end
    return lines
end

-- =============================================================================
--  MAIN GENERATION FUNCTION
-- =============================================================================
function M.generate_all_custom_buff_systems(loaded_configs)
    script_log("ATTR_GEN: Processing " .. #loaded_configs .. " attribute systems...")

    local master_interaction_buffer = {}
    local master_inorganic_buffer = {}
    local master_reaction_buffer = {}

    for i, config in ipairs(loaded_configs) do
        script_log("ATTR_GEN: Building " .. config.id .. "...")
        local is_first_config = (i == 1)

        for j, level in ipairs(LEVEL_MAP) do
            local is_first_tier = (j == 1 and is_first_config)
            
            -- 1. Payloads
            table_merge(master_interaction_buffer, build_payload_interaction(config, level))
            
            -- 2. Secrets (Updated for Copies)
            local secret_raws_combined, secret_entries = build_secret_interaction(config, level)
            table_merge(master_interaction_buffer, secret_raws_combined)
            
            -- Register all secret copies properly for worldgen if in-game
            if _G.interactions and _G.interactions.secrets then
                for _, entry in ipairs(secret_entries) do
                    _G.interactions.secrets[entry.id] = function()
                        return { raws = entry.raws, weight = 1, spheres = { KNOWLEDGE = true } }
                    end
                end
            end
            
            -- 3. Inorganics (Tablets)
            table_merge(master_inorganic_buffer, build_inorganic_tablet(config, level))
            -- 4. Reactions
            table_merge(master_reaction_buffer, build_reactions(config, level, is_first_tier))
        end
        
        -- Restored Specific Unlockers
        table_merge(master_interaction_buffer, build_specific_unlocks(config))
    end

    -- Global Unlockers
    table_merge(master_interaction_buffer, build_universal_unlock(loaded_configs))
    table_merge(master_interaction_buffer, build_physical_speed_unlock(loaded_configs))

    -- Final Registration
    if _G.raws then
        if #master_interaction_buffer > 0 and _G.raws.register_interactions then 
            _G.raws.register_interactions(master_interaction_buffer) 
        end
        if #master_inorganic_buffer > 0 and _G.raws.register_inorganics then 
            _G.raws.register_inorganics(master_inorganic_buffer) 
        end
        if #master_reaction_buffer > 0 and _G.raws.register_reactions then 
            _G.raws.register_reactions(master_reaction_buffer) 
        end
    end

    script_log("ATTR_GEN: Attribute system generation complete.")
    return master_interaction_buffer, master_inorganic_buffer, master_reaction_buffer
end

-- =============================================================================
--  STANDALONE LOADER (for testing outside DF)
-- =============================================================================
if ... == nil then
    local outfile = "output_attributes.txt"
    local f = io.open(outfile, "w")
    if f then f:write("--- GENERATED ATTRIBUTE SYSTEM OUTPUT ---\n"); f:close() end

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
    
    _G.interactions = { secrets = {} }

    -- Load config
    local status, configs = pcall(require, "config_attributes_master")
    if not status then status, configs = pcall(dofile, "config_attributes_master.lua") end
    
    if status and configs then
        M.generate_all_custom_buff_systems(configs)
        print("Generation complete. Output written to: " .. outfile)
    else
        print("ERROR: Failed to load 'config_attributes_master'. Ensure the config file is in the same directory.")
    end
end

return M