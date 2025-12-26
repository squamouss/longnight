-- ====================================================================
-- MODULE REQUIREMENTS
-- ====================================================================
local data_manager = require("civ_data.data_manager")
local flowchart_data = data_manager.flowchart_data
local common_data = data_manager.common_data
local creature_engine = require("creature_generator_engine")

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

local function pick_random_array_item(tbl)
    if not tbl or #tbl == 0 then return nil end
    return tbl[math.random(#tbl)]
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
-- Configs eligible for spawning a fallback Incursion Titan OR Vessel
local FALLBACK_CONFIGS = {
    "config_biomachine",
    "config_nanomachine"
}

local civ_configuration = {
    
    BIOMACHINE = {
        subs = {
            HORROR = {
                weight = 5,
                allowed_ratings = { "VSSL" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_myriad",
					"bandits_high",
					"evilsites",
					"higher_positions_incursion", 
					"allguns" }
                }
            }
        }
    },
	
    
    NANOMACHINE = {
        subs = {
            CORRUPT = {
                weight = 5,
                allowed_ratings = { "VSSL" }, 
                sizes = {
                    MDM = { 
					"armor_all",
					"arrivaltypes", 
					"languages_myriad",
					"bandits_high",
					"evilsites",
					"higher_positions_incursion", 
					"allguns" }
                }
            }
        }
    }
}



-- ====================================================================
-- UNIVERSAL ENTITY RAWS
-- ====================================================================
local UNIVERSAL_ENTITY_RAWS = [[


DIGGER:ITEM_WEAPON_PICK]

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

	[HELM:ITEM_HELM_WRAPS:FORCED]
    [ARMOR:ITEM_ARMOR_WRAPS1:FORCED]
    [ARMOR:ITEM_ARMOR_WRAPS2:FORCED]
    [ARMOR:ITEM_ARMOR_WRAPS3:FORCED]
    [GLOVES:ITEM_GLOVES_WRAPS:FORCED]
    [SHOES:ITEM_SHOES_WRAPS:FORCED]

    [PANTS:ITEM_PANTS_WAISTCLOTH1:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH2:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH3:FORCED]
    [PANTS:ITEM_PANTS_WAISTCLOTH4:FORCED]



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
    [CURRENCY:COMPUTING_SUBSTRATE:1]
    [CURRENCY:C_TECH:10]
    [SELECT_SYMBOL:WAR:NAME_WAR]
    [SUBSELECT_SYMBOL:WAR:VIOLENT]
    [SELECT_SYMBOL:BATTLE:NAME_BATTLE]
    [SUBSELECT_SYMBOL:BATTLE:VIOLENT]
    [SELECT_SYMBOL:SIEGE:NAME_SIEGE]
    [SUBSELECT_SYMBOL:SIEGE:VIOLENT]
	[SELECT_SYMBOL:CIV:NAME_STATE_INCURSION]
	[SELECT_SYMBOL:SITE:NAME_LOCAL_DOMAIN]
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
	[USE_EVIL_PLANTS]
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

    [PERMITTED_REACTION:ARCHITECTURE_MAKING1]
    [PERMITTED_REACTION:ARCHITECTURE_MAKING2]
    [PERMITTED_REACTION:ARCHITECTURE_MAKING3]
    [PERMITTED_REACTION:FORTIFIED_ARCHITECTURE_MAKING1]
    [PERMITTED_REACTION:FORTIFIED_ARCHITECTURE_MAKING2]
    [PERMITTED_REACTION:FORTIFIED_ARCHITECTURE_MAKING3]
    [PERMITTED_REACTION:ADVANCED_ARCHITECTURE_MAKING1]
    [PERMITTED_REACTION:ADVANCED_ARCHITECTURE_MAKING2]
    [PERMITTED_REACTION:ADVANCED_ARCHITECTURE_MAKING3]
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


    [PERMITTED_REACTION:TABLET_MAKING_CORE_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_MANIFESTATION_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_COMBAT_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_PRIMARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_SECONDARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_TERTIARY_BLANK]
    [PERMITTED_REACTION:TABLET_MAKING_QUATERNARY_BLANK]


    [WILL_ACCEPT_TRIBUTE]


	[ETHIC:KILL_ENTITY_MEMBER:UNTHINKABLE]
	[ETHIC:KILL_NEUTRAL:REQUIRED]
	[ETHIC:KILL_ENEMY:REQUIRED]
	[ETHIC:KILL_ANIMAL:ACCEPTABLE]
	[ETHIC:KILL_PLANT:ACCEPTABLE]
	[ETHIC:TORTURE_AS_EXAMPLE:ACCEPTABLE]
	[ETHIC:TORTURE_FOR_INFORMATION:ACCEPTABLE]
	[ETHIC:TORTURE_FOR_FUN:ACCEPTABLE]
	[ETHIC:TORTURE_ANIMALS:ACCEPTABLE]
	[ETHIC:TREASON:UNTHINKABLE]
	[ETHIC:OATH_BREAKING:UNTHINKABLE]
	[ETHIC:LYING:UNTHINKABLE]
	[ETHIC:VANDALISM:UNTHINKABLE]
	[ETHIC:TRESPASSING:UNTHINKABLE]
	[ETHIC:THEFT:UNTHINKABLE]
	[ETHIC:ASSAULT:UNTHINKABLE]
	[ETHIC:SLAVERY:UNTHINKABLE]
	[ETHIC:EAT_SAPIENT_OTHER:REQUIRED]
	[ETHIC:EAT_SAPIENT_KILL:REQUIRED]
	[ETHIC:MAKE_TROPHY_SAME_RACE:UNTHINKABLE]
	[ETHIC:MAKE_TROPHY_SAPIENT:UNTHINKABLE]
	[ETHIC:MAKE_TROPHY_ANIMAL:UNTHINKABLE]
	
	
	[VALUE:LAW:50]
	[VALUE:LOYALTY:50]
	[VALUE:FAMILY:-50]
	[VALUE:FRIENDSHIP:-50]
	[VALUE:POWER:50]
	[VARIABLE_VALUE:TRUTH:-50:50]
	[VARIABLE_VALUE:CUNNING:-50:50]
	[VALUE:ELOQUENCE:-50]
	[VALUE:FAIRNESS:-50]
	[VALUE:DECORUM:-50]
	[VARIABLE_VALUE:TRADITION:-50:-30]
	[VALUE:ARTWORK:-50]
	[VALUE:COOPERATION:50]
	[VALUE:INDEPENDENCE:-50]
	[VALUE:STOICISM:50]
	[VARIABLE_VALUE:KNOWLEDGE:-50:50]
	[VALUE:INTROSPECTION:-50]
	[VALUE:SELF_CONTROL:50]
	[VARIABLE_VALUE:TRANQUILITY:-50:50]
	[VARIABLE_VALUE:HARMONY:-50:50]
	[VALUE:MERRIMENT:-50]
	[VARIABLE_VALUE:CRAFTSMANSHIP:0:50]
	[VARIABLE_VALUE:MARTIAL_PROWESS:0:50]
	[VARIABLE_VALUE:SKILL:0:50]
	[VALUE:HARD_WORK:50]
	[VALUE:SACRIFICE:50]
	[VALUE:COMPETITION:50]
	[VALUE:PERSEVERANCE:50]
	[VALUE:LEISURE_TIME:-50]
	[VALUE:COMMERCE:-50]
	[VALUE:ROMANCE:-50]
	[VARIABLE_VALUE:NATURE:-50:50]
	[VALUE:PEACE:-50]
	
    [TISSUE_STYLE:HAIR]
        [TS_MAINTAIN_LENGTH:0:0]
    [TISSUE_STYLE:SIDEBURNS]
        [TS_MAINTAIN_LENGTH:0:0]
    [TISSUE_STYLE:MOUSTACHE]
        [TS_MAINTAIN_LENGTH:0:0]
    [TISSUE_STYLE:BEARD]
        [TS_MAINTAIN_LENGTH:0:0]

    [BUILDS_OUTDOOR_FORTIFICATIONS]

    [GEM_SHAPE:TUBE][GEM_SHAPE:CYLINDER][GEM_SHAPE:BULB][GEM_SHAPE:RING][GEM_SHAPE:STRIP]
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

]]

