local ENABLE_LOGGING = true
local ENABLE_RAW_LOGGING = false

local ALLOWED_ARCHETYPES = {
    "BIOMACHINE",
    "NANOMACHINE"
}

local function script_log(...)
    if ENABLE_LOGGING then log(...) end
end

local function split_string_to_lines(str)
    local lines = {}
    if str then
        for line in str:gmatch("[^\r\n]+") do table.insert(lines, line) end
    end
    return lines
end

-- ============================================================================
-- PARSING UTILITIES
-- ============================================================================

local function extract_size_string(token)
    local size = token:match("_ID_([^_]+)_")
    if size then return size end
    return token:match("_([A-Z][A-Z][A-Z])_") or "UNK"
end

local function get_creature_archetype(token)
    for _, archetype in ipairs(ALLOWED_ARCHETYPES) do
        if token:match("^" .. archetype) then
            return archetype
        end
    end
    return nil
end

-- ============================================================================
-- TEMPLATES
-- ============================================================================

-- 1. THE MINION RAISING SPELL
-- Added [I_SOURCE:CREATURE_ACTION] so the creature can cast it.
local SERVANT_INTERACTION_TEMPLATE = [[
[INTERACTION:__INTERACTION_ID__]
    [I_TARGET:A:CORPSE]
        [IT_LOCATION:CONTEXT_ITEM]
        [IT_REQUIRES:FIT_FOR_RESURRECTION]
        [IT_AFFECTED_CLASS:HICASTE_MALE]
        [IT_AFFECTED_CLASS:HICASTE_FEMALE]
        [IT_AFFECTED_CLASS:LOCASTE_MALE]
        [IT_AFFECTED_CLASS:LOCASTE_FEMALE]
        [IT_AFFECTED_CLASS:NUCASTE_MALE]
        [IT_AFFECTED_CLASS:NUCASTE_FEMALE]
        [IT_AFFECTED_CLASS:EXCASTE_MALE]
        [IT_AFFECTED_CLASS:EXCASTE_FEMALE]
        [IT_MANUAL_INPUT:corpses]
    [I_EFFECT:RESURRECT]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [SYNDROME]
            [SYN_CONCENTRATION_ADDED:1000:0]
            [SYN_CLASS:RAISED_UNDEAD]
            [CE_ADD_TAG:NO_AGING:OPPOSED_TO_LIFE:START:0:ABRUPT]



    [SYNDROME]
        [SYN_AFFECTED_CLASS:HICASTE_FEMALE]
        [SYN_AFFECTED_CLASS:LOCASTE_FEMALE]
        [SYN_AFFECTED_CLASS:NUCASTE_FEMALE]
        [SYN_AFFECTED_CLASS:EXCASTE_FEMALE]
        [CE_BODY_TRANSFORMATION:PROB:100:START:0:ABRUPT_START]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:FEMALE]

    [SYNDROME]
        [SYN_AFFECTED_CLASS:HICASTE_MALE]
        [SYN_AFFECTED_CLASS:LOCASTE_MALE]
        [SYN_AFFECTED_CLASS:NUCASTE_MALE]
        [SYN_AFFECTED_CLASS:EXCASTE_MALE]
        [CE_BODY_TRANSFORMATION:PROB:100:START:0:ABRUPT_START]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:MALE]

    [SYNDROME]
        [SYN_CONCENTRATION_ADDED:1000:0]
        [CE_STOP_BLEEDING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_CLOSE_OPEN_WOUNDS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_HEAL_TISSUES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_HEAL_NERVES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_PAIN:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_SWELLING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_CURE_INFECTION:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_PARALYSIS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_DIZZINESS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_NAUSEA:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REDUCE_FEVER:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
        [CE_REGROW_PARTS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
]]

