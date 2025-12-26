-- ====================================================================
-- MODULE REQUIREMENTS
-- ====================================================================
local data_manager = require("civ_data.data_manager")
local flowchart_data = data_manager.flowchart_data
local common_data = data_manager.common_data

-- ====================================================================
-- UTILITY FUNCTIONS
-- ====================================================================

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
    local index_to_remove = -1
    for i, item in ipairs(t) do
        current_weight = current_weight + (item.weight or 1)
        if random_value <= current_weight then
            index_to_remove = i
            break
        end
    end
    if index_to_remove == -1 and #t > 0 then index_to_remove = #t end
    if index_to_remove > 0 then return table.remove(t, index_to_remove) end
    return nil
end

local function split_to_lines(tbl, str)
    if not str or type(str) ~= 'string' then return tbl end
    for line in str:gmatch("[^\r\n]+") do
        table.insert(tbl, line)
    end
    return tbl
end

-- ====================================================================
-- CONFIGURATION STRUCTURE
-- ====================================================================
local civ_configuration = {
    
    LOCASTE = {
        fallback_sub = "STANDARD",
        subs = {
            STANDARD = {
                weight = 20,
                allowed_ratings = { "SPNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_human", 
					"bandits_medium", 
					"law_serious_order",
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves", 
					"citysites", 
					"higher_positions_human",
					"shield_low", 
					"allguns" }
                }
            }
        }
    },
    HICASTE = {
        fallback_sub = "STANDARD",
        subs = {
            CIVCLADE = {
                weight = 3,
                allowed_ratings = { "SPNT" },
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_imperial", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"arcologysites", 
					"higher_positions_elite", 
					"shield_high", 
					"techguns" 
					}
                }
            },
            WARCLADE = {
                weight = 3,
                allowed_ratings = { "SPNT" },
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_imperial", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"arcologysites", 
					"higher_positions_elite", 
					"shield_high", 
					"techguns" 
					},
                    LRG = { 
					"armor_all",
					"arrivaltypes", 
					"languages_imperial", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"arcologysites", 
					"higher_positions_elite", 
					"shield_high", 
					"techguns" 
					}
                }
            },
            JOYCLADE = {
                weight = 2,
                allowed_ratings = { "SPNT" },
                sizes = {
                    MDM = {
					"armor_all",
					"arrivaltypes", 
					"languages_imperial", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"arcologysites", 
					"higher_positions_elite", 
					"shield_high", 
					"techguns" 
					}
                }
            },
            SCICLADE= {
                weight = 2,
                allowed_ratings = { "SPNT" },
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_imperial", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"arcologysites", 
					"higher_positions_elite", 
					"shield_high", 
					"techguns" 
					}
                }
            }
        }
    },
	
	
    NUCASTE = {
        fallback_sub = "STANDARD",
        subs = {
            STANDARD = {
                weight = 10,
                allowed_ratings = { "SPNT" },
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_transitional",
					"bandits_medium",
					"law_serious_order", 
					"law_petty_order", 
					"trophys",
					"torture_law",
					"slaves",
					"allsites",
					"higher_positions_human",
					"shield_low", 
					"allguns" 
					},
                    LRG = { 
					"armor_all",
					"arrivaltypes",
					"languages_transitional",
					"bandits_medium", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys",
					"torture_law", 
					"slaves", 
					"allsites", 
					"higher_positions_human",
					"shield_low", 
					"allguns" 
					}
                }
            }
        }
    },
	
	
    EXCASTE = {
        subs = {
            APE = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_tribal", 
					"bandits_high",
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys",
					"torture_chaos", 
					"slaves", 
					"tribesites", 
					"higher_positions_tribal", 
					"allguns" 
					}
                }
            },
            CLONE = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_tribal",
					"bandits_high", 
					"law_serious_chaos",
					"law_petty_chaos",
					"trophys",
					"torture_chaos",
					"slaves", 
					"tribesites",
					"higher_positions_tribal",
					"allguns" 
					}
                }
            },
            CANCER = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_tribal",
					"bandits_high",
					"law_serious_chaos",
					"law_petty_chaos",
					"trophys",
					"torture_chaos", 
					"slaves",
					"tribesites", 
					"higher_positions_tribal",
					"allguns" }
                }
            },
            BLINDSIGHT = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = {
					"armor_all",
					"arrivaltypes",
					"languages_tribal",
					"bandits_high",
					"law_serious_chaos", 
					"law_petty_chaos",
					"trophys", 
					"torture_chaos",
					"slaves",
					"outersites", 
					"higher_positions_tribal", 
					"allguns" 
					}
                }
            }
        }
    },
	
    NANOMACHINE = { 
        subs = {
            CORRUPT = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_posthuman", 
					"bandits_high", 
					"law_serious_chaos",
					"law_petty_chaos",
					"trophys", 
					"torture_chaos", 
					"slaves", 
					"outersites",
					"higher_positions_nanoroid",
					"allguns" 
					},
                    LRG = {
					"armor_all",
					"arrivaltypes",
					"languages_posthuman",
					"bandits_high", 
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys", 
					"torture_chaos", 
					"slaves", 
					"cavesites",
					"higher_positions_nanoroid",
					"allguns" 
					}
                }
            },
            PRISTINE = {
                weight = 5,
                allowed_ratings = { "SPNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_transitional", 
					"bandits_low",
					"law_serious_order", 
					"law_petty_order",
					"trophys", 
					"torture_law", 
					"slaves", 
					"monosites",
					"higher_positions_human",
					"allguns" 
					},
                    LRG = { 
					"armor_all",
					"arrivaltypes", 
					"languages_transitional", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys",
					"torture_law", 
					"slaves", 
					"monosites", 
					"higher_positions_human",
					"allguns"
					}
                }
            },
            WET = {
                weight = 5,
                allowed_ratings = { "SPNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_tribal", 
					"bandits_high",
					"law_serious_chaos", 
					"law_petty_chaos",
					"trophys", 
					"torture_chaos",
					"slaves",
					"outersites", 
					"higher_positions_tribal",
					"allguns" 
					},
                    LRG = { 
					"armor_all",
					"arrivaltypes", 
					"languages_tribal", 
					"bandits_high",
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys", 
					"torture_chaos",
					"slaves", 
					"cavesites", 
					"higher_positions_tribal",
					"allguns" 
					}
                }
            }
        }
    },
	
    BIOMACHINE = { 
        subs = {
            DEVIL = {
                weight = 5,
                allowed_ratings = { "DVNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_posthuman", 
					"bandits_high",
					"law_serious_chaos", 
					"law_petty_chaos", 
					"trophys",
					"torture_chaos",
					"slaves",
					"outersites", 
					"higher_positions_bioroid",
					"allguns" },
                    LRG = { 
					"armor_all",
					"arrivaltypes",
					"languages_posthuman", 
					"bandits_high", 
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys",
					"torture_chaos",
					"slaves", 
					"cavesites",
					"higher_positions_bioroid", 
					"allguns" 
					}
                }
            },
            HUMAN = {
                weight = 5,
                allowed_ratings = { "SPNT" }, 
                sizes = {
                    MDM = {
					"armor_all",
					"arrivaltypes", 
					"languages_transitional", 
					"bandits_low", 
					"law_serious_order", 
					"law_petty_order", 
					"trophys", 
					"torture_law", 
					"slaves",
					"monosites", 
					"higher_positions_human",
					"allguns" 
					}
                }
            },
            OGRE = {
                weight = 5,
                allowed_ratings = { "DVNT", "SPNT" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes",
					"languages_tribal", 
					"bandits_high",
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys", 
					"torture_chaos",
					"slaves", 
					"outersites",
					"higher_positions_tribal",
					"allguns"
					},
                    LRG = { 
					"armor_all",
					"arrivaltypes", 
					"languages_tribal", 
					"bandits_high", 
					"law_serious_chaos",
					"law_petty_chaos", 
					"trophys", 
					"torture_chaos", 
					"slaves", 
					"cavesites", 
					"higher_positions_tribal", 
					"allguns" 
					}
                }
            }
        }
    }
}