-- ====================================================================
-- LOGIC
-- ====================================================================

local eligible_invasion_creatures = {}
local all_generated_invasion_civ_raws = {}
local trigger_condition_met = false

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
        if part == "SPNT" or part == "DVNT" or part == "HSTL" or part == "VSSL" or part == "AVTR" or part == "NCUR" or part == "INCR" then
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

local function force_generate_trigger_creature()
    log("INV_GEN_LOG: Attempting to force-generate Missing Trigger Creature (INCURSION/TITANIC)...")
    
    local config_name = pick_random_array_item(FALLBACK_CONFIGS)
    if not config_name then 
        log("INV_GEN_LOG: Error - No fallback configs defined.")
        return false 
    end

    local success, config_module = pcall(require, config_name)
    if not success or not config_module then
        log("INV_GEN_LOG: Error - Could not load config: " .. tostring(config_name))
        return false
    end

    -- Create a modified config clone to force specific generation
    local temp_config = {}
    for k,v in pairs(config_module) do temp_config[k] = v end
    
    -- Override settings to spawn exactly 1 Incursion Titan
    temp_config.MAX_CREATURES = 1
    temp_config.MIN_CREATURES = 1
    temp_config.forced_rating = "INCURSION" -- Force the rating choice logic
    
    -- Filter size variants to ONLY allow TITANIC to ensure we get the right size
    local forced_sizes = {}
    if temp_config.generic_body_size_variants then
        for _, sz in ipairs(temp_config.generic_body_size_variants) do
            if sz.size_tags and sz.size_tags[1] == "TITANIC" then
                table.insert(forced_sizes, sz)
            end
        end
    end
    temp_config.generic_body_size_variants = forced_sizes

    if #forced_sizes == 0 then
        log("INV_GEN_LOG: Error - Config " .. config_name .. " has no TITANIC size variants available.")
        return false
    end

    -- Run the engine
    local generated = creature_engine.run_generator(temp_config)
    
    if generated and #generated > 0 then
        log("INV_GEN_LOG: SUCCESS - Generated fallback Incursion Titan using " .. config_name)
        return true
    else
        log("INV_GEN_LOG: FAILURE - Engine returned no data for forced generation.")
        return false
    end
