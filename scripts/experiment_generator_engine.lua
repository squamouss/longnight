local log = _G.log or print
log("EXP_ENGINE: Loading Experiment Generator Engine (v7.6 Strict Filtering)...")

local experiment_rules = require("experiment_rules")
local engine_module = require("creature_generator_engine") 

-- [[ CRITICAL: Capture Vanilla Functions Safely ]]
if not _G.vanilla_experiment_functions then
    _G.vanilla_experiment_functions = {
        humanoid = creatures.experiment.humanoid.default,
        humanoid_giant = creatures.experiment.humanoid_giant.default,
        beast_small = creatures.experiment.beast_small.default,
        beast_large = creatures.experiment.beast_large.default,
        failed_small = creatures.experiment.failed_small.default,
        failed_large = creatures.experiment.failed_large.default,
    }
end

-- ============================================================================
-- STATIC DEFINITIONS (ALIASES & MAPS)
-- ============================================================================

-- Maps dynamic name variations back to the config Key
local ARCHETYPE_ALIASES = {
    -- BIOMACHINE variants
    ["BIOROID"] = "BIOMACHINE",
    ["BIOFRAME"] = "BIOMACHINE",
    ["BIODRONE"] = "BIOMACHINE",
    ["BIODEITY"] = "BIOMACHINE",
    ["BIOCALAMITY"] = "BIOMACHINE",
    ["BIOMECH"] = "BIOMACHINE",
    
    -- DEMIMACHINE variants
    ["DEMIROID"] = "DEMIMACHINE",
    ["DEMIFRAME"] = "DEMIMACHINE",
    ["DEMIDRONE"] = "DEMIMACHINE",
    ["DEMIDEITY"] = "DEMIMACHINE",
    ["DEMICALAMITY"] = "DEMIMACHINE",
    ["DEMIMECH"] = "DEMIMACHINE",

    -- CYBERMACHINE variants
    ["CYBEROID"] = "CYBERMACHINE",
    ["CYBERFRAME"] = "CYBERMACHINE",
    ["CYBERDRONE"] = "CYBERMACHINE",
    ["CYBERDEITY"] = "CYBERMACHINE",
    ["CYBERCALAMITY"] = "CYBERMACHINE",
    ["CYBERMECH"] = "CYBERMACHINE",

    -- NANOMACHINE variants
    ["NANOROID"] = "NANOMACHINE",
    ["NANOFRAME"] = "NANOMACHINE",
    ["NANODRONE"] = "NANOMACHINE",
    ["NANODEITY"] = "NANOMACHINE",
    ["NANOCALAMITY"] = "NANOMACHINE",
    ["NANOMECH"] = "NANOMACHINE",
    
    -- HOLOMACHINE variants
    ["HOLOROID"] = "HOLOMACHINE",
    ["HOLOFRAME"] = "HOLOMACHINE",
    ["HOLODRONE"] = "HOLOMACHINE",
    ["HOLODEITY"] = "HOLOMACHINE",
    ["HOLOCALAMITY"] = "HOLOMACHINE",
    ["HOLOMECH"] = "HOLOMACHINE",
    
    -- XENOMACHINE variants
    ["XENOROID"] = "XENOMACHINE",
    ["XENOFRAME"] = "XENOMACHINE",
    ["XENODRONE"] = "XENOMACHINE",
    ["XENODEITY"] = "XENOMACHINE",
    ["XENOCALAMITY"] = "XENOMACHINE",
    ["XENOMECH"] = "XENOMACHINE",


    -- EXCASTE variants
    ["OUTCASTE"] = "EXCASTE",
    
    -- Standard Castes (Self-mapping for safety)
    ["LOCASTE"] = "LOCASTE",
    ["HICASTE"] = "HICASTE",
    ["NUCASTE"] = "NUCASTE",
    ["CYCASTE"] = "CYCASTE"
}

