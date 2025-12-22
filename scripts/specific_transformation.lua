local ENABLE_LOGGING = true
local ENABLE_RAW_LOGGING = false 

local TRANSFORMATION_PREFIX_POOLS = {
	CYCASTE = { "CYCASTE", "LOCASTE", "HICASTE", "EXCASTE", "NUCASTE"},
	BIOMACHINE = { "BIOMACHINE", "LOCASTE", "NUCASTE", "EXCASTE" },
	DEMIMACHINE = { "DEMIMACHINE", "NUCASTE", "LOCASTE", "HICASTE", "EXCASTE" },
	CYBERMACHINE = { "CYBERMACHINE", "LOCASTE", "NUCASTE", "HICASTE"},
	NANOMACHINE = { "NANOMACHINE", "LOCASTE", "NUCASTE", "EXCASTE"},
	HOLOMACHINE = { "HOLOMACHINE", "LOCASTE", "NUCASTE", "EXCASTE"},
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

local GROUPED_INTERACTION_TEMPLATE_RAW = [[
[INTERACTION:__INTERACTION_ID__]
	[I_SOURCE:DEITY]
		[IS_USAGE_HINT:MAJOR_CURSE]
		[IS_HIST_STRING_1: the infodeity was challenged in the Datasphere by ]
		[IS_HIST_STRING_2: was inducted as a __TARGET_CASTE_NAME_FOR_HISTORY__]
	[I_SOURCE:SECRET]
		[IS_NAME:__TARGET_CASTE_NAME_FOR_SECRET__]
		[IS_SECRET_GOAL:IMMORTALITY]
		[IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]
		[IS_SECRET:MUNDANE_RESEARCH_POSSIBLE]
		[IS_SECRET:MUNDANE_TEACHING_POSSIBLE]
	[I_TARGET:A:CREATURE]
		[IT_LOCATION:CONTEXT_CREATURE]
		[IT_REQUIRES:CAN_LEARN]
		[IT_REQUIRES:CAN_SPEAK]
__AFFECTED_SOURCE_CLASS_LIST__
		[IT_CANNOT_HAVE_SYNDROME_CLASS:TRANSCEND]
	[I_EFFECT:ADD_SYNDROME]
		[IE_TARGET:A]
		[IE_IMMEDIATE]
		[IE_ARENA_NAME:N-core (__TARGET_CASTE_NAME_FOR_HISTORY__)]

		[SYNDROME]
		[SYN_CLASS:TRANSCEND]
__FEMALE_SYNDROME_CLASS_LIST__
        [CE_BODY_TRANSFORMATION:PROB:100:START:0]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:__TARGET_CASTE_FEMALE__]

        [SYNDROME]
		[SYN_CLASS:TRANSCEND]
__MALE_SYNDROME_CLASS_LIST__
        [CE_BODY_TRANSFORMATION:PROB:100:START:0]
            [CE:CREATURE:__TARGET_CREATURE_TOKEN__:__TARGET_CASTE_MALE__]
]]

-- [[ UPDATED: Logic to capture Global Caste Names ]] --
local function parse_creature_castes(raw_lines)
    local found_castes = {}
    local current_caste = nil
    local current_caste_name = nil
    local global_caste_name = nil -- Capture name defined before [CASTE:...]

    for _, line in ipairs(raw_lines) do
        local caste_token = line:match("%[CASTE:([^%]]-)%]")
        local caste_name_singular = line:match("%[CASTE_NAME:([^:]+):[^%]]+%]")

        -- If we find a CASTE_NAME before any CASTE token, it's the default/global name
        if caste_name_singular and not current_caste then
            global_caste_name = caste_name_singular
        end

        if caste_token then
            if current_caste then
                -- If the previous caste didn't get a specific name, use global
                if not current_caste.name then current_caste.name = global_caste_name end
                table.insert(found_castes, current_caste)
            end
            
            -- Start new caste
            current_caste = { token = trim(caste_token), gender = nil, name = nil, raw_lines = { line } }
            current_caste_name = nil

            if line:match("%[MALE%]") then current_caste.gender = "MALE"
            elseif line:match("%[FEMALE%]") then current_caste.gender = "FEMALE" end
        
        elseif current_caste then
            table.insert(current_caste.raw_lines, line)
            if line:match("%[MALE%]") then current_caste.gender = "MALE"
            elseif line:match("%[FEMALE%]") then current_caste.gender = "FEMALE" end
            
            if caste_name_singular then
                current_caste.name = caste_name_singular
            end
        end
    end

    if current_caste then
        if not current_caste.name then current_caste.name = global_caste_name end
        table.insert(found_castes, current_caste)
    end
    return found_castes
