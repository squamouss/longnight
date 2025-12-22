local M = {}

local function script_log(...)
    if _G.log then _G.log(...) end
end

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
    if _G.add_generated_info then _G.add_generated_info(lines)
    else table.insert(lines, "[GENERATED]") end
end

-- =============================================================================
--  1. FINAL ATTACK GENERATION (The Effect Syndrome)
-- =============================================================================
local function generate_final_attack(config, ability_key, sev_lvl, is_self_optimized)
    local ability_list = config.ABILITY_TYPES or config.ABILITIES
    local ability = ability_list[ability_key]
    
    local id_suffix = is_self_optimized and "_FINAL_SELF" or "_FINAL"
    local id = string.format("%s_SEV_%d%s", ability.token_prefix, sev_lvl, id_suffix)
    local lines = {}
    
    table.insert(lines, "[INTERACTION:" .. id .. "]")
    add_generated_info(lines)

    -- Detect special PROPEL effect
    if ability.propel_force_base then
        local final_force = ability.propel_force_base + (sev_lvl * 100000)
        local propel_block = string.format([[
    [I_TARGET:A:LOCATION]
        [IT_LOCATION:CONTEXT_LOCATION]
    [I_TARGET:B:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_MANUAL_INPUT:target]
    [I_EFFECT:PROPEL_UNIT]
        [IE_PROPEL_FORCE:%d]
        [IE_TARGET:A]
        [IE_TARGET:B]
        [IE_IMMEDIATE]
]], final_force)
        table_merge(lines, split_to_lines({}, propel_block))
        return id, lines
    end

    local effect_duration = ability.duration or 1000
    local is_perm = (effect_duration == -1)
    local end_tag = is_perm and "" or (":END:" .. effect_duration)
    
    -- Soak is only applicable to Offensive abilities that explicitly have the soak flag.
    local should_soak = ability.role == "OFFENSE" and ability.soak

    if ability.role == "DEFENSE" or (ability.role == "OFFENSE" and not should_soak) then
        
        local manual_input_line = is_self_optimized and "" or "[IT_MANUAL_INPUT:target]"
        
        local base_target = string.format([[
    [I_TARGET:C:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        %s
]], manual_input_line)
        table_merge(lines, split_to_lines({}, base_target))

        if ability.role == "OFFENSE" then
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(lines, "        [IT_CANNOT_HAVE_SYNDROME_CLASS:FIREWALL_" .. i .. "]")
            end
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_FIREWALL_" .. i .. "]")
            end
            table.insert(lines, "        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]")
        
        elseif ability.role == "DEFENSE" and not ability.is_curse_style then
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_FIREWALL_" .. i .. "]")
            end
        end

        local effect_base = [[
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:C]
        [IE_IMMEDIATE]
        [SYNDROME]
]]
        table_merge(lines, split_to_lines({}, effect_base))
        
        if ability.role == "DEFENSE" and not ability.is_curse_style then
            table.insert(lines, "            [SYN_CLASS:FIREWALL_" .. sev_lvl .. "]")
        end

        if ability.injects_silence then
            table.insert(lines, "            [SYN_CLASS:" .. config.SILENCE_CLASS .. "]")
        end

        -- Disease Resistance Timer Vector (100 is neutral across the board)
        table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:DISEASE_RESISTANCE:100:100:START:0%s]", end_tag))

        if ability.skill_roll_adj then
            local total_adj = ability.skill_roll_adj * sev_lvl
            local forced_result = total_adj > 0 and 100 or 0
            local force_chance = math.abs(total_adj)
            table.insert(lines, string.format("            [CE_SKILL_ROLL_ADJUST:PERC:%d:PERC_ON:%d:START:0%s]", forced_result, force_chance, end_tag))
        end

        if ability.speed_penalty_base then
            local final_speed = 100 - (10 * sev_lvl) 
            if final_speed < 10 then final_speed = 10 end
            table.insert(lines, "            [CE_SPEED_CHANGE:SPEED_PERC:"..final_speed..":ABRUPT:START:0" .. end_tag .. "]")
        end

        -- BREAK logic for scaling attribute reductions
        if ability.ment_att_change then
            local final_perc = 100 - (10 * sev_lvl)
            for _, att in ipairs(ability.ment_att_change) do
                table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
            end
        end

        if ability.phys_att_change then
            local final_perc = 100 - (10 * sev_lvl)
            for _, att in ipairs(ability.phys_att_change) do
                table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
            end
        end

        local tile = config.SEVERITY_SYMBOLS[sev_lvl] or 249
        local color = config.COLORS[ability.role] or "7:0:1"
        table.insert(lines, string.format("            [CE_FLASH_TILE:TILE:%d:%s:FREQUENCY:2000:1000:START:0%s]", tile, color, end_tag))

    elseif should_soak then
        local manual_input_line = is_self_optimized and "" or "[IT_MANUAL_INPUT:target]"
        local base_target = string.format([[
    [I_TARGET:C:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        %s
]], manual_input_line)
        table_merge(lines, split_to_lines({}, base_target))

        for i = sev_lvl, config.MAX_POWER_LEVEL do
             table.insert(lines, "        [IT_CANNOT_HAVE_SYNDROME_CLASS:FIREWALL_" .. i .. "]")
        end
        for i = sev_lvl, config.MAX_POWER_LEVEL do
             table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_FIREWALL_" .. i .. "]")
        end

        table.insert(lines, "    [I_EFFECT:ADD_SYNDROME]")
        table.insert(lines, "        [IE_TARGET:C]")
        table.insert(lines, "        [IE_IMMEDIATE]")
        
        for innate_lvl = 0, (sev_lvl - 1) do
            local effective_sev = math.max(1, sev_lvl - innate_lvl)
            table.insert(lines, "        [SYNDROME]")
            
            if innate_lvl == 0 then
                for k = 1, config.MAX_POWER_LEVEL do
                     table.insert(lines, "            [SYN_IMMUNE_CLASS:INNATE_FIREWALL_" .. k .. "]")
                end
            else
                table.insert(lines, "            [SYN_AFFECTED_CLASS:INNATE_FIREWALL_" .. innate_lvl .. "]")
                for k = (innate_lvl + 1), config.MAX_POWER_LEVEL do
                     table.insert(lines, "            [SYN_IMMUNE_CLASS:INNATE_FIREWALL_" .. k .. "]")
                end
            end
            
            if ability.injects_silence then
                 table.insert(lines, "            [SYN_CLASS:" .. config.SILENCE_CLASS .. "]")
            end

            -- Disease Resistance Timer Vector (Neutral for offense soak)
            table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:DISEASE_RESISTANCE:100:100:START:0%s]", end_tag))

            if ability.skill_roll_adj then
                local total_adj = ability.skill_roll_adj * effective_sev
                local forced_result = total_adj > 0 and 100 or 0
                local force_chance = math.abs(total_adj)
                table.insert(lines, string.format("            [CE_SKILL_ROLL_ADJUST:PERC:%d:PERC_ON:%d:START:0%s]", forced_result, force_chance, end_tag))
            end
            
            if ability.speed_penalty_base then
                local final_speed = 100 - (10 * effective_sev) 
                if final_speed < 10 then final_speed = 10 end
                table.insert(lines, "            [CE_SPEED_CHANGE:SPEED_PERC:"..final_speed..":ABRUPT:START:0" .. end_tag .. "]")
            end

            -- Soakable BREAK logic
            if ability.ment_att_change then
                local final_perc = 100 - (10 * effective_sev)
                for _, att in ipairs(ability.ment_att_change) do
                    table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end

            if ability.phys_att_change then
                local final_perc = 100 - (10 * effective_sev)
                for _, att in ipairs(ability.phys_att_change) do
                    table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end
            
            local tile = config.SEVERITY_SYMBOLS[effective_sev] or 249
            local color = config.COLORS.OFFENSE or "4:0:0"
            table.insert(lines, string.format("            [CE_FLASH_TILE:TILE:%d:%s:FREQUENCY:2000:1000:START:0%s]", tile, color, end_tag))
        end
    end
    
    return id, lines