local COMMON_RATING_MAP = {
    ["SPNT"] = "SOPHONT",
    ["HSTL"] = "HOSTILE",
    ["VSSL"] = "VESSEL",
    ["DVNT"] = "DEVIANT",
    ["AVTR"] = "AVATAR",
    ["INCR"] = "INCURSION",
    ["NCUR"] = "INCURSION",
    ["DNGR"] = "DANGEROUS",
    ["BNGN"] = "BENIGN",
    ["HZRD"] = "HAZARDOUS",
    ["PRBM"] = "PROBLEMATIC",
    ["EXST"] = "EXISTENTIAL",
    ["VRMN"] = "VERMIN",
    ["AMBT"] = "AMBIENT",
    ["DMST"] = "DOMESTIC",
    ["VHCL"] = "VEHICLE",
    ["CRER"] = "CARRIER",
    ["NMAD"] = "NOMAD",
    ["WEPN"] = "WEAPON",
    ["LABR"] = "LABOR",
    ["SRVT"] = "SERVANT",
    ["HNTR"] = "HUNTER",
    ["SNTN"] = "SANITATION",
    ["PRDC"] = "PRODUCT",
    ["CMPN"] = "COMPANION",
    ["MLTR"] = "MILITARY"
}

-- ============================================================================
-- ENGINE LOGIC
-- ============================================================================

local function get_ropar_context()
    local ctx = { name = "Unknown", race = "Unknown", civ = "Unknown", year = tostring(world.year or 0) }
    local ropar = _G.random_object_parameters
    if ropar then
        if ropar.experimenter_hf and ropar.experimenter_hf.name then ctx.name = ropar.experimenter_hf.name.translated end
        if ropar.experimenter_race_name then ctx.race = ropar.experimenter_race_name end
        if ropar.experimenter_capital_st and ropar.experimenter_capital_st.name then ctx.civ = ropar.experimenter_capital_st.name.translated end
    end
    return ctx
end

local function pick_weighted_outcome(outcomes)
    local total = 0
    for _, out in ipairs(outcomes) do total = total + (out.weight or 1) end
    local roll = math.random(0, total - 1)
    local current = 0
    for _, out in ipairs(outcomes) do
        current = current + (out.weight or 1)
        if roll < current then return out end
    end
    return outcomes[1]
end