end

local function generate_specific_n_core_secrets(creature_data_cache)
    script_log("SPECIFIC_TRANSFORMATION_LOG: Initializing V5.13 (Name Syntax Fix).")

    if not creature_data_cache or #creature_data_cache == 0 then return end

    local all_eligible_targets = {}
    for _, creature_entry in ipairs(creature_data_cache) do
        local creature_raw_lines = creature_entry.creature
        local base_creature_token = creature_raw_lines[1] and creature_raw_lines[1]:match("%[CREATURE:(.-)%]")

        if base_creature_token and not base_creature_token:match("_TRANSCENDENT_") then
            local is_eligible = false
            for _, line in ipairs(creature_raw_lines) do
                if line:match("%[CREATURE_CLASS:SOPHONT%]") or 
                   line:match("%[CREATURE_CLASS:DEVIANT%]") or 
                   line:match("%[CREATURE_CLASS:AVATAR%]") then 
                    is_eligible = true; break 
                end
            end

            if is_eligible then
                local prefix = extract_prefix(base_creature_token)
                local creature_name_singular = "UNKNOWN"
                for _, line in ipairs(creature_raw_lines) do
                    local s = line:match("%[NAME:([^:]+):[^%]]+%]")
                    if s then creature_name_singular = s; break end
                end

                if prefix then
                    table.insert(all_eligible_targets, {
                        token = trim(base_creature_token),
                        prefix = prefix,
                        raws = creature_raw_lines,
                        name_singular = creature_name_singular
                    })
                end
            end
        end
    end

    local all_interaction_lines_to_register = {}
    local interactions_generated = 0

    for _, target_creature in ipairs(all_eligible_targets) do
        local valid_source_prefixes = TRANSFORMATION_PREFIX_POOLS[target_creature.prefix]
        
        if valid_source_prefixes and #valid_source_prefixes > 0 then
            local target_castes = parse_creature_castes(target_creature.raws)
            local i = 1
            while i <= #target_castes - 1 do
                local caste_A = target_castes[i]
                local caste_B = target_castes[i+1]
                local male_caste, female_caste = nil, nil
                
                if caste_A.gender == "MALE" and caste_B.gender == "FEMALE" then
                    male_caste = caste_A; female_caste = caste_B
                elseif caste_A.gender == "FEMALE" and caste_B.gender == "MALE" then
                    female_caste = caste_A; male_caste = caste_B
                end
                
                if male_caste and female_caste then
                    local pair_has_slow_learner = false
                    for _, line in ipairs(male_caste.raw_lines) do
                        if line:match("%[SLOW_LEARNER%]") then pair_has_slow_learner = true; break end
                    end
                    if not pair_has_slow_learner then
                        for _, line in ipairs(female_caste.raw_lines) do
                            if line:match("%[SLOW_LEARNER%]") then pair_has_slow_learner = true; break end
                        end
                    end
                    
                    if not pair_has_slow_learner then
                        local male_caste_token = male_caste.token
                        local female_caste_token = female_caste.token
                        
                        local affected_source_class_tags, female_syndrome_class_tags, male_syndrome_class_tags = {}, {}, {}
                        for _, source_prefix in ipairs(valid_source_prefixes) do
                            local male_class = source_prefix:upper() .. "_MALE"
                            local female_class = source_prefix:upper() .. "_FEMALE"
                            table.insert(affected_source_class_tags, "        [IT_AFFECTED_CLASS:" .. male_class .. "]")
                            table.insert(affected_source_class_tags, "        [IT_AFFECTED_CLASS:" .. female_class .. "]")
                            table.insert(female_syndrome_class_tags, "        [SYN_AFFECTED_CLASS:" .. female_class .. "]")
                            table.insert(male_syndrome_class_tags, "        [SYN_AFFECTED_CLASS:" .. male_class .. "]")
                        end

                        local name_to_use_for_item, history_name
                        -- Use caste name if available, otherwise creature name
                        if male_caste.name then
                            name_to_use_for_item = male_caste.name
                        else
                            name_to_use_for_item = target_creature.name_singular
                        end
                        history_name = name_to_use_for_item
                        
                        local interaction_id = "SECRET_BECOME_" .. target_creature.token .. "::" .. male_caste.token
                        
                        -- [[ FIX: Changed format string to avoid double colons inside the name ]] --
                        local interaction_name_machine = string.format("secrets of the %s", name_to_use_for_item)
                        -- If you want the "Item" name (used in item_gen) to stay readable, this format works better for both:
                        -- "secrets of the Biomech-V1" -> DF displays "learned the secrets of the Biomech-V1"
                        
                        local interaction_raw = GROUPED_INTERACTION_TEMPLATE_RAW
                        interaction_raw = interaction_raw:gsub("__INTERACTION_ID__", interaction_id)
                        interaction_raw = interaction_raw:gsub("__TARGET_CASTE_NAME_FOR_HISTORY__", history_name)
                        interaction_raw = interaction_raw:gsub("__TARGET_CASTE_NAME_FOR_SECRET__", interaction_name_machine)
                        interaction_raw = interaction_raw:gsub("__TARGET_CREATURE_TOKEN__", target_creature.token)
                        interaction_raw = interaction_raw:gsub("__TARGET_CASTE_MALE__", male_caste_token)
                        interaction_raw = interaction_raw:gsub("__TARGET_CASTE_FEMALE__", female_caste_token)
                        
                        interaction_raw = interaction_raw:gsub("__AFFECTED_SOURCE_CLASS_LIST__", table.concat(affected_source_class_tags, "\n"))
                        interaction_raw = interaction_raw:gsub("__FEMALE_SYNDROME_CLASS_LIST__", table.concat(female_syndrome_class_tags, "\n"))
                        interaction_raw = interaction_raw:gsub("__MALE_SYNDROME_CLASS_LIST__", table.concat(male_syndrome_class_tags, "\n"))

                        if ENABLE_RAW_LOGGING then
                            interaction_raw = interaction_raw .. "\n        [LOG_CURRENT_ENTRY]"
                        end

                        local interaction_as_table_of_lines = split_string_to_lines(interaction_raw)
                        _G.add_generated_info(interaction_as_table_of_lines)
                        
                        for _, line in ipairs(interaction_as_table_of_lines) do
                            table.insert(all_interaction_lines_to_register, line)
                        end
                        interactions_generated = interactions_generated + 1
                    end
                    i = i + 1
                end
                i = i + 1
            end
        end
    end

    if #all_interaction_lines_to_register > 0 then
        if type(raws) == "table" and type(raws.register_interactions) == "function" then
            script_log("SPECIFIC_TRANSFORMATION_LOG: Registering " .. interactions_generated .. " new interactions.")
            raws.register_interactions(all_interaction_lines_to_register)
        end
    end
end

local function transformation_init_hook(creature_data_cache)
    script_log("SPECIFIC_TRANSFORMATION_LOG: World generation hook activated.")
    generate_specific_n_core_secrets(creature_data_cache)
end

return {
    preprocess = {
        transformation_init = transformation_init_hook,
    }
}