end

-- =============================================================================
--  2. PREPARE INTERACTION (The Bullet / Firing)
-- =============================================================================
local function generate_prepare_interaction(config, ability_key, sev_lvl, num_idx, final_attack_id)
    local ability_list = config.ABILITY_TYPES or config.ABILITIES
    local ability = ability_list[ability_key]
    local target_count = config.TARGET_TIERS[num_idx]
    
    local strict_name = string.format("%s_SEV_%d_NUM_%d", ability.token_prefix, sev_lvl, target_count)
    local id = "PREPARE_" .. strict_name
    local lines = {}

    table.insert(lines, "[INTERACTION:" .. id .. "]")
    add_generated_info(lines)

    local base_target = string.format([[
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]
        [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [SYNDROME]
]], config.SILENCE_CLASS)
    table_merge(lines, split_to_lines({}, base_target))
    
    local sum_tier = sev_lvl + num_idx
    local start_tick = 2
    if sum_tier >= 6 then start_tick = 4
    elseif sum_tier >= 4 then start_tick = 3 end
    
    local window_width = 100
    local end_tick = start_tick + 1
    local dwf_stretch = 8
    
    table.insert(lines, string.format("            [CE_CAN_DO_INTERACTION:PROB:100:START:%d:END:%d:DWF_STRETCH:%d]", start_tick, end_tick, dwf_stretch))
    table.insert(lines, "                [CDI:INTERACTION:" .. final_attack_id .. "]")
    table.insert(lines, "                [CDI:ADV_NAME:execute " .. strict_name .. "]")
    
    if ability.role == "DEFENSE" then
        if target_count == 1 then
             local defense_single = [[
                [CDI:USAGE_HINT:DEFEND]
                [CDI:TARGET:C:SELF_ONLY]
]]
             table_merge(lines, split_to_lines({}, defense_single))
        else
             local defense_multi = [[
                [CDI:USAGE_HINT:GREETING]
                [CDI:TARGET:C:LINE_OF_SIGHT]
                [CDI:TARGET_RANGE:C:100]
]]
             table_merge(lines, split_to_lines({}, defense_multi))
        end
    else
        local offense_target = [[
                [CDI:USAGE_HINT:ATTACK]
                [CDI:TARGET:C:LINE_OF_SIGHT]
                [CDI:TARGET_RANGE:C:100]
]]
        table_merge(lines, split_to_lines({}, offense_target))
    end
    
    table.insert(lines, "                [CDI:MAX_TARGET_NUMBER:C:" .. target_count .. "]")
    table.insert(lines, "                [CDI:WAIT_PERIOD:" .. (window_width + 10) .. "]") 
    
    local t_verb_final = "hit target:hits target:NA"
    if ability.target_verbs and ability.target_verbs[sev_lvl] then
         t_verb_final = ability.target_verbs[sev_lvl]
    elseif ability.target_verb then
         local sev_adj = config.SEVERITY_ADJECTIVES[sev_lvl] or "standard"
         t_verb_final = ability.target_verb:gsub("%%s", sev_adj)
    end
    
    table.insert(lines, "                [CDI:TARGET_VERB:" .. t_verb_final .. "]")

    return id, lines