end

-- [[ NEW FUNCTION: Force generate a Medium Vessel for Civ Population ]] --
local function force_generate_vessel_creature()
    log("INV_GEN_LOG: Attempting to force-generate Missing Population Creature (VESSEL/MEDIUM)...")
    
    local config_name = pick_random_array_item(FALLBACK_CONFIGS)
    if not config_name then 
        log("INV_GEN_LOG: Error - No fallback configs defined.")
        return nil
    end

    local success, config_module = pcall(require, config_name)
    if not success or not config_module then
        log("INV_GEN_LOG: Error - Could not load config: " .. tostring(config_name))
        return nil
    end

    local temp_config = {}
    for k,v in pairs(config_module) do temp_config[k] = v end
    
    -- Override to force 1 Vessel of Medium size
    temp_config.MAX_CREATURES = 1
    temp_config.MIN_CREATURES = 1
    temp_config.forced_rating = "VESSEL" 
    
    local forced_sizes = {}
    if temp_config.generic_body_size_variants then
        for _, sz in ipairs(temp_config.generic_body_size_variants) do
            if sz.size_tags and sz.size_tags[1] == "MEDIUM" then
                table.insert(forced_sizes, sz)
            end
        end
    end
    temp_config.generic_body_size_variants = forced_sizes

    if #forced_sizes == 0 then
        log("INV_GEN_LOG: Error - Config " .. config_name .. " has no MEDIUM size variants available.")
        return nil
    end

    -- Run the engine and RETURN the data
    local generated = creature_engine.run_generator(temp_config)
    
    if generated and #generated > 0 then
        log("INV_GEN_LOG: SUCCESS - Generated fallback Medium Vessel using " .. config_name)
        return generated[1] -- Return the first (and likely only) creature object
    else
        log("INV_GEN_LOG: FAILURE - Engine returned no data for forced vessel generation.")
        return nil
    end