-- ====================================================================
-- LOGIC
-- ====================================================================

local eligible_civ_creatures = {}
_G.generated_civilization_data = _G.generated_civilization_data or {}
local all_generated_civ_raws = {}

local function apply_flowchart_data(civ_tbl, tables_to_process)
    if not tables_to_process or #tables_to_process == 0 then return civ_tbl end
    for _, table_name in ipairs(tables_to_process) do
        local current_data_table = flowchart_data[table_name]
        if current_data_table then
            local selected_entry = weighted_pick_random(current_data_table)
            if selected_entry then
                civ_tbl = split_to_lines(civ_tbl, selected_entry.value)
                if selected_entry.next_level_tables then
                    civ_tbl = apply_flowchart_data(civ_tbl, selected_entry.next_level_tables)
                end
            end
        end
    end
    return civ_tbl
end

local function parse_creature_token(token)
    local parts = {}
    for part in token:gmatch("[^_]+") do
        table.insert(parts, part)
    end
    if #parts < 5 then return nil end
    local archetype = parts[1]
    local size = nil
    local rating = nil
    local sub_archetype = nil
    local rating_index = -1
    for i, part in ipairs(parts) do
        if part == "SPNT" or part == "DVNT" or part == "HSTL" or part == "VSSL" or part == "AVTR" or part == "NCUR" then
            rating_index = i
            rating = part
            break
        end
    end
    if rating_index > 2 then
        size = parts[rating_index - 1] 
        if parts[rating_index + 2] then
            sub_archetype = parts[rating_index + 2]
        end
    end
    return {
        archetype = archetype,
        size = size,
        rating = rating,
        sub_archetype = sub_archetype
    }
end