end

-- =============================================================================
--  3. SECRET (Learning Method)
-- =============================================================================
local function generate_secret(config, ability_key, sev_lvl, num_idx, prepare_id)
    local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
    local target_count = config.TARGET_TIERS[num_idx]
    local strict_name = string.format("%s_SEV_%d_NUM_%d", ability.token_prefix, sev_lvl, target_count)
    local base_secret_id = "SECRET_" .. strict_name
    local unique_class = "HAS_" .. strict_name
    local copies_count = math.max(1, (config.WORLDGEN_RARITY_CONSTANT or 10) - (sev_lvl + num_idx))
    
    local all_lines = {}
    for i = 0, (copies_count - 1) do
        local current_id = (i > 0) and (base_secret_id .. "_COPY_" .. i) or base_secret_id
        table.insert(all_lines, "[INTERACTION:" .. current_id .. "]")
        add_generated_info(all_lines)
        
        local source_block_1 = string.format([[
    [I_SOURCE:DEITY]
        [IS_USAGE_HINT:MAJOR_CURSE]
        [IS_HIST_STRING_1: the infodeity was challenged in the Datasphere by ]
        [IS_HIST_STRING_2: who obtained the program %s]
    [I_SOURCE:SECRET]
        [IS_NAME:%s]
        [IS_SECRET_GOAL:IMMORTALITY]
        [IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]
        [IS_SECRET:MUNDANE_RESEARCH_POSSIBLE]
        [IS_SECRET:MUNDANE_TEACHING_POSSIBLE]
        [IS_SECRET:MUNDANE_RECORDING_POSSIBLE:BOOK_INSTRUCTION:SECRET_DIGITAL]
    [I_TARGET:A:CREATURE]
        [IT_LOCATION:CONTEXT_CREATURE]
        [IT_REQUIRES:CAN_LEARN]
        [IT_REQUIRES:CAN_SPEAK]
        [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
]], strict_name, strict_name, unique_class)
        table_merge(all_lines, split_to_lines({}, source_block_1))
        
        if ability.role == "DEFENSE" and target_count == 1 and not ability.is_curse_style then
            for k = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(all_lines, "        [IT_IMMUNE_CLASS:INNATE_FIREWALL_" .. k .. "]")
            end
        end

        local source_block_2 = string.format([[
    [I_EFFECT:ADD_SYNDROME]
        [IE_TARGET:A]
        [IE_IMMEDIATE]
        [IE_ARENA_NAME:%s]
        [SYNDROME]
		        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]
            [SYN_CLASS:%s]
            [CE_CAN_DO_INTERACTION:PROB:100:START:0:ABRUPT]
                [CDI:ADV_NAME:compile %s]
                [CDI:TARGET:A:SELF_ONLY]
                [CDI:INTERACTION:%s]
]], strict_name, unique_class, strict_name, prepare_id)
        table_merge(all_lines, split_to_lines({}, source_block_2))
        
        if ability.role == "DEFENSE" and target_count > 1 then table.insert(all_lines, "                [CDI:USAGE_HINT:GREETING]")
        else table.insert(all_lines, "                [CDI:USAGE_HINT:DEFEND]") end
        
        table.insert(all_lines, "                [CDI:WAIT_PERIOD:" .. ((sev_lvl + num_idx) * 100) .. "]")
        
        local role_text = config.FLAVOR_TEXT[ability.role]
        if role_text and role_text[sev_lvl] and role_text[sev_lvl][num_idx] then
            local entry = role_text[sev_lvl][num_idx]
            table.insert(all_lines, "                [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]")
        else
            table.insert(all_lines, "                [CDI:VERB:compile a program:compiles a program:NA]")
        end
        table.insert(all_lines, "") 
    end
    return base_secret_id, all_lines
