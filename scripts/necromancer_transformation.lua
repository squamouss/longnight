local ENABLE_LOGGING = true
local ENABLE_RAW_LOGGING = false 

local TRANSFORMATION_PREFIX_POOLS = {
	BIOMACHINE = { "LOCASTE", "NUCASTE", "EXCASTE", "HICASTE", "CYCASTE" },
	NANOMACHINE = { "LOCASTE", "NUCASTE", "EXCASTE", "HICASTE", "CYCASTE" },
}

local CUSTOM_SECRET_NAMES = { 
    ["BIOMACHINE_DEVIL"] = "designs of Geno-Monarchic Era biomechanical phyla",
    ["BIOMACHINE_HUMAN"] = "designs of Late-Fade biomechanical phyla",
    ["BIOMACHINE_OGRE"] = "designs of Transitional Era biomechanical phyla",
    ["NANOMACHINE_CORRUPT"] = "designs of Post-Fade Era nanomechanical phyla",
    ["NANOMACHINE_PRISTINE"] = "designs of Mid-Fade Era nanomechanical phyla",
    ["NANOMACHINE_WET"] = "designs of Late-Fade nanomechanical phyla",
    ["DEMIMACHINE_MECHA"] = "designs of middle Transitional Era demimechanical phyla",
    ["DEMIMACHINE_SWARM"] = "designs of lare Transitional Era demimechanical phyla",
    ["DEMIMACHINE_FRANKENSTEIN"] = "designs of Fade Era demimechanical phyla",

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

local function extract_prefix(creature_token)
    if not creature_token then return nil end
    local new_prefix = creature_token:match("^([^_]+)_ID_")
    if new_prefix then return new_prefix end
    return creature_token:match("(.+)_.+$")
end

local function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- ============================================================================
-- PARSING UTILITIES
-- ============================================================================

local function get_rating_and_archetype_from_token(token)
    local rating_code = nil
    
    -- Extract Rating Code from Token (e.g. _SPNT_)
    for part in token:gmatch("_([A-Z][A-Z][A-Z][A-Z])_") do
        if part == "SPNT" or part == "DVNT" or part == "HSTL" or part == "EXST" or 
           part == "DNGR" or part == "HZRD" or part == "BNGN" or part == "PRBM" or 
           part == "VRMN" or part == "AMBT" or part == "AVTR" or part == "VSSL" or 
           part == "INCR" or part == "DMST" or part == "VHCL" or part == "CRER" or 
           part == "NMAD" or part == "WEPN" or part == "SRVT" or part == "HNTR" or 
           part == "SNTN" or part == "PRDC" or part == "CMPN" or part == "MLTR" then
            rating_code = part
            break
        end
    end

    -- Get Sub-Archetype from Token Suffix
    local sub_archetype = token:match("_([A-Z]+)$")

    return rating_code, sub_archetype
end

-- ============================================================================
-- TEMPLATES
-- ============================================================================

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

local EXPERIMENT_INTERACTION_TEMPLATE = [[
[INTERACTION:__INTERACTION_ID__]
	[I_SOURCE:SECRET]
		[IS_NAME:__SECRET_NAME__]
		[IS_SECRET_GOAL:IMMORTALITY]
		[IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]
		[IS_SECRET:MUNDANE_RESEARCH_POSSIBLE]
		[IS_SECRET:MUNDANE_TEACHING_POSSIBLE]
	[I_TARGET:A:CREATURE]
		[IT_LOCATION:CONTEXT_CREATURE]
		[IT_REQUIRES:CAN_LEARN]
		[IT_REQUIRES:CAN_SPEAK]
        [IT_AFFECTED_CLASS:HICASTE_MALE]
        [IT_AFFECTED_CLASS:HICASTE_FEMALE]
        [IT_AFFECTED_CLASS:LOCASTE_MALE]
        [IT_AFFECTED_CLASS:LOCASTE_FEMALE]
        [IT_AFFECTED_CLASS:NUCASTE_MALE]
        [IT_AFFECTED_CLASS:NUCASTE_FEMALE]
        [IT_AFFECTED_CLASS:EXCASTE_MALE]
        [IT_AFFECTED_CLASS:EXCASTE_FEMALE]
		[IT_AFFECTED_CLASS:__ARCHETYPE_CLASS__]
		[IT_AFFECTED_CLASS:__RATING_CLASS__]
		[IT_CANNOT_HAVE_SYNDROME_CLASS:TRANSCEND]
	[I_EFFECT:ADD_SYNDROME]
		[IE_TARGET:A]
		[IE_IMMEDIATE]
		[IE_ARENA_NAME:Technarch (__HISTORY_NAME__)]

		[SYNDROME]
            [CE_DISPLAY_NAME:NAME:technarch:technarchs:technarch:START:0:ABRUPT]
            [CE_ADD_TAG:NO_AGING:START:0:ABRUPT]
		[SYN_CLASS:TRANSCEND]
        [CE_CAN_DO_INTERACTION:START:0]
            [CDI:ADV_NAME:Servitor Program- Nanite Puppet]
            [CDI:INTERACTION:NANITE_PUPPET_RAISE]
            [CDI:TARGET:A:LINE_OF_SIGHT]
            [CDI:USAGE_HINT:DEFEND]
            [CDI:TARGET_RANGE:A:10]
            [CDI:VERB:open a connection to the Datasphere:opens a connection to the Datasphere:NA]
            [CDI:TARGET_VERB:shudder and begin to move:shudders and begins to move]
            [CDI:WAIT_PERIOD:100]
__GENERATED_CDI_BLOCKS__
]]

local function generate_experiment_secrets(creature_data_cache)
    script_log("EXPERIMENT_TRANSFORM_LOG: Initializing (Cohort Resurrection Secret).")

    if not creature_data_cache or #creature_data_cache == 0 then return end

    local registry = {} 
    local all_interaction_lines = {}
    local servants_generated = 0

    -- =========================================================
    -- PASS 1: Filter Creatures and Generate Servant Spells
    -- =========================================================
    for _, creature_entry in ipairs(creature_data_cache) do
        local raw_lines = creature_entry.creature
        local token = raw_lines[1]:match("%[CREATURE:(.-)%]")
        
        if token then
            local prefix = extract_prefix(token)
            
            -- Primary Filter: Must match a valid archetype prefix
            if prefix and TRANSFORMATION_PREFIX_POOLS[prefix] then
                
                -- Secondary Filter: Extract Rating Code directly from Token
                -- Only SPNT (Sophont) and DVNT (Deviant) are allowed.
                local rating_code, sub_arch = get_rating_and_archetype_from_token(token)
                
                if rating_code == "SPNT" or rating_code == "DVNT" then
                    
                    -- 1. Generate Servant Spell (Specific to this creature)
                    local servant_id = "RAISE_SERVANT_" .. token
                    local servant_raw = SERVANT_INTERACTION_TEMPLATE
                    servant_raw = servant_raw:gsub("__INTERACTION_ID__", servant_id)
                    servant_raw = servant_raw:gsub("__TARGET_CREATURE_TOKEN__", token)
                    
                    local s_lines = split_string_to_lines(servant_raw)
                    _G.add_generated_info(s_lines)
                    for _, l in ipairs(s_lines) do table.insert(all_interaction_lines, l) end
                    servants_generated = servants_generated + 1

                    -- 2. Get Name
                    local creature_name_singular = "UNKNOWN"
                    for _, line in ipairs(raw_lines) do
                        local s = line:match("%[NAME:([^:]+):[^%]]+%]")
                        if s then creature_name_singular = s; break end
                    end

                    -- 3. Add to Registry for Cohort Grouping
                    if sub_arch then
                        table.insert(registry, {
                            token = token,
                            prefix = prefix,
                            rating = rating_code, -- "SPNT" or "DVNT"
                            sub_archetype = sub_arch,
                            servant_id = servant_id,
                            name_singular = creature_name_singular
                        })
                    end
                end
            end
        end
    end

    script_log("EXPERIMENT_TRANSFORM_LOG: Generated " .. servants_generated .. " servant interactions.")

    -- =========================================================
    -- PASS 2: Group by Sub-Archetype AND Rating (Split cohorts)
    -- =========================================================
    local grouped_cohorts = {} -- key: "PREFIX_RATING_SUBARCH"

    for _, entry in ipairs(registry) do
        -- Key includes Rating to ensure Sophonts and Deviants get different secrets
        local group_key = entry.prefix .. "_" .. entry.rating .. "_" .. entry.sub_archetype
        
        if not grouped_cohorts[group_key] then
            grouped_cohorts[group_key] = {
                archetype = entry.prefix,
                rating = entry.rating,
                sub_archetype = entry.sub_archetype,
                servants = {}
            }
        end
        table.insert(grouped_cohorts[group_key].servants, entry)
    end

    local experiments_generated = 0

    for group_key, group_data in pairs(grouped_cohorts) do
        local archetype = group_data.archetype
        local sub_arch = group_data.sub_archetype
        local rating = group_data.rating -- "SPNT" or "DVNT"
        
        -- 1. Define Eligibility Classes
        local rating_class_map = {
            SPNT = "SOPHONT",
            DVNT = "DEVIANT"
        }
        local full_rating_class = rating_class_map[rating] or "UNKNOWN"
        local target_class_archetype = archetype .. "_" .. sub_arch -- e.g., BIOMACHINE_DEVIL
        
        -- 2. Build CDI block for ALL servants in this group
        local cdi_accumulator = ""
        for _, servant in ipairs(group_data.servants) do
            local cdi_block = [[
            [CE_CAN_DO_INTERACTION:START:0]
                [CDI:ADV_NAME:Raise Servant (__SERVANT_NAME__)]
                [CDI:INTERACTION:__SERVANT_INTERACTION_ID__]
                [CDI:TARGET:A:TOUCHABLE]
                [CDI:USAGE_HINT:DEFEND]
                [CDI:TARGET_RANGE:A:10]
                [CDI:VERB:open a connection to the Datasphere:opens a connection to the Datasphere:NA]
                [CDI:TARGET_VERB:shudder and begin to move:shudders and begins to move]
                [CDI:WAIT_PERIOD:100]
]]
            cdi_block = cdi_block:gsub("__SERVANT_INTERACTION_ID__", servant.servant_id)
            cdi_block = cdi_block:gsub("__SERVANT_NAME__", servant.name_singular)
            cdi_accumulator = cdi_accumulator .. cdi_block
        end

        -- 3. Determine Secret Name
        local name_pretty = sub_arch:lower():gsub("^%l", string.upper) .. " " .. archetype:lower():gsub("^%l", string.upper)
        local rating_pretty = (rating == "SPNT") and "Sophont" or "Deviant"
        local interaction_id = "EXPERIMENT_COHORT_" .. group_key
        local history_name = rating_pretty .. " " .. name_pretty .. " Controller"
        
        -- Name Lookup Logic
        local lookup_key_specific = archetype .. "_" .. rating .. "_" .. sub_arch -- BIOMACHINE_SPNT_DEVIL
        local lookup_key_generic = archetype .. "_" .. sub_arch -- BIOMACHINE_DEVIL
        
        local secret_name
        if CUSTOM_SECRET_NAMES[lookup_key_specific] then
            secret_name = CUSTOM_SECRET_NAMES[lookup_key_specific]
        elseif CUSTOM_SECRET_NAMES[lookup_key_generic] then
            secret_name = CUSTOM_SECRET_NAMES[lookup_key_generic] .. " (" .. rating_pretty .. ")"
        else
            secret_name = "experimentation of the " .. name_pretty .. "s (" .. rating_pretty .. ")"
        end

        -- 4. Construct Interaction
        local interaction_raw = EXPERIMENT_INTERACTION_TEMPLATE
        interaction_raw = interaction_raw:gsub("__INTERACTION_ID__", interaction_id)
        interaction_raw = interaction_raw:gsub("__SECRET_NAME__", secret_name)
        interaction_raw = interaction_raw:gsub("__HISTORY_NAME__", history_name)
        
        -- Inject BOTH required classes (Sub-Archetype AND Rating)
        interaction_raw = interaction_raw:gsub("__ARCHETYPE_CLASS__", target_class_archetype)
        interaction_raw = interaction_raw:gsub("__RATING_CLASS__", full_rating_class)
        
        interaction_raw = interaction_raw:gsub("__GENERATED_CDI_BLOCKS__", cdi_accumulator)

        if ENABLE_RAW_LOGGING then
            interaction_raw = interaction_raw .. "\n        [LOG_CURRENT_ENTRY]"
        end

        local final_lines = split_string_to_lines(interaction_raw)
        _G.add_generated_info(final_lines)
        for _, line in ipairs(final_lines) do
            table.insert(all_interaction_lines, line)
        end
        experiments_generated = experiments_generated + 1
    end

    if #all_interaction_lines > 0 then
        if type(raws) == "table" and type(raws.register_interactions) == "function" then
            script_log("EXPERIMENT_TRANSFORM_LOG: Registering " .. experiments_generated .. " grouped cohort secrets.")
            raws.register_interactions(all_interaction_lines)
        end
    end
end

local function experiment_init_hook(creature_data_cache)
    script_log("EXPERIMENT_TRANSFORM_LOG: World generation hook activated.")
    generate_experiment_secrets(creature_data_cache)
end

return {
    preprocess = {
        experiment_init = experiment_init_hook,
    }
}