-- 2. THE TOMB INTERACTION (Creates the Epicenter)
-- Added [I_SOURCE:DISTURBANCE] so it triggers on tomb raid.
-- Replaced specific CDI block with __GENERATED_CDI_BLOCKS__ placeholder.
local TOMB_INTERACTION_TEMPLATE = [[
[INTERACTION:__INTERACTION_ID__]
    [I_SOURCE:DISTURBANCE]
    [I_TARGET:A:CORPSE]
        [IT_LOCATION:CONTEXT_ITEM]
        [IT_REQUIRES:FIT_FOR_RESURRECTION]
        [IT_FORBIDDEN:NOT_LIVING]
        [IT_MANUAL_INPUT:corpses]
        [IT_CANNOT_HAVE_SYNDROME_CLASS:NANOZOMBIE]
        [IT_AFFECTED_CLASS:HICASTE_MALE]
        [IT_AFFECTED_CLASS:HICASTE_FEMALE]
        [IT_AFFECTED_CLASS:LOCASTE_MALE]
        [IT_AFFECTED_CLASS:LOCASTE_FEMALE]
        [IT_AFFECTED_CLASS:NUCASTE_MALE]
        [IT_AFFECTED_CLASS:NUCASTE_FEMALE]
        [IT_AFFECTED_CLASS:EXCASTE_MALE]
        [IT_AFFECTED_CLASS:EXCASTE_FEMALE]
    [I_EFFECT:RESURRECT]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [IE_ARENA_NAME:Viral Epicenter]

        [SYNDROME]
        [SYN_CLASS:NANOZOMBIE]
            [CE_DISPLAY_NAME:NAME:myriarch:myriarchs:myriarch:START:0:ABRUPT]

    [SYNDROME]
        [SYN_AFFECTED_CLASS:HICASTE_FEMALE]
        [SYN_AFFECTED_CLASS:LOCASTE_FEMALE]
        [SYN_AFFECTED_CLASS:NUCASTE_FEMALE]
        [SYN_AFFECTED_CLASS:EXCASTE_FEMALE]
        [CE_BODY_TRANSFORMATION:PROB:100:START:0:ABRUPT_START]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:FEMALE]

    [SYNDROME]
        [SYN_AFFECTED_CLASS:HICASTE_MALE]
        [SYN_AFFECTED_CLASS:LOCASTE_MALE]
        [SYN_AFFECTED_CLASS:NUCASTE_MALE]
        [SYN_AFFECTED_CLASS:EXCASTE_MALE]
        [CE_BODY_TRANSFORMATION:PROB:100:START:0:ABRUPT_START]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:MALE]

        [SYNDROME]
            [CE_DISPLAY_NAME:NAME:myriarch:myriarchs:myriarch:START:0:ABRUPT]
            [CE_ADD_TAG:NO_AGING:NOT_LIVING:OPPOSED_TO_LIFE:STERILE:START:0]
            [CE_CHANGE_PERSONALITY:FACET:ANXIETY_PROPENSITY:50:FACET:TRUST:-50:START:0:ABRUPT] 

            [CE_CAN_DO_INTERACTION:START:0]
                [CDI:ADV_NAME:Servitor Program- Viral Husk]
                [CDI:INTERACTION:VIRAL_HUSK_RAISE]
                [CDI:TARGET:A:LINE_OF_SIGHT]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:TARGET_RANGE:A:10]
                [CDI:VERB:open a connection to the Datasphere:opens a connection to the Datasphere:NA]
                [CDI:TARGET_VERB:shudder and begin to move:shudders and begins to move]
                [CDI:WAIT_PERIOD:100]

__GENERATED_CDI_BLOCKS__
]]

-- ============================================================================
-- GENERATION LOGIC
-- ============================================================================