end

-- =============================================================================
--  4. REACTION & INORGANIC (Crafting & Items)
-- =============================================================================
local function generate_reaction(config, ability_key, sev_lvl, num_idx, inorganic_id)
    local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
    local craft = config.CRAFTING
    local target_count = config.TARGET_TIERS[num_idx]
    local strict_name = string.format("%s_SEV_%d_NUM_%d", ability.token_prefix, sev_lvl, target_count)
    local description = string.format("Compile a %s %s program targeting %d units.", config.SEVERITY_ADJECTIVES[sev_lvl] or "standard", ability.name, target_count)
    local tier_sum = sev_lvl + num_idx - 1
    
    local lines = {}
    table.insert(lines, "[REACTION:" .. strict_name .. "_REACTION]")
    add_generated_info(lines)
    local reagent = (not craft.FREE_RECIPES) and ("[REAGENT:tablet:1:TOOL:ITEM_TOOL_TABLET_INCOMPLETE_PROGRAM" .. tier_sum .. ":NONE:NONE]") or ""
    
    local fort_block = string.format([[
    [NAME:Compile %s]
    [FORTRESS_MODE_ENABLED]
    [BUILDING:%s:NONE]
    %s
    [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s]
    [SKILL:EXTRACT_STRAND]
    [DESCRIPTION:%s]
    [CATEGORY:%s_FORT]
        [CATEGORY_NAME:Datasphere Communion Programs]
]], strict_name, craft.FORT_BUILDING, reagent, inorganic_id, description, craft.CATEGORY_ID_PREFIX)
    table_merge(lines, split_to_lines({}, fort_block))
    
    table.insert(lines, "")
    table.insert(lines, "[REACTION:" .. strict_name .. "_REACTION_ADV]")
    add_generated_info(lines)
    local adv_reagent = (not craft.FREE_RECIPES) and ("[REAGENT:scrap:"..(tier_sum * 15)..":TOOL:ITEM_TOOL_SCRAP:"..craft.ADV_SCRAP_MAT.."]") or ""
    
    local adv_block = string.format([[
    [NAME:Compile %s]
    [ADVENTURE_MODE_ENABLED]
    %s
    [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s]
    [SKILL:EXTRACT_STRAND]
    [DESCRIPTION:%s]
    [CATEGORY:%s_ADV]
        [CATEGORY_NAME:Datasphere Communion Programs]
		[CATEGORY_DESCRIPTION:Power drawn from the Datasphere]
]], strict_name, adv_reagent, inorganic_id, description, craft.CATEGORY_ID_PREFIX)
    table_merge(lines, split_to_lines({}, adv_block))

    return strict_name .. "_REACTION", lines