local function parse_experimenter_identity(lookup_config)
    local ropar = _G.random_object_parameters
    if not ropar then return nil, nil, nil end

    local raw_id = nil
    if ropar.experimenter_creature and ropar.experimenter_creature.creature_id then
        raw_id = ropar.experimenter_creature.creature_id
    end
    if not raw_id and ropar.experimenter_race_name then
        raw_id = string.upper(ropar.experimenter_race_name)
    end

    if not raw_id then return nil, nil, nil end

    log("EXP_ENGINE: Parsing Identity from [" .. raw_id .. "]")

    local normalized_id = raw_id:gsub("[ -]", "_")
    local parts = {}
    for part in string.gmatch(normalized_id, "[^_]+") do
        table.insert(parts, part)
    end

    if #parts < 2 then return parts[1], nil, nil end

    local raw_archetype = parts[1]
    local resolved_archetype = ARCHETYPE_ALIASES[raw_archetype] or raw_archetype
    local sub_archetype = parts[#parts]
    if tonumber(sub_archetype) then
        sub_archetype = nil
    end
    
    local found_rating = nil
    local reverse_map = {}
    if lookup_config and lookup_config.TRAIT_NAME_MODIFIERS then
        for full_tag, abbr in pairs(lookup_config.TRAIT_NAME_MODIFIERS) do
            reverse_map[abbr] = full_tag
        end
    end
    
    for _, part in ipairs(parts) do
        if reverse_map[part] then
            found_rating = reverse_map[part]
            break
        elseif COMMON_RATING_MAP[part] then
            found_rating = COMMON_RATING_MAP[part]
            break
        end
    end
    
    return resolved_archetype, sub_archetype, found_rating
end

local function check_allowed_targets(case, ropar)
    -- If the rule has no restricted list, allow everything (vanilla behavior).
    if not case.allowed_targets then return true end
    
    -- SAFETY: If we can't read the parameters, BLOCK the experiment.
    if not ropar then return false end 

    -- [[ FAIL-CLOSED LOGIC UPDATE ]] --
    -- We removed the "-1" population check that was bypassing the whitelist.
    -- We now strictly require identifying the victim ID.

    local victim_id = nil
    
    -- Attempt 1: Get ID from the creature object (Specific Histfig)
    if ropar.experiment_source_creature and ropar.experiment_source_creature.creature_id then
        victim_id = ropar.experiment_source_creature.creature_id
    end
    
    -- Attempt 2: Get ID from the race name (Generic Population)
    if not victim_id and ropar.experiment_source_race_name then
        victim_id = string.upper(ropar.experiment_source_race_name)
    end

    -- FAIL-SAFE: If we still don't know what the victim is, we must BLOCK the experiment.
    if not victim_id then 
        log("EXP_ENGINE: >> REJECTED: Could not identify victim ID. Aborting for safety.")
        return false 
    end

    -- STRICT FILTERING: Check the Victim ID against the Allowed Targets list.
    for _, allowed in ipairs(case.allowed_targets) do
        if string.find(victim_id, string.upper(allowed)) then
            return true
        end
    end

    -- If no match found, block it.
    log("EXP_ENGINE: >> REJECTED: Victim ["..victim_id.."] is not in allowed list for this case.")
    return false
end

-- [[ HELPER: Post-Process Lines ]]
local function finalize_experiment_raws(lines, config)
    local cleaned_lines = {}
    
    table.insert(cleaned_lines, "[NIGHT_CREATURE]")
    -- [[ CRITICAL: Apply Guard Tag ]] --
    -- This ensures all new experiments become Supernatural, protecting them
    -- from future HF-targeted experimentation via the filter below.
    table.insert(cleaned_lines, "[SUPERNATURAL]")

    local extra_desc = ""
    if config.experiment_context and config.experiment_context.desc_func and config.experiment_context.ropar_ctx then
        extra_desc = config.experiment_context.desc_func(config.experiment_context.ropar_ctx)
    end

    for _, line in ipairs(lines) do
        if line:match("^%[CREATURE:") then
             -- Skip
        else
            if line:match("^%[DESCRIPTION:") and (string.find(line, "in mass", 1, true) or string.find(line, "APPROX_MASS", 1, true)) then
                if extra_desc ~= "" then
                    local content = line:match("^%[DESCRIPTION:(.*)%]$") or ""
                    if not string.find(content, extra_desc, 1, true) then
                        local spacer = (content ~= "" and content:sub(-1) ~= " ") and " " or ""
                        line = "[DESCRIPTION:" .. content .. spacer .. extra_desc .. "]"
                    end
                end
            end
            table.insert(cleaned_lines, line)
        end
    end
    
    return { raws = cleaned_lines, weight = 100 }
end

-- [[ HELPER: Universal Fallback Generator (Config-Driven) ]]
local function generate_fallback_experiment(experiment_type, tok)
    local fallback_rule = experiment_rules.universal_fallback_profile
    if not fallback_rule or not fallback_rule.config then
        log("EXP_ENGINE: CRITICAL WARNING - No universal_fallback_profile found. Returning nil.")
        return nil -- Return nil to abort
    end

    if fallback_rule.enable_fallback == false then
        log("EXP_ENGINE: >> Universal Fallback is DISABLED. Aborting (Strict Mode).")
        return nil -- Return nil to abort
    end

    log("EXP_ENGINE: >> Initiating Universal Fallback Protocol (Config-Driven).")

    local config = {}
    for k, v in pairs(fallback_rule.config) do config[k] = v end

    -- Force settings from the rule
    config.forced_rating = fallback_rule.forced_rating
    config.forced_sub_archetypes = fallback_rule.forced_sub_archetypes
    config.forced_size = fallback_rule.forced_size

    config.experiment_context = {
        type = experiment_type,
        token = tok,
        experimenter_id = "FALLBACK_SYSTEM",
        ropar_ctx = get_ropar_context(),
        desc_func = fallback_rule.description_generator
    }

    local result = engine_module.generate_data_only(config)

    if result and result[1] and result[1].creature then
        return finalize_experiment_raws(result[1].creature, config)
    end

    log("EXP_ENGINE: Fallback generation failed to produce output.")
    return nil -- Return nil to abort
end

-- [[ HELPER: Check for NANOZOMBIE Experimenter ]] --
local function is_experimenter_zombie(ropar)
    if not ropar or not ropar.experimenter_hf then return false end
    local hf = ropar.experimenter_hf
    
    if not hf.syndromes or not hf.syndromes.active then return false end
    
    -- Access global world raws to find syndrome definition by ID
    local syndromes_all = _G.world and _G.world.raws and _G.world.raws.syndromes and _G.world.raws.syndromes.all
    if not syndromes_all then return false end

    for _, hf_syn in ipairs(hf.syndromes.active) do
        local syn = syndromes_all[hf_syn.syndrome_id]
        if syn and syn.syn_class then
            for _, class_entry in ipairs(syn.syn_class) do
                -- Handle both direct string and object wrapper (DF structure compatibility)
                local val = type(class_entry) == "string" and class_entry or class_entry.value
                if val == "NANOZOMBIE" then
                    return true
                end
            end
        end
    end
    
    return false
end

local function run_experiment_hook(experiment_type, tok)
    local ropar = _G.random_object_parameters
    
    -- [[ 1. ZOMBIE EXPERIMENTER CHECK ]] --
    -- If the experimenter has the [SYN_CLASS:NANOZOMBIE] tag, abort immediately.
    if is_experimenter_zombie(ropar) then
        log("EXP_ENGINE: >> ABORTING: Experimenter is a zomhie.")
        return nil
    end

    -- [[ 2. RECURSION & HISTORICAL FIGURE SAFETY FILTER ]] --
    if ropar and ropar.experiment_source_creature then
        local flags = ropar.experiment_source_creature.flags or {}
        
        local is_hf_target = (ropar.experimenter_source_hfid and ropar.experimenter_source_hfid ~= -1)
        local is_supernatural_species = flags.SUPERNATURAL
        
        -- FILTER LOGIC:
        -- 1. If targeting a Specific HF AND that species is Supernatural -> BLOCK.
        --    (Prevents breaking unique entities or "Experiment-on-Experiment" individuals).
        -- 2. If targeting a Specific HF AND species is Mundane -> ALLOW.
        --    (Urist McHuman can become an experiment).
        -- 3. If targeting a Population (HFID -1) -> ALLOW.
        --    (Recursive caste generation on Biomachines is allowed).
        
        if is_hf_target and is_supernatural_species then
             local race_name = ropar.experiment_source_race_name or "Unknown"
             log("EXP_ENGINE: >> ABORTING: Target is an experimented-on histfig (ID: " .. tostring(ropar.experimenter_source_hfid) .. ", Race: " .. race_name .. ").")
             return nil
        end
    end

    local decoder_config = nil
    for _, rule in pairs(experiment_rules.outcomes_by_experimenter_tag) do
        if rule.cases and rule.cases[1] and rule.cases[1].outcomes[1] then
            decoder_config = rule.cases[1].outcomes[1].config
            break
        end
    end

    local exp_archetype, exp_sub, exp_rating = parse_experimenter_identity(decoder_config)
    
    if exp_archetype and not experiment_rules.outcomes_by_experimenter_tag[exp_archetype] then
        for key, _ in pairs(experiment_rules.outcomes_by_experimenter_tag) do
            if string.find(key, exp_archetype) or string.find(exp_archetype, key) then
                log("EXP_ENGINE: >> Fuzzy Match: Mapped [" .. exp_archetype .. "] -> [" .. key .. "]")
                exp_archetype = key
                break
            end
        end
    end

    log("EXP_ENGINE: Request ["..experiment_type.."]. Context: "..(exp_archetype or "UNK").." / "..(exp_sub or "UNK").." / "..(exp_rating or "UNK"))

    local rule_entry = experiment_rules.outcomes_by_experimenter_tag[exp_archetype]

    if rule_entry then
        local inherited_sub_archetypes = nil
        if exp_sub and rule_entry.sub_archetype_inheritance then
            inherited_sub_archetypes = rule_entry.sub_archetype_inheritance[exp_sub]
        end

        local valid_outcomes = nil
        
        if rule_entry.cases then
            -- 1. Try specific match
            if exp_rating then
                for _, case in ipairs(rule_entry.cases) do
                    if case.required_secondary_tag == exp_rating and check_allowed_targets(case, ropar) then
                        valid_outcomes = case.outcomes
                        log("EXP_ENGINE: >> Matched Case via Rating [" .. exp_rating .. "]")
                        break
                    end
                end
            end
            
            -- 2. Try default within archetype (no required tag)
            if not valid_outcomes then
                for _, case in ipairs(rule_entry.cases) do
                    if not case.required_secondary_tag and check_allowed_targets(case, ropar) then
                        valid_outcomes = case.outcomes
                        log("EXP_ENGINE: >> Using Archetype Default Case.")
                        break
                    end
                end
            end
        end

        if valid_outcomes then
            local chosen_outcome = pick_weighted_outcome(valid_outcomes)
            
            if chosen_outcome and chosen_outcome.config then
                local config = {}
                for k,v in pairs(chosen_outcome.config) do config[k] = v end
                
                config.forced_rating = chosen_outcome.forced_rating
                
                if chosen_outcome.forced_sub_archetypes then
                    config.forced_sub_archetypes = chosen_outcome.forced_sub_archetypes
                else
                    config.forced_sub_archetypes = inherited_sub_archetypes
                end
                
                if chosen_outcome.forced_size then
                    config.forced_size = chosen_outcome.forced_size
                end

                config.experiment_context = {
                    type = experiment_type,
                    token = tok,
                    experimenter_id = exp_archetype,
                    ropar_ctx = get_ropar_context(),
                    desc_func = chosen_outcome.description_generator
                }
                
                local result = engine_module.generate_data_only(config)
                
                if result and result[1] and result[1].creature then
                    return finalize_experiment_raws(result[1].creature, config)
                else
                    log("EXP_ENGINE: >> Generation Failed (Duplicates or Error). Aborting experiment.")
                    return nil -- Return nil to abort gracefully
                end
            end
        else
            log("EXP_ENGINE: >> Error: No valid case found for this experimenter state. Using Universal Fallback.")
            return generate_fallback_experiment(experiment_type, tok)
        end
    else
         log("EXP_ENGINE: No rule found for [" .. tostring(exp_archetype) .. "]. Using Universal Fallback.")
         return generate_fallback_experiment(experiment_type, tok)
    end

    return nil -- Return nil at the very end to prevent "Nothing" creatures
end

creatures.experiment.humanoid.default = function(tok) return run_experiment_hook("humanoid", tok) end
creatures.experiment.humanoid_giant.default = function(tok) return run_experiment_hook("humanoid_giant", tok) end
creatures.experiment.beast_small.default = function(tok) return run_experiment_hook("beast_small", tok) end
creatures.experiment.beast_large.default = function(tok) return run_experiment_hook("beast_large", tok) end
creatures.experiment.failed_small.default = function(tok) return run_experiment_hook("failed_small", tok) end
creatures.experiment.failed_large.default = function(tok) return run_experiment_hook("failed_large", tok) end

return {}