local function prepare_civilization_data_hook(all_creature_data)
    log("CIV_GEN_LOG: [PREPROCESS] Starting Per-Creature Analysis.")
    eligible_civ_creatures = {}
    if not all_creature_data then return end
    for _, creature_info in ipairs(all_creature_data) do
        if creature_info.creature and #creature_info.creature > 0 then
            local token_line = creature_info.creature[1]
            local token = token_line:match("%[CREATURE:(.-)%]")
            if token then
                local parsed = parse_creature_token(token)
                if parsed and parsed.archetype and civ_configuration[parsed.archetype] then
                    local config = civ_configuration[parsed.archetype]
                    local effective_sub = parsed.sub_archetype
                    if (not effective_sub or not config.subs[effective_sub]) and config.fallback_sub then
                        effective_sub = config.fallback_sub
                    end
                    if effective_sub and config.subs[effective_sub] then
                        local sub_config = config.subs[effective_sub]
                        local rating_ok = false
                        if sub_config.allowed_ratings then
                            for _, r in ipairs(sub_config.allowed_ratings) do
                                if r == parsed.rating then rating_ok = true break end
                            end
                        end
                        local size_ok = false
                        if rating_ok and sub_config.sizes and sub_config.sizes[parsed.size] then
                            size_ok = true
                        end
                        if size_ok then
                            table.insert(eligible_civ_creatures, {
                                token = token,
                                archetype = parsed.archetype,
                                sub_archetype = effective_sub,
                                size = parsed.size,
                                rating = parsed.rating,
                                entity_tables = sub_config.sizes[parsed.size],
                                weight = sub_config.weight or 10
                            })
                            log("CIV_GEN_LOG: Added Candidate: " .. token .. " ["..parsed.archetype.."/"..effective_sub.."/"..parsed.rating.."/"..parsed.size.."] Weight: " .. tostring(sub_config.weight or 10))
                        end
                    end
                end
            end
        end
    end
    log("CIV_GEN_LOG: Found " .. #eligible_civ_creatures .. " eligible civilization founders.")
end

-- [[ NEW HELPER: Scans entity lines for ANIMAL_CLASS tags to determine weapon theme ]]
local function detect_weapon_theme_from_lines(lines)
    for _, line in ipairs(lines) do
        -- Look for [ANIMAL_CLASS:X]
        local tag = line:match("%[ANIMAL_CLASS:([^%]]+)%]")
        if tag then
            -- We assume known themes are uppercase. 
            -- We ignore the specific entity ID tag (e.g. BIOMACHINE_1) because that is handled elsewhere.
            -- Known weapon themes: CHEMGUN, RAILGUN, RAMJET, COIL
            if tag == "CHEMGUN" or tag == "RAILGUN" or tag == "RAMJET" or tag == "COIL" then
                return tag
            end
        end
    end
    return nil
end

local function generate_civilizations_hook()
    log("CIV_GEN_LOG: Generating Civilizations...")
    
    if not (random_object_parameters and random_object_parameters.main_world_randoms) then return end
    if #eligible_civ_creatures == 0 then return end

    local expected_civ_amt = math.ceil((world.param.total_civ_number or 1) / 1)

    for i = 1, expected_civ_amt do
        local candidate = weighted_pick_random_no_replace(eligible_civ_creatures)
        if not candidate then break end

        local civ_tbl = {"[ENTITY:CIVILIZED_" .. tostring(i) .. "]"}
        table.insert(civ_tbl, "[CREATURE:" .. candidate.token .. "]")
        
        local animal_class_tag = candidate.archetype .. "_" .. tostring(i)
        table.insert(civ_tbl, "[ANIMAL][ANIMAL_CLASS:" .. animal_class_tag .. "][ANIMAL_ALWAYS_PRESENT]")

        -- Create the data entry, we will update it later with the theme
        local data_entry = {
            creature_token = candidate.token,
            archetype = candidate.archetype,
            sub_archetype = candidate.sub_archetype,
            size_class = candidate.size,
            animal_class_tag = animal_class_tag
        }
        table.insert(_G.generated_civilization_data, data_entry)

        _G.add_generated_info(civ_tbl)
        split_to_lines(civ_tbl, [[
    [ALL_MAIN_POPS_CONTROLLABLE]
    [DIGGER:ITEM_WEAPON_PICK]

	[WEAPON:ITEM_WEAPON_ROCKETSWORD]
	[WEAPON:ITEM_WEAPON_SAWSWORD]
	[WEAPON:ITEM_WEAPON_FREQUENCYSWORD]
	[WEAPON:ITEM_WEAPON_ENERGYSWORD]
	[WEAPON:ITEM_WEAPON_FLAMESWORD]
	[WEAPON:ITEM_WEAPON_ROCKETGREATSWORD]
	[WEAPON:ITEM_WEAPON_SAWGREATSWORD]
	[WEAPON:ITEM_WEAPON_FREQUENCYGREATSWORD]
	[WEAPON:ITEM_WEAPON_ENERGYGREATSWORD]
	[WEAPON:ITEM_WEAPON_FLAMEGREATSWORD]

	[WEAPON:ITEM_WEAPON_ROCKETAXE]
	[WEAPON:ITEM_WEAPON_SAWAXE]
	[WEAPON:ITEM_WEAPON_FLAMEAXE]
	[WEAPON:ITEM_WEAPON_ROCKETGREATAXE]
	[WEAPON:ITEM_WEAPON_SAWGREATAXE]
	[WEAPON:ITEM_WEAPON_FLAMEGREATAXE]

	[WEAPON:ITEM_WEAPON_ROCKETHAMMER] 
	[WEAPON:ITEM_WEAPON_PNEUMATICHAMMER]
	[WEAPON:ITEM_WEAPON_GRINDERHAMMER]
	[WEAPON:ITEM_WEAPON_ROCKETGREATHAMMER]
	[WEAPON:ITEM_WEAPON_PNEUMATICGREATHAMMER]
	[WEAPON:ITEM_WEAPON_GRINDERGREATHAMMER]

	[WEAPON:ITEM_WEAPON_SHOCKMACE]
	[WEAPON:ITEM_WEAPON_GRINDERMACE]
	[WEAPON:ITEM_WEAPON_SHOCKGREATMACE]
	[WEAPON:ITEM_WEAPON_GRINDERGREATMACE]

	[WEAPON:ITEM_WEAPON_SHOCKLANCE]
	[WEAPON:ITEM_WEAPON_PNEUMATICLANCE]
	[WEAPON:ITEM_WEAPON_DRILLLANCE]
	[WEAPON:ITEM_WEAPON_FLAMELANCE]
	[WEAPON:ITEM_WEAPON_SHOCKGREATLANCE]
	[WEAPON:ITEM_WEAPON_PNEUMATICGREATLANCE]
	[WEAPON:ITEM_WEAPON_DRILLGREATLANCE]
	[WEAPON:ITEM_WEAPON_FLAMEGREATLANCE]

	[WEAPON:ITEM_WEAPON_FREQUENCYWHIP]
	[WEAPON:ITEM_WEAPON_FLAMEWHIP]
	[WEAPON:ITEM_WEAPON_FREQUENCYGREATWHIP]
	[WEAPON:ITEM_WEAPON_FLAMEGREATWHIP]

	[WEAPON:ITEM_WEAPON_ROCKETSCYTHE]
	[WEAPON:ITEM_WEAPON_SAWSCYTHE]
	[WEAPON:ITEM_WEAPON_FREQUENCYSCYTHE]
	[WEAPON:ITEM_WEAPON_FLAMESCYTHE]
	[WEAPON:ITEM_WEAPON_ROCKETGREATSCYTHE]
	[WEAPON:ITEM_WEAPON_SAWGREATSCYTHE]
	[WEAPON:ITEM_WEAPON_FREQUENCYGREATSCYTHE]
	[WEAPON:ITEM_WEAPON_FLAMEGREATSCYTHE]

	[WEAPON:ITEM_WEAPON_FREQUENCYSTAVE]
	[WEAPON:ITEM_WEAPON_SHOCKSTAVE]
	[WEAPON:ITEM_WEAPON_FREQUENCYGREATSTAVE]
	[WEAPON:ITEM_WEAPON_SHOCKGREATSTAVE]
	  
	[WEAPON:ITEM_WEAPON_ROCKETDAGGER]
	[WEAPON:ITEM_WEAPON_SAWDAGGER]
	[WEAPON:ITEM_WEAPON_PNEUMATICDAGGER]
	[WEAPON:ITEM_WEAPON_FREQUENCYDAGGER]
	[WEAPON:ITEM_WEAPON_FLAMEDAGGER]


	[WEAPON:ITEM_WEAPON_ROCKETSWORD]
	[WEAPON:ITEM_WEAPON_SAWSWORD]
	[WEAPON:ITEM_WEAPON_FREQUENCYSWORD]
	[WEAPON:ITEM_WEAPON_ENERGYSWORD]
	[WEAPON:ITEM_WEAPON_FLAMESWORD]
	[WEAPON:ITEM_WEAPON_ROCKETGREATSWORD]
	[WEAPON:ITEM_WEAPON_SAWGREATSWORD]
	[WEAPON:ITEM_WEAPON_FREQUENCYGREATSWORD]
	[WEAPON:ITEM_WEAPON_ENERGYGREATSWORD]
	[WEAPON:ITEM_WEAPON_FLAMEGREATSWORD]

	[WEAPON:ITEM_WEAPON_ROCKETAXE]
	[WEAPON:ITEM_WEAPON_SAWAXE]
	[WEAPON:ITEM_WEAPON_FLAMEAXE]
	[WEAPON:ITEM_WEAPON_ROCKETGREATAXE]
	[WEAPON:ITEM_WEAPON_SAWGREATAXE]
	[WEAPON:ITEM_WEAPON_FLAMEGREATAXE]

	[WEAPON:ITEM_WEAPON_ROCKETHAMMER] 
	[WEAPON:ITEM_WEAPON_PNEUMATICHAMMER]
	[WEAPON:ITEM_WEAPON_GRINDERHAMMER]
	[WEAPON:ITEM_WEAPON_ROCKETGREATHAMMER]
	[WEAPON:ITEM_WEAPON_PNEUMATICGREATHAMMER]
	[WEAPON:ITEM_WEAPON_GRINDERGREATHAMMER]


	[HELM:ITEM_HELM_EXOMASK_VISOR_FULL:FORCED]
	[HELM:ITEM_HELM_EXOMASK_VISOR_HALF:FORCED]
	[HELM:ITEM_HELM_EXOMASK_VISOR_SLIT:FORCED]
	[HELM:ITEM_HELM_EXOMASK_BLANK_SENSORSYS:FORCED]
	[HELM:ITEM_HELM_EXOMASK_BLANK_PERFORATED:FORCED]
	[HELM:ITEM_HELM_EXOMASK_BLANK_SOLID:FORCED]
	[HELM:ITEM_HELM_EXOMASK_EYES_SMALL:FORCED]
	[HELM:ITEM_HELM_EXOMASK_EYES_LARGE:FORCED]
	[HELM:ITEM_HELM_EXOMASK_EYES_SLIT:FORCED]
	[HELM:ITEM_HELM_EXOMASK_BLANK_SOLID:FORCED]

	[ARMOR:ITEM_ARMOR_UNDERGUARD:FORCED]
    [GLOVES:ITEM_GLOVES_ARMGUARD:FORCED]
    [SHOES:ITEM_SHOES_LEGGUARD:FORCED]

    [ARMOR:ITEM_ARMOR_JUMPSUIT1:FORCED]
    [ARMOR:ITEM_ARMOR_JUMPSUIT2:FORCED]
    [ARMOR:ITEM_ARMOR_JUMPSUIT3:FORCED]
    [ARMOR:ITEM_ARMOR_JUMPSUIT4:FORCED]
    [ARMOR:ITEM_ARMOR_JUMPSUIT5:FORCED]
    [GLOVES:ITEM_GLOVES_SHEATHE:FORCED]
    [SHOES:ITEM_SHOES_SHEATHE:FORCED]
    [ARMOR:ITEM_ARMOR_TARP1:FORCED]
    [ARMOR:ITEM_ARMOR_TARP2:FORCED]
    [ARMOR:ITEM_ARMOR_TARP3:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH1:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH2:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH3:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH4:FORCED]
    [HELM:ITEM_HELM_SHEATHE1:FORCED]
    [HELM:ITEM_HELM_SHEATHE2:FORCED]
    [HELM:ITEM_HELM_SHEATHE3:FORCED]
    [HELM:ITEM_HELM_SHEATHE4:FORCED]
    [HELM:ITEM_HELM_SHEATHE5:FORCED]


    [SIEGEAMMO:ITEM_SIEGEAMMO_BALLISTA]
    [TRAPCOMP:ITEM_TRAPCOMP_GIANTAXEBLADE]
    [TRAPCOMP:ITEM_TRAPCOMP_ENORMOUSCORKSCREW]
    [TRAPCOMP:ITEM_TRAPCOMP_SPIKEDBALL]
    [TRAPCOMP:ITEM_TRAPCOMP_LARGESERRATEDDISC]
    [TRAPCOMP:ITEM_TRAPCOMP_MENACINGSPIKE]
    [TOY:ITEM_TOY_PUZZLEBOX]
    [TOY:ITEM_TOY_BOAT]
    [TOY:ITEM_TOY_HAMMER]
    [TOY:ITEM_TOY_AXE]
    [TOY:ITEM_TOY_MINIFORGE]
    [TOY:ITEM_TOY_GAME]
    [TOY:ITEM_TOY_LAPTOP]
    [TOY:ITEM_TOY_SOLDIER]
    [TOY:ITEM_TOY_GUN]
    [TOY:ITEM_TOY_SWORD]
    [TOY:ITEM_TOY_HOLOSCREEN]
    [TOY:ITEM_TOY_VR]
    [TOOL:ITEM_TOOL_NEST_BOX]
    [TOOL:ITEM_TOOL_JUG]
    [TOOL:ITEM_TOOL_LARGE_POT]
    [TOOL:ITEM_TOOL_HIVE]
    [TOOL:ITEM_TOOL_MINECART]

    [TOOL:ITEM_TOOL_LOADER_L]
    [TOOL:ITEM_TOOL_LOADER_M]
    [TOOL:ITEM_TOOL_LOADER_H]
    [TOOL:ITEM_TOOL_STAVE1]
    [TOOL:ITEM_TOOL_STAVE2]
    [TOOL:ITEM_TOOL_BLADE1]
    [TOOL:ITEM_TOOL_BLADE2]
    [TOOL:ITEM_TOOL_BLADE3]
    [TOOL:ITEM_TOOL_LANCE1]
    [TOOL:ITEM_TOOL_STEPLADDER]
    [TOOL:ITEM_TOOL_BOOK_BINDING]
    [TOOL:ITEM_TOOL_SCROLL]
    [TOOL:ITEM_TOOL_DATABANK]
    [TOOL:ITEM_TOOL_PEDESTAL]
    [TOOL:ITEM_TOOL_DISPLAY_CASE]
    [TOOL:ITEM_TOOL_PORTABLE_REFINERY]
    [TOOL:ITEM_TOOL_PORTABLE_SYNTH]
    [TOOL:ITEM_TOOL_PORTABLE_3D]
    [TOOL:ITEM_TOOL_MULTI]
    [TOOL:ITEM_TOOL_MULTIBOX]
    [TOOL:ITEM_TOOL_ALTAR]
    [TOOL:ITEM_TOOL_DIE]
    [CLOTHING]
    [SUBTERRANEAN_CLOTHING]
    CURRENCY_BY_YEAR
    [CURRENCY:ENERGETIC_COMPOUND:1]
    [CURRENCY:ALLOY:5]
    [CURRENCY:COMPUTING_SUBSTRATE:10]
    [CURRENCY:HARDLIGHT:20]
    [CURRENCY:N_MATTER:100]
    [SELECT_SYMBOL:WAR:NAME_WAR]
    [SUBSELECT_SYMBOL:WAR:VIOLENT]
    [SELECT_SYMBOL:BATTLE:NAME_BATTLE]
    [SUBSELECT_SYMBOL:BATTLE:VIOLENT]
    [SELECT_SYMBOL:SIEGE:NAME_SIEGE]
    [SUBSELECT_SYMBOL:SIEGE:VIOLENT]
    [SELECT_SYMBOL:MERCHANT_COMPANY:NAME_CORP]
    [SELECT_SYMBOL:CRAFT_GUILD:NAME_CORP]
    [SELECT_SYMBOL:ROAD:NAME_ROAD]
    [SELECT_SYMBOL:TUNNEL:NAME_TUNNEL]
    [SELECT_SYMBOL:BRIDGE:NAME_BRIDGE]
    [SELECT_SYMBOL:WALL:NAME_WALL]
    [SELECT_SYMBOL:TEMPLE:NAME_BUILDING_TEMPLE]
    [SELECT_SYMBOL:LIBRARY:NAME_BUILDING_LIBRARY]
    [SELECT_SYMBOL:HOSPITAL:NAME_BUILDING_HOSPITAL]
    [CULL_SYMBOL:ALL:UGLY]
    [CULL_SYMBOL:ALL:SUBORDINATE]
    [RIVER_PRODUCTS]
    [OCEAN_PRODUCTS]
    [METAL_PREF]
    [GEM_PREF]
    [STONE_PREF]
    [OUTDOOR_WOOD]
    [OUTDOOR_FARMING]
    [OUTDOOR_GARDENS][OUTDOOR_ORCHARDS]
	[USE_GOOD_PLANTS]

    [USE_ANIMAL_PRODUCTS]
   
	[SIEGE_SKILLED_MINERS]
    [USE_MISC_PROCESSED_WOOD_PRODUCTS]
    [EQUIPMENT_IMPROVEMENTS]
	[ART_FACET_MODIFIER:OWN_RACE:512] 
    [ART_IMAGE_ELEMENT_MODIFIER:SHAPE:25000]
    [ITEM_IMPROVEMENT_MODIFIER:ART_IMAGE:25600]
    [FRIENDLY_COLOR:1:0:1]

    [DIPLOMAT_BODYGUARDS]
    [MERCHANT_BODYGUARDS]
	[MERCHANT_NOBILITY]

    [SIEGER][AMBUSHER]
    [RELIGION:PANTHEON]
    [WANDERER]
    [BEAST_HUNTER]
    [SCOUT]
    [MERCENARY]
    [SCHOLAR:PHILOSOPHER]
    [SCHOLAR:MATHEMATICIAN]
    [SCHOLAR:HISTORIAN]
    [SCHOLAR:ASTRONOMER]
    [SCHOLAR:NATURALIST]
    [SCHOLAR:CHEMIST]
    [SCHOLAR:GEOGRAPHER]
    [SCHOLAR:DOCTOR]
    [SCHOLAR:ENGINEER]
    [PERMITTED_JOB:MINER]
    [PERMITTED_JOB:CARPENTER]
    [PERMITTED_JOB:BOWYER]
    [PERMITTED_JOB:WOODCUTTER]
    [PERMITTED_JOB:ENGRAVER]
    [PERMITTED_JOB:MASON]
    [PERMITTED_JOB:ANIMAL_CARETAKER]
    [PERMITTED_JOB:ANIMAL_TRAINER]
    [PERMITTED_JOB:HUNTER]
    [PERMITTED_JOB:TRAPPER]
    [PERMITTED_JOB:ANIMAL_DISSECTOR]
    [PERMITTED_JOB:FURNACE_OPERATOR]
    [PERMITTED_JOB:WEAPONSMITH]
    [PERMITTED_JOB:ARMORER]
    [PERMITTED_JOB:BLACKSMITH]
    [PERMITTED_JOB:METALCRAFTER]
    [PERMITTED_JOB:GEM_CUTTER]
    [PERMITTED_JOB:GEM_SETTER]
    [PERMITTED_JOB:WOODCRAFTER]
    [PERMITTED_JOB:STONECRAFTER]
    [PERMITTED_JOB:LEATHERWORKER]
    [PERMITTED_JOB:BONE_CARVER]
    [PERMITTED_JOB:WEAVER]
    [PERMITTED_JOB:CLOTHIER]
    [PERMITTED_JOB:GLASSMAKER]
    [PERMITTED_JOB:STRAND_EXTRACTOR]
    [PERMITTED_JOB:FISHERMAN]
    [PERMITTED_JOB:FISH_DISSECTOR]
    [PERMITTED_JOB:FISH_CLEANER]
    [PERMITTED_JOB:CHEESE_MAKER]
    [PERMITTED_JOB:MILKER]
    [PERMITTED_JOB:SHEARER]
    [PERMITTED_JOB:SPINNER]
    [PERMITTED_JOB:GELDER]
    [PERMITTED_JOB:COOK]
    [PERMITTED_JOB:THRESHER]
    [PERMITTED_JOB:MILLER]
    [PERMITTED_JOB:BUTCHER]
    [PERMITTED_JOB:TANNER]
    [PERMITTED_JOB:DYER]
    [PERMITTED_JOB:PLANTER]
    [PERMITTED_JOB:HERBALIST]
    [PERMITTED_JOB:BREWER]
    [PERMITTED_JOB:SOAP_MAKER]
    [PERMITTED_BUILDING:SOAP_MAKER]
    [PERMITTED_BUILDING:SCREW_PRESS]
    [PERMITTED_BUILDING:N_MATTER_INCUBATOR]
    [PERMITTED_BUILDING:N_MATTER_REFINERY]
    [PERMITTED_BUILDING:MANUFACTURING_CENTER]
    [PERMITTED_REACTION:TAN_A_HIDE]
    [PERMITTED_REACTION:RENDER_FAT]
    [PERMITTED_REACTION:MAKE_SOAP_FROM_TALLOW]
    [PERMITTED_REACTION:MAKE_SOAP_FROM_OIL]
    [PERMITTED_REACTION:MAKE_PEARLASH]
    [PERMITTED_REACTION:MAKE_SCROLL]
    [PERMITTED_REACTION:MAKE_SHEET_FROM_PLANT]
    [PERMITTED_REACTION:MAKE_SLURRY_FROM_PLANT]
    [PERMITTED_REACTION:PRESS_PLANT_PAPER]
    [PERMITTED_REACTION:BIND_BOOK]
    [PERMITTED_REACTION:MILL_SEEDS_NUTS_TO_PASTE]
    [PERMITTED_REACTION:MAKE_CLAY_JUG]
    [PERMITTED_REACTION:MAKE_CLAY_BRICKS]
    [PERMITTED_REACTION:MAKE_CLAY_STATUE]
    [PERMITTED_REACTION:MAKE_LARGE_CLAY_POT]
    [PERMITTED_REACTION:MAKE_CLAY_CRAFTS]
    [PERMITTED_REACTION:PRESS_OIL]
    [PERMITTED_REACTION:PRESS_OIL_FRUIT]
    [PERMITTED_REACTION:MAKE_CLAY_HIVE]
    [PERMITTED_REACTION:PRESS_HONEYCOMB]
    [PERMITTED_REACTION:MAKE_WAX_CRAFTS]
    [PERMITTED_REACTION:BREW_DRINK_FROM_PLANT]
    [PERMITTED_REACTION:BREW_DRINK_FROM_PLANT_GROWTH]
    [PERMITTED_REACTION:MAKE_MEAD]
    [PERMITTED_REACTION:PROCESS_PLANT_TO_BAG]
    [PERMITTED_BUILDING:SOAP_MAKER]
    [PERMITTED_BUILDING:SCREW_PRESS]
    [PERMITTED_BUILDING:N_MATTER_INCUBATOR]
    [PERMITTED_BUILDING:N_MATTER_REFINERY]
    [PERMITTED_BUILDING:MANUFACTURING_CENTER]
    [PERMITTED_REACTION:MAKE WOODEN DISPLAY CASE][PERMITTED_REACTION:MAKE_CLOTH_BED][PERMITTED_REACTION:GRIND_PLANT]

    [PERMITTED_REACTION:COMPOSITE_SCRAP1]
    [PERMITTED_REACTION:COMPOSITE_SCRAP2]
    [PERMITTED_REACTION:COMPOSITE_SCRAP3]
    [PERMITTED_REACTION:METAL_MESH_MAKING]
    [PERMITTED_REACTION:ENERGY_EXTRACTION]
	[PERMITTED_REACTION:NANOWEAVE_MAKING]
    [PERMITTED_REACTION:MACROCELL_EXTRACTION]
    [PERMITTED_REACTION:BIOMASS_HARVEST_MAKING]
    [PERMITTED_REACTION:HARDLIGHT_HARVEST_MAKING][PERMITTED_REACTION:MAKE_PLASTIC_POWDER]
    [PERMITTED_REACTION:DATACHIP1_MAKING]
    [PERMITTED_REACTION:DATACHIP2_MAKING]
    [PERMITTED_REACTION:DATACHIP3_MAKING]

    [PERMITTED_REACTION:N_MATTER_MAKING][PERMITTED_REACTION:N_MATTER_BUTCHER]

    [PERMITTED_REACTION:TABLET_MAKING_CORE_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_MANIFESTATION_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_COMBAT_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_PRIMARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_SECONDARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_TERTIARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_QUATERNARY_BLANK]


    [WILL_ACCEPT_TRIBUTE]



    [TISSUE_STYLE:HAIR]
        [TS_MAINTAIN_LENGTH:0:200]
        [TS_PREFERRED_SHAPING:STANDARD_HAIR_SHAPINGS]
    [TISSUE_STYLE:SIDEBURNS]
        [TS_MAINTAIN_LENGTH:0:200]
        [TS_PREFERRED_SHAPING:STANDARD_SIDEBURNS_SHAPINGS]
    [TISSUE_STYLE:MOUSTACHE]
        [TS_MAINTAIN_LENGTH:0:200]
        [TS_PREFERRED_SHAPING:STANDARD_MOUSTACHE_SHAPINGS]
    [TISSUE_STYLE:BEARD]
        [TS_MAINTAIN_LENGTH:0:200]
        [TS_PREFERRED_SHAPING:STANDARD_BEARD_SHAPINGS]

    [BUILDS_OUTDOOR_FORTIFICATIONS]

    [BUILDS_OUTDOOR_TOMBS][GEM_SHAPE:TUBE][GEM_SHAPE:CYLINDER][GEM_SHAPE:BULB][GEM_SHAPE:RING][GEM_SHAPE:STRIP]
    [GENERATE_POETIC_FORMS]
    [GENERATE_MUSICAL_FORMS]
    [GENERATE_DANCE_FORMS]


[PERMITTED_REACTION:OUTSIDE_ALGAE_MAKING]
[PERMITTED_REACTION:OUTSIDE_FUNGUS_MAKING]
[PERMITTED_REACTION:OUTSIDE_GRUB_MAKING]
[PERMITTED_REACTION:OUTSIDE_VERMIN_MAKING]
[PERMITTED_REACTION:OUTSIDE_FISH_MAKING]
[PERMITTED_REACTION:OUTSIDE_BREAD_MAKING]
[PERMITTED_REACTION:OUTSIDE_FRUIT_MAKING]
[PERMITTED_REACTION:OUTSIDE_VEGETABLE_MAKING]
[PERMITTED_REACTION:OUTSIDE_CATTLE_MAKING]
[PERMITTED_REACTION:INSIDE_ALGAE_MAKING]
[PERMITTED_REACTION:INSIDE_FUNGUS_MAKING]
[PERMITTED_REACTION:INSIDE_GRUB_MAKING]
[PERMITTED_REACTION:INSIDE_VERMIN_MAKING]
[PERMITTED_REACTION:INSIDE_FISH_MAKING]
[PERMITTED_REACTION:INSIDE_BREAD_MAKING]
[PERMITTED_REACTION:INSIDE_FRUIT_MAKING]
[PERMITTED_REACTION:INSIDE_VEGETABLE_MAKING]
[PERMITTED_REACTION:INSIDE_CATTLE_MAKING]
[PERMITTED_REACTION:OUTDOOR_FIBER_MAKING]
[PERMITTED_REACTION:OUTDOOR_PAPER_MAKING]
[PERMITTED_REACTION:OUTDOOR_OIL_MAKING]
[PERMITTED_REACTION:INDOOR_FIBER_MAKING]
[PERMITTED_REACTION:INDOOR_PAPER_MAKING]
[PERMITTED_REACTION:INDOOR_OIL_MAKING]

    [INSTRUMENT:LIGHT_AMPLIFIER]
    [INSTRUMENT:HEAVY_AMPLIFIER]
    [INSTRUMENT:LIGHT_SHRIEKER]
    [INSTRUMENT:HEAVY_SHRIEKER]
    [INSTRUMENT:LIGHT_STRING]
    [INSTRUMENT:HEAVY_STRING]
    [INSTRUMENT:LIGHT_DRUMKIT]
    [INSTRUMENT:HEAVY_DRUMKIT]
    [INSTRUMENT:LIGHT_KEYBOARD]
    [INSTRUMENT:HEAVY_KEYBOARD]

    [PERMITTED_REACTION:INSTRUMENT_MAKING1]
    [PERMITTED_REACTION:INSTRUMENT_MAKING2]
    [PERMITTED_REACTION:INSTRUMENT_MAKING3]
    [PERMITTED_REACTION:INSTRUMENT_MAKING4]
    [PERMITTED_REACTION:INSTRUMENT_MAKING5]
    [PERMITTED_REACTION:INSTRUMENT_MAKING6]
    [PERMITTED_REACTION:INSTRUMENT_MAKING7]
    [PERMITTED_REACTION:INSTRUMENT_MAKING8]
    [PERMITTED_REACTION:INSTRUMENT_MAKING9]
    [PERMITTED_REACTION:INSTRUMENT_MAKING10]
        ]])

        local flowchart_specific = {}
        local common_specific = {}

        for _, tbl_name in ipairs(candidate.entity_tables) do
            if flowchart_data[tbl_name] then
                table.insert(flowchart_specific, tbl_name)
            elseif common_data[tbl_name] then
                table.insert(common_specific, tbl_name)
            end
        end

        for _, name in ipairs(common_specific) do
            local data = common_data[name]
            if data then
                local entry = weighted_pick_random(data)
                if entry then
                    civ_tbl = split_to_lines(civ_tbl, entry.value)
                end
            end
        end

        civ_tbl = apply_flowchart_data(civ_tbl, flowchart_specific)

        -- [[ NEW LOGIC: Scan the generated civ_tbl to find the weapon theme ]] --
        local detected_theme = detect_weapon_theme_from_lines(civ_tbl)
        if detected_theme then
            data_entry.weapon_theme = detected_theme
            log("CIV_GEN_LOG: Detected Weapon Theme [" .. detected_theme .. "] for civ " .. animal_class_tag)
        end
        -- [[ END NEW LOGIC ]] --

        table.insert(all_generated_civ_raws, civ_tbl)
        log("CIV_GEN_LOG: Prepared " .. candidate.token)
    end
end

local M = {}
M.prepare_civilization_data_hook = prepare_civilization_data_hook
M.generate_civilizations_hook = generate_civilizations_hook
M.register_all_generated_civilizations = function()
    if raws and raws.register_entities and #all_generated_civ_raws > 0 then
        for _, civ in ipairs(all_generated_civ_raws) do
            raws.register_entities(civ)
        end
    end
end

return M