end

local function generate_inorganic(config, ability_key, sev_lvl, num_idx, prepare_id)
    local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
    local target_count = config.TARGET_TIERS[num_idx]
    local strict_name = string.format("%s_SEV_%d_NUM_%d", ability.token_prefix, sev_lvl, target_count)
    local unique_class = "HAS_" .. strict_name
    
    local lines = {}
    table.insert(lines, "[INORGANIC:" .. strict_name .. "_PROGRAM]")
    add_generated_info(lines)
    
    local base_material = string.format([[
    [USE_MATERIAL_TEMPLATE:MUSCLE_TABLET_TEMPLATE][MEAT][SPECIAL]
    [STATE_NAME_ADJ:ALL_SOLID:%s]
    [DISPLAY_COLOR:2:0:1][TILE:232]
    [MELTING_POINT:12070]
    [SOLID_DENSITY:400]
    [MEAT_NAME:NONE:data packet- %s:data packets- %s]
    [SYNDROME]
        [SYN_INGESTED]
        [SYN_CLASS:%s]
        [SYN_IMMUNE_CLASS:%s]
]], strict_name, strict_name, strict_name, unique_class, unique_class)
    table_merge(lines, split_to_lines({}, base_material))
    
    if ability.role == "DEFENSE" and target_count == 1 and not ability.is_curse_style then
        for k = sev_lvl, config.MAX_POWER_LEVEL do
             table.insert(lines, "        [SYN_IMMUNE_CLASS:INNATE_FIREWALL_" .. k .. "]")
        end
    end
    
    local end_material = string.format([[
        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]
        [CE_CAN_DO_INTERACTION:PROB:100:START:0]
            [CDI:ADV_NAME:compile %s]
            [CDI:TARGET:A:SELF_ONLY]
            [CDI:INTERACTION:%s]
]], strict_name, prepare_id)
    table_merge(lines, split_to_lines({}, end_material))
    
    table.insert(lines, "            [CDI:WAIT_PERIOD:" .. ((sev_lvl + num_idx) * 100) .. "]")
    if ability.role == "DEFENSE" and target_count > 1 then table.insert(lines, "            [CDI:USAGE_HINT:GREETING]") else table.insert(lines, "            [CDI:USAGE_HINT:DEFEND]") end
    
    local role_text = config.FLAVOR_TEXT[ability.role]
    if role_text and role_text[sev_lvl] and role_text[sev_lvl][num_idx] then
        table.insert(lines, "            [CDI:VERB:" .. role_text[sev_lvl][num_idx].VERB_1ST .. ":" .. role_text[sev_lvl][num_idx].VERB_3RD .. ":NA]")
    else table.insert(lines, "            [CDI:VERB:compile a program:compiles a program:NA]") end
    
    return strict_name .. "_PROGRAM", lines