end

local function prepare_civilization_data_hook(all_creature_data)
    log("INV_GEN_LOG: [PREPROCESS] Starting Per-Creature Analysis for Invasion Trigger.")
    eligible_invasion_creatures = {}
    trigger_condition_met = false
    local found_medium_vessel = false

    -- Helper to process a creature token and add to eligible list if valid
    local function process_candidate(token)
        local parsed = parse_creature_token(token)
        if parsed then
            -- 1. CHECK TRIGGER CONDITION: INCURSION + TITANIC (TTN or TITANIC)
            if (parsed.rating == "INCR" or parsed.rating == "NCUR") and (parsed.size == "TTN" or parsed.size == "TITANIC") then
                trigger_condition_met = true
                log("INV_GEN_LOG: >>> TRIGGER ACTIVATED <<< Found: " .. token)
            end

            -- 2. CHECK CANDIDATE CONDITION: VESSEL
            if parsed.rating == "VSSL" and civ_configuration[parsed.archetype] then
                
                -- [[ NEW: Track if we have a Medium Vessel ]] --
                if parsed.size == "MDM" then
                    found_medium_vessel = true
                end

                local config = civ_configuration[parsed.archetype]
                -- Default to STANDARD if sub_archetype matches nothing in config, or use the sub_archetype
                local effective_sub = "STANDARD"
                if parsed.sub_archetype and config.subs[parsed.sub_archetype] then
                    effective_sub = parsed.sub_archetype
                end
                
                if config.subs[effective_sub] then
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
                        table.insert(eligible_invasion_creatures, {
                            token = token,
                            archetype = parsed.archetype,
                            sub_archetype = effective_sub,
                            size = parsed.size,
                            rating = parsed.rating,
                            entity_tables = sub_config.sizes[parsed.size],
                            weight = sub_config.weight or 10
                        })
                        log("INV_GEN_LOG: Added Candidate: " .. token .. " ["..parsed.archetype.."/VSSL/"..parsed.size.."]")
                    end
                end
            end
        end
    end

    -- Main Loop
    if all_creature_data then
        for _, creature_info in ipairs(all_creature_data) do
            if creature_info.creature and #creature_info.creature > 0 then
                local token_line = creature_info.creature[1]
                local token = token_line:match("%[CREATURE:(.-)%]")
                if token then
                    process_candidate(token)
                end
            end
        end
    end
    
    -- [[ CHECK 1: Handle Trigger Fallback ]] --
    if trigger_condition_met then
        log("INV_GEN_LOG: Trigger already met.")
    else
        log("INV_GEN_LOG: Trigger NOT met (No TITANIC INCURSION found). Initiating fallback generation.")
        local generated_success = force_generate_trigger_creature()
        if generated_success then
            trigger_condition_met = true
        else
            log("INV_GEN_LOG: Fallback generation failed. Invasion civs will NOT be generated.")
        end
    end

    -- [[ CHECK 2: Handle Population Fallback (Medium Vessel) ]] --
    if not found_medium_vessel then
        log("INV_GEN_LOG: No Medium Vessel found. Initiating fallback generation for population...")
        local new_creature_data = force_generate_vessel_creature()
        if new_creature_data and new_creature_data.creature and #new_creature_data.creature > 0 then
            local token_line = new_creature_data.creature[1]
            local token = token_line:match("%[CREATURE:(.-)%]")
            if token then
                log("INV_GEN_LOG: Processing new fallback vessel: " .. token)
                process_candidate(token) -- Process it immediately to add to eligible list
            end
        else
            log("INV_GEN_LOG: Failed to generate fallback vessel.")
        end
    else
        log("INV_GEN_LOG: Medium Vessel population already exists.")
    end
    
    log("INV_GEN_LOG: [PREPROCESS] Complete. Eligible Candidates: " .. #eligible_invasion_creatures)
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
    log("INV_GEN_LOG: Attempting Invasion Civilization Generation...")
    
    if not trigger_condition_met then 
        return 
    end
    
    if #eligible_invasion_creatures == 0 then 
        log("INV_GEN_LOG: Trigger met, but no eligible VESSEL creatures found.")
        return 
    end

    local civ_counter = 1
    
    -- Loop through ALL eligible candidates to generate unique civs for each
    while #eligible_invasion_creatures > 0 do
        -- Pick from the weighted list and remove to avoid duplicates
        local candidate = weighted_pick_random_no_replace(eligible_invasion_creatures)
        
        if candidate then
            local civ_tbl = {"[ENTITY:INVASION_CIV_" .. tostring(civ_counter) .. "]"}
            table.insert(civ_tbl, "[CREATURE:" .. candidate.token .. "]")
            
            -- Dynamic Animal Class Tag
            local animal_class_tag = candidate.archetype .. "_INV_" .. tostring(civ_counter)
            table.insert(civ_tbl, "[ANIMAL][ANIMAL_CLASS:" .. animal_class_tag .. "][ANIMAL_ALWAYS_PRESENT]")

            -- Cache for Domestic Engine
            local data_entry = {
                creature_token = candidate.token,
                archetype = candidate.archetype,
                sub_archetype = candidate.sub_archetype,
                size_class = candidate.size,
                animal_class_tag = animal_class_tag
            }
            if _G.generated_civilization_data then
                table.insert(_G.generated_civilization_data, data_entry)
            end

            -- Base Universal Tokens (Empty placeholder)
            _G.add_generated_info(civ_tbl)
            split_to_lines(civ_tbl, UNIVERSAL_ENTITY_RAWS)

            -- Apply Dynamic Entity Configuration
            local flowchart_specific = {}
            local common_specific = {}

            for _, tbl_name in ipairs(candidate.entity_tables) do
                if flowchart_data[tbl_name] then
                    table.insert(flowchart_specific, tbl_name)
                elseif common_data[tbl_name] then
                    table.insert(common_specific, tbl_name)
                end
            end

            -- 1. Apply Common Data (Flat lists)
            for _, name in ipairs(common_specific) do
                local data = common_data[name]
                if data then
                    local entry = weighted_pick_random(data)
                    if entry then
                        civ_tbl = split_to_lines(civ_tbl, entry.value)
                    end
                end
            end

            -- 2. Apply Flowchart Data (Hierarchical)
            civ_tbl = apply_flowchart_data(civ_tbl, flowchart_specific)

            -- [[ NEW LOGIC: Scan the generated civ_tbl to find the weapon theme ]] --
            local detected_theme = detect_weapon_theme_from_lines(civ_tbl)
            if detected_theme then
                data_entry.weapon_theme = detected_theme
                log("INV_GEN_LOG: Detected Weapon Theme [" .. detected_theme .. "] for invasion civ " .. animal_class_tag)
            end
            -- [[ END NEW LOGIC ]] --

            table.insert(all_generated_invasion_civ_raws, civ_tbl)
            log("INV_GEN_LOG: Prepared " .. candidate.token)
            
            civ_counter = civ_counter + 1
        end
    end
end

local M = {}
M.prepare_civilization_data_hook = prepare_civilization_data_hook
M.generate_civilizations_hook = generate_civilizations_hook
M.register_all_generated_civilizations = function()
    if raws and raws.register_entities and #all_generated_invasion_civ_raws > 0 then
        for _, civ in ipairs(all_generated_invasion_civ_raws) do
            raws.register_entities(civ)
        end
    end
end

return M