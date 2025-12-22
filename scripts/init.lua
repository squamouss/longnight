local function add_current_dir_to_path()
 
    local info = debug.getinfo(1, "S")
    if info and info.source then 
        local script_path = info.source:match("@?(.*/)")
        if script_path then
		
            package.path = script_path .. "?.lua;" .. package.path
            
            if _G.log then _G.log("INIT_LOG: Path Fix Applied. Added: " .. script_path) end
        end
    end
end
add_current_dir_to_path()

local ENABLE_LUALOG = true
local original_log = _G.log
local function custom_log(...)
    if ENABLE_LUALOG and type(original_log) == "function" then
        original_log(...)
    end
end
_G.log = custom_log
if _G.get_caller_loc_string == nil then
    _G.get_caller_loc_string = function() return "[Location Unknown]" end
end

-- =====================================================================================
-- TABLE INITIALIZATION
-- =====================================================================================
if materials == nil then materials = {} end
if items == nil then items = {} end
if languages == nil then languages = {} end
if creatures == nil then creatures = {} end
if interactions == nil then interactions = {} end
if entities == nil then entities = {} end
if preprocess == nil then preprocess = {} end
if do_once == nil then do_once = {} end
if postprocess == nil then postprocess = {} end
if do_once_early == nil then do_once_early = {} end

-- =====================================================================================
-- GLOBAL REGISTRY INITIALIZATION
-- =====================================================================================
if _G.global_creature_fingerprints == nil then
    _G.global_creature_fingerprints = {}
    _G.log("INIT_LOG: Initialized global creature fingerprint registry.")
end

-- =====================================================================================
-- DEV CACHE BUSTER
-- =====================================================================================
_G.log("INIT_LOG: Busting 'require' cache for development...")
local modules_to_bust = {
--for dev stuff
}
for _, mod_name in ipairs(modules_to_bust) do
    package.loaded[mod_name] = nil