end

-- =============================================================================
--  5. NPC UNLOCKER SYSTEM (UNIVERSAL)
-- =============================================================================
local function generate_npc_tiers(config, sorted_ability_keys)
    local lines = {}
    local prefix = config.CRAFTING.CATEGORY_ID_PREFIX or "DIGI_WARFARE"
    local init_class = prefix .. "_NPC_INITIALIZED"
    
    table.insert(lines, "[INTERACTION:" .. prefix .. "_NPC_UNLOCK_UNIVERSAL]")
    add_generated_info(lines)
    table.insert(lines, "    [I_TARGET:A:CREATURE]\n        [IT_LOCATION:CONTEXT_CREATURE]\n        [IT_CANNOT_HAVE_SYNDROME_CLASS:" .. init_class .. "]")
    table.insert(lines, "    [I_EFFECT:ADD_SYNDROME]\n        [IE_TARGET:A]\n        [IE_IMMEDIATE]\n        [SYNDROME]\n            [SYN_CLASS:" .. init_class .. "]")
    for i = 0, config.MAX_POWER_LEVEL do table.insert(lines, "            [SYN_AFFECTED_CLASS:INNATE_FIREWALL_" .. i .. "]") end

    for firewall_lvl = 0, config.MAX_POWER_LEVEL do
        local tier_to_grant = firewall_lvl + 2
        for _, key in ipairs(sorted_ability_keys) do
            local ability = (config.ABILITY_TYPES or config.ABILITIES)[key]
            for sev = 1, config.MAX_POWER_LEVEL do
                for num = 1, ((config.MAX_POWER_LEVEL + 1) - sev) do
                    if (sev + num) == tier_to_grant then
                        local target_count = config.TARGET_TIERS[num]
                        if not (ability.role == "DEFENSE" and target_count > 1) then
                            local strict_name = string.format("%s_SEV_%d_NUM_%d", ability.token_prefix, sev, target_count)
                            local unique_class = "HAS_" .. strict_name
                            
                            local prob = 30 
                            -- Mandatory guard rule: POSPROB is excluded from 100% prob because it is non-mandatory.
                            if ability.role == "DEFENSE" and target_count == 1 and ability.token_prefix ~= "POSPROB" then prob = 100 end
                            
                            table.insert(lines, "        [SYNDROME]")
                            table.insert(lines, "            [SYN_CLASS:" .. unique_class .. "]\n            [SYN_IMMUNE_CLASS:" .. unique_class .. "]")
                            table.insert(lines, "            [SYN_AFFECTED_CLASS:INNATE_FIREWALL_" .. firewall_lvl .. "]")
                            table.insert(lines, string.format("            [CE_CAN_DO_INTERACTION:PROB:%d:START:0:ABRUPT]", prob))
                            table.insert(lines, "                [CDI:INTERACTION:PREPARE_" .. strict_name .. "]\n                [CDI:ADV_NAME:compile npc_ability]\n                [CDI:TARGET:A:SELF_ONLY]")
                            table.insert(lines, "                [CDI:WAIT_PERIOD:" .. ((sev + num) * 100) .. "]")
                            table.insert(lines, "                [CDI:USAGE_HINT:" .. (ability.role == "DEFENSE" and "DEFEND" or "ATTACK") .. "]")
                            
                            local role_text = config.FLAVOR_TEXT[ability.role]
                            if role_text and role_text[sev] and role_text[sev][num] then
                                local entry = role_text[sev][num]
                                table.insert(lines, "                [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]")
                            else table.insert(lines, "                [CDI:VERB:compile a program:compiles a program:NA]") end
                        end
                    end
                end
            end
        end
    end
    return lines