local function generate_viral_interactions(creature_data_cache)
    script_log("VIRAL_GEN_LOG: Initializing Viral/Tomb generation (Archetype Sharing Mode).")

    if not creature_data_cache or #creature_data_cache == 0 then 
        script_log("VIRAL_GEN_LOG: No creatures in cache to process.")
        return 
    end

    local all_interaction_lines = {}
    local vessel_registry = {}
    local count_servants = 0
    local count_tombs = 0

    -- ==========================================================
    -- PASS 1: Identify Vessels, Generate Spells, Register Data
    -- ==========================================================
    for _, creature_entry in ipairs(creature_data_cache) do
        local raw_lines = creature_entry.creature
        local is_vessel = false
        for _, line in ipairs(raw_lines) do
            if line:match("%[CREATURE_CLASS:VESSEL%]") then
                is_vessel = true
                break
            end
        end

        if is_vessel then
            local creature_token = raw_lines[1]:match("%[CREATURE:(.-)%]")
            if creature_token then
                local archetype = get_creature_archetype(creature_token)
                
                if archetype then
                    local size_str = extract_size_string(creature_token)
                    local servant_id = "RAISE_SERVANT_" .. creature_token
                    
                    -- 1. Generate the Servant Interaction (Spell) immediately
                    local servant_raw = SERVANT_INTERACTION_TEMPLATE
                    servant_raw = servant_raw:gsub("__INTERACTION_ID__", servant_id)
                    servant_raw = servant_raw:gsub("__TARGET_CREATURE_TOKEN__", creature_token)
                    
                    local servant_lines = split_string_to_lines(servant_raw)
                    _G.add_generated_info(servant_lines)
                    for _, line in ipairs(servant_lines) do table.insert(all_interaction_lines, line) end
                    count_servants = count_servants + 1

                    -- 2. Store data for Pass 2
                    table.insert(vessel_registry, {
                        token = creature_token,
                        archetype = archetype,
                        servant_id = servant_id,
                        size_str = size_str
                    })
                end
            end
        end
    end

    -- ==========================================================
    -- PASS 2: Generate Tombs with Shared Abilities
    -- ==========================================================
    for _, current_vessel in ipairs(vessel_registry) do
        local tomb_id = "TOMB_" .. current_vessel.token .. "_RAISE"
        local cdi_accumulator = ""

        -- Loop through ALL vessels to find "friends" (same archetype)
        -- This Epicenter will be able to raise ANY vessel of the same archetype
        for _, potential_servant in ipairs(vessel_registry) do
            if potential_servant.archetype == current_vessel.archetype then
                
                local cdi_block = [[
            [CE_CAN_DO_INTERACTION:START:0]
                [CDI:ADV_NAME:Raise Servant ID-__SIZE__-VSSL]
                [CDI:INTERACTION:__SERVANT_ID__]
                [CDI:TARGET:A:TOUCHABLE]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:TARGET_RANGE:A:10]
                [CDI:VERB:open a connection to the Datasphere:opens a connection to the Datasphere:NA]
                [CDI:TARGET_VERB:shudder and begin to move:shudders and begins to move]
                [CDI:WAIT_PERIOD:100]
]]
                cdi_block = cdi_block:gsub("__SERVANT_ID__", potential_servant.servant_id)
                cdi_block = cdi_block:gsub("__SIZE__", potential_servant.size_str)
                
                cdi_accumulator = cdi_accumulator .. cdi_block
            end
        end

        -- Construct final Tomb interaction
        local tomb_raw = TOMB_INTERACTION_TEMPLATE
        tomb_raw = tomb_raw:gsub("__INTERACTION_ID__", tomb_id)
        tomb_raw = tomb_raw:gsub("__TARGET_CREATURE_TOKEN__", current_vessel.token)
        tomb_raw = tomb_raw:gsub("__GENERATED_CDI_BLOCKS__", cdi_accumulator)

        local tomb_lines = split_string_to_lines(tomb_raw)
        _G.add_generated_info(tomb_lines)
        for _, line in ipairs(tomb_lines) do table.insert(all_interaction_lines, line) end
        count_tombs = count_tombs + 1
    end

    -- ==========================================================
    -- REGISTRATION
    -- ==========================================================
    if #all_interaction_lines > 0 then
        if type(raws) == "table" and type(raws.register_interactions) == "function" then
            script_log("VIRAL_GEN_LOG: Generated " .. count_servants .. " Servant Spells.")
            script_log("VIRAL_GEN_LOG: Generated " .. count_tombs .. " Tomb Interactions (Shared Archetype Mode).")
            raws.register_interactions(all_interaction_lines)
        end
    else
        script_log("VIRAL_GEN_LOG: No valid VESSEL creatures found.")
    end
end

local function viral_init_hook(creature_data_cache)
    script_log("VIRAL_GEN_LOG: Hook activated.")
    generate_viral_interactions(creature_data_cache)
end

return {
    preprocess = {
        viral_init = viral_init_hook,
    }
}