end
_G.log("INIT_LOG: Cache busted for " .. #modules_to_bust .. " modules.")
-- =====================================================================================


-- =====================================================================================
-- MODULE REQUIREMENTS
-- =====================================================================================
_G.log("INIT_LOG: Requiring all generator modules...")

local function safe_require(module_name)
    local success, module = pcall(require, module_name)
    if success then
        _G.log("INIT_LOG: Successfully loaded module '" .. module_name .. "'.")
        return module
    else
        _G.log("INIT_LOG: FATAL ERROR loading module '" .. module_name .. "': " .. tostring(module))
        return nil
    end
end

safe_require("megastructure_generator")

-- 1. Load Engines 
local creature_generator_engine = safe_require("creature_generator_engine")
local experiment_generator_engine = safe_require("experiment_generator_engine") 
local weaponizer_engine = safe_require("weaponizer_engine")
local config_weapons = safe_require("config_weapons")

-- 2. Load Language Modules
safe_require("filter")
safe_require("languages.conlang_locant_1")
safe_require("languages.conlang_locant_2")
safe_require("languages.conlang_locant_3")
safe_require("languages.conlang_locant_4")
safe_require("languages.conlang_locant_5")
safe_require("languages.conlang_locant_6")
safe_require("languages.conlang_excant_1")
safe_require("languages.conlang_excant_2")
safe_require("languages.conlang_excant_3")
safe_require("languages.conlang_uncant_1")
safe_require("languages.conlang_uncant_2")
safe_require("languages.conlang_uncant_3")
safe_require("languages.conlang_hicant")
safe_require("languages.conlang_postcant_1")
safe_require("languages.conlang_postcant_2")
safe_require("languages.conlang_postcant_3")
safe_require("languages.conlang_endcant")

-- 3. Load Configs
local config_files = {
    {data = safe_require("config_locaste"), name = "config_locaste", generate_early = true},
    {data = safe_require("config_hicaste"), name = "config_hicaste", generate_early = true},
    {data = safe_require("config_nucaste"), name = "config_nucaste", generate_early = true},
    {data = safe_require("config_excaste"), name = "config_excaste", generate_early = true},
    {data = safe_require("config_cycaste"), name = "config_cycaste", generate_early = true},
    {data = safe_require("config_biomachine"), name = "config_biomachine", generate_early = true},
    {data = safe_require("config_cybermachine"), name = "config_cybermachine", generate_early = true},
    {data = safe_require("config_demimachine"), name = "config_demimachine", generate_early = true},
    {data = safe_require("config_nanomachine"), name = "config_nanomachine", generate_early = true},
    {data = safe_require("config_protochimera"), name = "config_protochimera", generate_early = true},
    {data = safe_require("config_chimera"), name = "config_chimera", generate_early = true},
    {data = safe_require("config_macrocell"), name = "config_macrocell", generate_early = true},
    {data = safe_require("config_polymerid"), name = "config_polymerid", generate_early = true}
}

-- 4. Load Dependent Modules
local dynamic_civilization_generator_module = safe_require("dynamic_civilization_generator")
local dynamic_invasion_generator_module = safe_require("dynamic_invasion_generator")
local dynamic_tribe_generator_module = safe_require("dynamic_tribe_generator")
local specific_transformation_module = safe_require("specific_transformation")
local viral_transformation_module = safe_require("viral_transformation") 
local necromancer_transformation_module = safe_require("necromancer_transformation")
local universal_item_and_reaction_generators_module = safe_require("universal_item_and_reaction_generators")
local domestic_rules = safe_require("domestic_rules")
local domestic_creature_engine = safe_require("domestic_creature_engine")

-- =====================================================================================
-- LOAD WEAPON SYSTEM
-- =====================================================================================
_G.log("INIT_LOG: Loading weapon system configs (Transmutation Module)...")
local weapon_configs = safe_require("transmutation.config_weapons_master")
local weapon_generator_module = safe_require("transmutation.generator_weapon")

-- =====================================================================================
-- LOAD STAT SYSTEM
-- =====================================================================================
_G.log("INIT_LOG: Loading stat system configs (Attribute Module)...")
-- MODIFIED: Pointing to single master config instead of multiple files
local buff_configs = safe_require("transmutation.config_attributes_master")
local buff_generator_module = safe_require("transmutation.generator_attribute")

-- =====================================================================================
-- LOAD HACKING SYSTEM
-- =====================================================================================
_G.log("INIT_LOG: Loading Digital Warfare system (Transmutation Module)...")
local digi_warfare_config = safe_require("transmutation.config_digital_warfare")
local digi_warfare_generator = safe_require("transmutation.generator_digital_warfare")


_G.log("INIT_LOG: All modules loaded.")

-- =====================================================================================
-- GLOBAL DATA STORAGE
-- =====================================================================================
local registered_interactions_temp_store = {}
local combined_generated_creature_data = {}

-- =====================================================================================
-- UTILITY FUNCTION FOR GENERATION
-- =====================================================================================
local function generate_and_register_creatures(config, target_data_cache)
    if config.data and creature_generator_engine then
        _G.log("INIT_LOG: Generating data for [" .. config.name .. "]")
        local generated_data = creature_generator_engine.generate_data_only(config.data)

        if generated_data and #generated_data > 0 then
            local all_lines_for_this_config = {}
            for _, creature_obj in ipairs(generated_data) do
                if creature_obj.creature then
                    
                    if weaponizer_engine and config_weapons then
                        local weaponized = weaponizer_engine.apply_weapons(creature_obj.creature, config_weapons)
                        creature_obj.creature = weaponized
                    end

                    for _, line in ipairs(creature_obj.creature) do
                        table.insert(all_lines_for_this_config, line)
                    end
                end
            end
            
            if raws and raws.register_creatures and #all_lines_for_this_config > 0 then
                raws.register_creatures(all_lines_for_this_config)
                _G.log("INIT_LOG: Registered " .. #all_lines_for_this_config .. " creature raw lines for [" .. config.name .. "].")
            end

            for _, creature_obj in ipairs(generated_data) do
                table.insert(target_data_cache, creature_obj)
            end
        end
    end
end

-- =====================================================================================
-- PREPROCESS PHASE INTERACTION HOOKING AND CLEANUP
-- =====================================================================================
table.insert(preprocess, function()
    if random_object_parameters.pre_gen_randoms then
        _G.log("INIT_LOG: [CLEANUP] Clearing global creature fingerprints and local caches for new world generation.")
        
        _G.global_creature_fingerprints = {}
        
        for k in pairs(combined_generated_creature_data) do
            combined_generated_creature_data[k] = nil
        end
        
        if _G.generated_civilization_data then
            _G.generated_civilization_data = {}
        end
        
        _G.log("INIT_LOG: [CLEANUP] State reset complete.")
    end

    if not (random_object_parameters.pre_gen_randoms or random_object_parameters.main_world_randoms) then return end
    
    _G.log("INIT_LOG: Activating interaction interception hook.")
    if not _G.raws then _G.raws = {} end
    if not _G.raws.register_interactions_original then
        _G.raws.register_interactions_original = _G.raws.register_interactions or function() end
    end

    _G.raws.register_interactions = function(lines_table)
        if type(lines_table) == "table" then
            local current_block = {}
            for _, line in ipairs(lines_table) do
                if line:match("^%[INTERACTION:") and #current_block > 0 then
                    table.insert(registered_interactions_temp_store, table.concat(current_block, "\n"))
                    current_block = { line }
                else
                    table.insert(current_block, line)
                end
            end
            if #current_block > 0 then
                table.insert(registered_interactions_temp_store, table.concat(current_block, "\n"))
            end
        end
        _G.raws.register_interactions_original(lines_table)
    end

    _G.raws.get_interactions = function()
        return registered_interactions_temp_store
    end
end)

-- =====================================================================================
-- DO_ONCE_EARLY PHASE
-- =====================================================================================

local function generate_early_languages_hook()
    _G.log("INIT_LOG: Running early language generation for Post-Human languages...")
    
    local keys_to_generate = {
        "GEN_POSTCANT_1",
        "GEN_POSTCANT_2",
        "GEN_POSTCANT_3"
    }
    
    local raw_lines = {}
    local count = 0
    
    for _, key in ipairs(keys_to_generate) do
        if languages[key] then
            local dict = languages[key]()
            if dict then
                table.insert(raw_lines, "[LANGUAGE:" .. key .. "]")
                table.insert(raw_lines, "[TRANSLATION]")
                for k, v in pairs(dict) do
                    table.insert(raw_lines, "[T_WORD:" .. k .. ":" .. v .. "]")
                end
                count = count + 1
            end
        else
            _G.log("INIT_LOG: WARNING - Early language key not found: " .. key)
        end
    end
    
    if #raw_lines > 0 then
        raws.register_languages(raw_lines)
        _G.log("INIT_LOG: Registered " .. count .. " early languages successfully.")
    end
end

table.insert(do_once_early, function()
    if not random_object_parameters.pre_gen_randoms then return end
    _G.log("INIT_LOG: Executing DO_ONCE_EARLY hook for pre-map data generation.")

    _G.log("INIT_LOG: Executing megastructure generation (EARLY)...")
    if do_once_early and do_once_early.megastructure_gen then
        pcall(do_once_early.megastructure_gen)
        _G.log("INIT_LOG: Finished running megastructure_generator.")
    else
        _G.log("INIT_LOG: WARNING - megastructure_gen function not found in do_once_early table.")
    end

    _G.log("INIT_LOG: Executing transmutation weapon system generation (EARLY)...")
    if weapon_generator_module then
        local status, err = pcall(weapon_generator_module.generate_all_custom_weapon_systems, weapon_configs)
        if not status then
            _G.log("INIT_LOG: ERROR in weapon_generator_module: " .. tostring(err))
        end
        _G.log("INIT_LOG: Finished running weapon_generator_module.")
    end

    _G.log("INIT_LOG: Executing attribute buff system generation (EARLY)...")
    if buff_generator_module then
        pcall(buff_generator_module.generate_all_custom_buff_systems, buff_configs)
        _G.log("INIT_LOG: Finished running buff_generator_module.")
    end

    _G.log("INIT_LOG: Executing digital warfare system generation (EARLY)...")
    if digi_warfare_generator and digi_warfare_config then
        pcall(digi_warfare_generator.generate, digi_warfare_config)
        _G.log("INIT_LOG: Finished running digi_warfare_generator.")
    end

    generate_early_languages_hook()

    for _, config in ipairs(config_files) do
        if config.generate_early then
            generate_and_register_creatures(config, combined_generated_creature_data)
        end
    end

    _G.log("INIT_LOG: Early-phase creature generation complete.")
    _G.log("INIT_LOG: DO_ONCE_EARLY hook finished.")
end)


-- =====================================================================================
-- DO_ONCE PHASE
-- =====================================================================================
table.insert(do_once, function()
    if not random_object_parameters.main_world_randoms then return end
    _G.log("INIT_LOG: Executing primary DO_ONCE hook for main data generation.")
    
    if language_manager then
        pcall(language_manager.register_all_languages)
    end

    for _, config in ipairs(config_files) do
        if not config.generate_early then
            generate_and_register_creatures(config, combined_generated_creature_data)
        end
    end
    
    _G.log("INIT_LOG: Main-phase creature data generation and registration complete.")
    _G.log("INIT_LOG: Total creature objects cached: " .. #combined_generated_creature_data)

    _G.log("INIT_LOG: Executing dependent module hooks...")
    
    _G.log("INIT_LOG: == STARTING PHASE 2: CIV/DOMESTIC GENERATION ==")

    if dynamic_civilization_generator_module and dynamic_civilization_generator_module.generate_civilizations_hook then
        pcall(dynamic_civilization_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
        pcall(dynamic_civilization_generator_module.generate_civilizations_hook)
        _G.log("INIT_LOG: Finished main civilization generation.")
    else
        _G.log("INIT_LOG: dynamic_civilization_generator_module not found. Skipping main civ generation.")
    end
    
    if dynamic_invasion_generator_module and dynamic_invasion_generator_module.generate_civilizations_hook then
        _G.log("INIT_LOG: Running invasion civilization generator...")
        pcall(dynamic_invasion_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
        pcall(dynamic_invasion_generator_module.generate_civilizations_hook)
        _G.log("INIT_LOG: Finished invasion civilization generation.")
    end

    _G.log("INIT_LOG: Executing dependent domestic creature generation...")
    if domestic_creature_engine and _G.generated_civilization_data and domestic_rules then
        pcall(domestic_creature_engine.generate_domestic_creatures_for_civs, _G.generated_civilization_data, domestic_rules)
        _G.log("INIT_LOG: Finished running domestic_creature_engine.")
    else
        _G.log("INIT_LOG: Could not run domestic creature engine. Missing engine, civ data, or rules.")
    end

    if dynamic_tribe_generator_module and dynamic_tribe_generator_module.generate_civilizations_hook then
        _G.log("INIT_LOG: Running tribe civilization generator...")
        pcall(dynamic_tribe_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
        pcall(dynamic_tribe_generator_module.generate_civilizations_hook)
        _G.log("INIT_LOG: Finished tribe civilization generation.")
    end

    _G.log("INIT_LOG: Executing civilization registration...")
    if dynamic_civilization_generator_module and dynamic_civilization_generator_module.register_all_generated_civilizations then
        pcall(dynamic_civilization_generator_module.register_all_generated_civilizations)
    end
    
    if dynamic_invasion_generator_module and dynamic_invasion_generator_module.register_all_generated_civilizations then
        pcall(dynamic_invasion_generator_module.register_all_generated_civilizations)
    end

    if dynamic_tribe_generator_module and dynamic_tribe_generator_module.register_all_generated_civilizations then
        pcall(dynamic_tribe_generator_module.register_all_generated_civilizations)
    end

    _G.log("INIT_LOG: Finished registering all civilizations.")
    
    _G.log("INIT_LOG: == FINISHED PHASE 2: CIV/DOMESTIC GENERATION ==")

    _G.log("INIT_LOG: Hooking Experiment System...")
    if experiment_generator_engine then
        pcall(experiment_generator_engine.register_experiments)
        _G.log("INIT_LOG: Experiment System hooks registered successfully.")
    else
        _G.log("INIT_LOG: Experiment engine was not loaded, skipping hooks.")
    end

    _G.log("INIT_LOG: Executing transformation interaction generation hooks...")
    
    if specific_transformation_module and specific_transformation_module.preprocess and specific_transformation_module.preprocess.transformation_init then
        pcall(specific_transformation_module.preprocess.transformation_init, combined_generated_creature_data)
        _G.log("INIT_LOG: Specific transformation hook finished.")
    else
        _G.log("INIT_LOG: WARNING - specific_transformation_module or its preprocess hook is missing.")
    end

    if viral_transformation_module and viral_transformation_module.preprocess and viral_transformation_module.preprocess.viral_init then
        pcall(viral_transformation_module.preprocess.viral_init, combined_generated_creature_data)
        _G.log("INIT_LOG: Viral transformation hook finished.")
    else
        _G.log("INIT_LOG: WARNING - viral_transformation_module or its preprocess hook is missing.")
    end

    if necromancer_transformation_module and necromancer_transformation_module.preprocess and necromancer_transformation_module.preprocess.experiment_init then
        pcall(necromancer_transformation_module.preprocess.experiment_init, combined_generated_creature_data)
        _G.log("INIT_LOG: Experiment transformation hook finished.")
    else
        _G.log("INIT_LOG: WARNING - necromancer_transformation_module or its preprocess hook is missing.")
    end

    _G.log("INIT_LOG: Primary DO_ONCE hook finished.")
end)


-- =====================================================================================
-- POSTPROCESS PHASE
-- =====================================================================================
table.insert(postprocess, function()
    if not random_object_parameters.main_world_randoms then return end
    _G.log("INIT_LOG: Starting POSTPROCESS phase for final item/reaction generation.")

    _G.log("INIT_LOG: Executing item and reaction generator hook...")
    if universal_item_and_reaction_generators_module and universal_item_and_reaction_generators_module.postprocess then
        pcall(universal_item_and_reaction_generators_module.postprocess.generate_all_transformation_items)
    end
    _G.log("INIT_LOG: Item/reaction hook finished.")
    _G.log("INIT_LOG: POSTPROCESS phase complete.")
end)

_G.log("INIT_LOG: Master init.lua script fully loaded and all hooks registered.")