end

-- =============================================================================
--  MAIN EXECUTION
-- =============================================================================
function M.generate(config)
    local all_interaction_lines, all_inorganic_lines, all_reaction_lines = {}, {}, {}
    script_log("DIGITAL_WARFARE: Starting generation...")

    local sorted_keys = {}
    for k in pairs(config.ABILITY_TYPES or config.ABILITIES) do table.insert(sorted_keys, k) end
    table.sort(sorted_keys)

    for _, key in ipairs(sorted_keys) do
        local ability = (config.ABILITY_TYPES or config.ABILITIES)[key]
        for sev = 1, config.MAX_POWER_LEVEL do
            local shared_id, attack_lines = generate_final_attack(config, key, sev, false)
            table_merge(all_interaction_lines, attack_lines)
            table.insert(all_interaction_lines, "")

            local self_attack_id = nil
            if ability.role == "DEFENSE" then
                local self_lines
                self_attack_id, self_lines = generate_final_attack(config, key, sev, true)
                table_merge(all_interaction_lines, self_lines)
                table.insert(all_interaction_lines, "")
            end

            for num = 1, ((config.MAX_POWER_LEVEL + 1) - sev) do 
                local target_count = config.TARGET_TIERS[num]
                local final_id = (ability.role == "DEFENSE" and target_count == 1 and self_attack_id) and self_attack_id or shared_id

                local prep_id, prep_lines = generate_prepare_interaction(config, key, sev, num, final_id)
                table_merge(all_interaction_lines, prep_lines)
                table.insert(all_interaction_lines, "")
                
                local _, sec_lines = generate_secret(config, key, sev, num, prep_id)
                table_merge(all_interaction_lines, sec_lines)
                table.insert(all_interaction_lines, "")
                
                local mat_id, mat_lines = generate_inorganic(config, key, sev, num, prep_id)
                table_merge(all_inorganic_lines, mat_lines)
                table.insert(all_inorganic_lines, "")
                
                local _, react_lines = generate_reaction(config, key, sev, num, mat_id)
                table_merge(all_reaction_lines, react_lines)
                table.insert(all_reaction_lines, "")
            end
        end
    end
    
    table_merge(all_interaction_lines, generate_npc_tiers(config, sorted_keys))

    if _G.raws then
        if _G.raws.register_interactions then _G.raws.register_interactions(all_interaction_lines) end
        if _G.raws.register_inorganics then _G.raws.register_inorganics(all_inorganic_lines) end
        if _G.raws.register_reactions then _G.raws.register_reactions(all_reaction_lines) end
    end
    return all_interaction_lines, all_inorganic_lines, all_reaction_lines
end

-- STANDALONE LOADER
if ... == nil then
    local outfile = "output_digital_warfare.txt"
    local f = io.open(outfile, "w")
    if f then f:write("--- GENERATED DIGITAL WARFARE OUTPUT ---\n"); f:close() end

    local function append_to_file(header, lines)
        local f = io.open(outfile, "a")
        if not f then return end
        f:write("\n" .. header .. "\n")
        for _, line in ipairs(lines) do f:write(line .. "\n") end
        f:close()
    end

    _G.raws = {
        register_interactions = function(lines) append_to_file("[OBJECT:INTERACTION]", lines) end,
        register_inorganics = function(lines) append_to_file("[OBJECT:INORGANIC]", lines) end,
        register_reactions = function(lines) append_to_file("[OBJECT:REACTION]", lines) end,
    }

    local status, config = pcall(require, "config_digital_warfare")
    if not status then status, config = pcall(dofile, "config_digital_warfare.lua") end
    if status and config then M.generate(config) end
end

return M