
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CHIMERA",
    MIN_CREATURES = 100,
    MAX_CREATURES = 300,
    BASE_CREATURE_NAME_PREFIX = "chimera ID",
    OUTPUT_FILENAME = "generated_chimera_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "chimera",
    TRANSCENDENT_NAME_ROOT_PLURAL = "chimeras",

    TRAIT_NAME_MODIFIERS = {
        ["SOPHONT"] = "SPNT",
        ["HOSTILE"] = "HSTL", 
        ["VESSEL"] = "VSSL", 
        ["DEVIANT"] = "DVNT", 
        ["AVATAR"] = "AVTR", 
        ["INCURSION"] = "NCUR", 
		
        ["DANGEROUS"] = "DNGR",
        ["BENIGN"] = "BNGN", 
        ["HAZARDOUS"] = "HZRD", 
        ["PROBLEMATIC"] = "PRBM",
        ["EXISTENTIAL"] = "EXST",  
		
        ["VERMIN"] = "VRMN", 
        ["AMBIENT"] = "AMBT",
		
        ["DOMESTIC"] = "DMST",
        ["VEHICLE"] = "VHCL", 
        ["CARRIER"] = "CRER", 
        ["NOMAD"] = "NMAD", 
        ["WEAPON"] = "WEPN", 
        ["LABOR"] = "LABR", 
        ["SERVANT"] = "SRVT", 
        ["HUNTER"] = "HNTR", 
        ["SANITATION"] = "SNTN", 
        ["PRODUCT"] = "PRDC"
    },

    COMPONENT_TABLES = {
        { name = "component_1", table_key = "procgen_addon_table_1" },
        { name = "component_2", table_key = "procgen_addon_table_2" },
        { name = "component_3", table_key = "procgen_addon_table_3" },
        { name = "component_4", table_key = "procgen_addon_table_4", use_for_fingerprint = false }
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_CLASS:CHIMERA]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
        [CREATURE_CLASS:ORGANIC]
        

    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

        [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
        [USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
		
        [ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:kick:kicks]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:4:4]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_BAD_MULTIATTACK]
		
        [SELECT_TISSUE_LAYER:HEART:BY_CATEGORY:HEART]
        [PLUS_TISSUE_LAYER:SKIN:BY_CATEGORY:THROAT]
            [TL_MAJOR_ARTERIES]
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
        [USE_MATERIAL_TEMPLATE:SINEW:SINEW_TEMPLATE]
        [TENDONS:LOCAL_CREATURE_MAT:SINEW:200]
        [LIGAMENTS:LOCAL_CREATURE_MAT:SINEW:200]
        [HAS_NERVES]
        [USE_MATERIAL_TEMPLATE:BLOOD:BLOOD_TEMPLATE]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
        [CREATURE_CLASS:GENERAL_POISON]
        [GETS_WOUND_INFECTIONS]
        [GETS_INFECTIONS_FROM_ROT]
        [USE_MATERIAL_TEMPLATE:PUS:PUS_TEMPLATE]
        [PUS:LOCAL_CREATURE_MAT:PUS:LIQUID]
        [USE_MATERIAL_TEMPLATE:SPIT:SPIT_TEMPLATE]
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
    ]],

    COMMON_APPEARANCE_RAWS = [[
			
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eyes:PLURAL]
		
		
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Chimeras are the feral remnants of pre-Fade gene-engineered domestics, artisanal ecosystems, and area denial bioweapons, their modular DNA built off of Geno-Archon bioscience and later expanded upon from the most successful products, leading to a numberless population of adaptable organisms possessing high biocompatibility with even distantly related artificial life forms, allowing them to proliferate across the Megastructures and beyond. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            [BENIGN]
            [CREATURE_CLASS:SOPHONT]
            ]]},
            tags = {"SOPHONT"},
            weight = 5,
            enabled = false,
            minimum_number = 0
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            
            [NIGHT_CREATURE_HUNTER]	
            [LAIR_HUNTER]
            [LAIR:SIMPLE_BURROW:50]
            [LAIR:SIMPLE_MOUND:50]
            [LAIR:LABYRINTH:25]
            [LAIR:SHRINE:25]
            [LAIR_CHARACTERISTIC:HAS_DOORS:50]
            [HABIT_NUM:TEST_ALL]
            [HABIT:GRIND_BONE_MEAL:50]
            [HABIT:COOK_BLOOD:50]
            [HABIT:GRIND_VERMIN:50]
            [HABIT:COOK_VERMIN:50]
            [HABIT:COOK_PEOPLE:50]
            [HABIT:COLLECT_TROPHIES:50]
            [HABIT:COLLECT_WEALTH:50]
            [HABIT:USE_ANY_MELEE_WEAPON:100]
            [CREATURE_CLASS:HOSTILE]
            ]]},
            tags = {"HOSTILE"},
            weight = 5,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
            [FEATURE_BEAST]
            [CREATURE_CLASS:EXISTENTIAL]
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
            [LARGE_PREDATOR][AMBUSHPREDATOR][CRAZED]
            
            [CREATURE_CLASS:DANGEROUS]
            ]]},
            tags = {"DANGEROUS"},
            weight = 10,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS]
            [PRONE_TO_RAGE:20]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 30,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
            ]]},
            tags = {"BENIGN"},
            weight = 30,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vermin; it is very small but can infest settlements or otherwise inconvenience other organisms. ",
            tok = {[[
            [FISHITEM]
            [CREATURE_CLASS:VERMIN]
            ]]},
            tags = {"VERMIN"},
            weight = 5,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
            [FISHITEM]
            [CREATURE_CLASS:AMBIENT]
            ]]},
            tags = {"AMBIENT"},
            weight = 5,
            enabled = true
        }
    },

    generic_body_size_variants = {
        {
            name_part = "MCR",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 1,
            base_adult_size_for_random = 1,
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MICRO"}, 
            tok = {[[
            [VERMIN_MICRO]
            [SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            ]]}, 
            weight = 10, 
            enabled = false
        },
        {
            name_part = "MNL", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 10, 
            body_size_index_and_child_count = 0, 
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MINIMAL"}, 
            tok = {[[
            [VERMIN_GROUNDER]
            [NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            ]]}, 
            weight = 10, 
            enabled = false
        },
		{
			name_part = "SML",
			desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
			min_raw_size_factor = 100,
			base_adult_size_for_random = 100,
			body_size_index_and_child_count = 0,
			eligible_rating_tags = {"VERMIN", "AMBIENT"},
			size_tags = {"SMALL"},
			tok = {[[
				[FISHITEM]
			[VERMIN_GROUNDER]
			[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
			[CREATURE_TILE:249]
			]]},
			weight = 10,
			enabled = true
		},
        {
            name_part = "LSR", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 1000,
            body_size_index_and_child_count = 1,
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC"},
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_TILE:'c'][CREATURE_CLASS:SIZE_LESSER]
            
            ]]}, 
            weight = 30, 
            enabled = true
        },
        {
            name_part = "MDM",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 100,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 5,
            eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS"},
            size_tags = {"MEDIUM"}, 
            weight = 50, 
            tok = {[[
           
        [CREATURE_TILE:'c']
        [CREATURE_CLASS:SIZE_MEDIUM]
            
            [POPULATION_NUMBER:50:200]
            [CREATURE_CLASS:NORMALHEAD]
            [CREATURE_CLASS:NORMALARMS]
            [CREATURE_CLASS:NORMALSHOULDERS]
            [CREATURE_CLASS:NORMALHIPS]
            [CREATURE_CLASS:NORMALLEGS]
            [CREATURE_CLASS:NORMALBODY]
            ]]}, 
            enabled = true
        },
        {
            name_part = "LRG", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 1000,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 10,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN"},
            size_tags = {"LARGE"}, 
            weight = 20, 
            tok = {[[
            [CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_LARGE]
            
            [CREATURE_CLASS:LARGEHEAD]
            [CREATURE_CLASS:LARGEARMS]
            [CREATURE_CLASS:LARGESHOULDERS]
            [CREATURE_CLASS:LARGEHIPS]
            [CREATURE_CLASS:LARGELEGS]
            [CREATURE_CLASS:LARGEBODY]
            ]]}, 
            enabled = true
        },
        {
            name_part = "HGE",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 1000000,
            body_size_index_and_child_count = 15,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            [SAVAGE]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 10, 
            enabled = true
        },
        {
            name_part = "GNT", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 10000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
            size_tags = {"GIANT"}, 
            tok = {[[
            [CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_GIANT]
            [SAVAGE]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 2,
            enabled = true
        },
        {
            name_part = "TTN", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 100000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"EXISTENTIAL"},
            size_tags = {"TITANIC"}, 
            tok = {[[
            [CREATURE_TILE:'E'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = false
        }
    },

    procgen_addon_table_1 = {
     
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the cold, with a broad, squat body and a thick pelt of fur, draped over its head, neck, and back. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
		attribute_weight = { 
		STRENGTH = "+", 
		AGILITY = "-"
		},
            tok = {[[
			[COLOR:7:0:1]
			[BIOME:TUNDRA]
                   [DIURNAL]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:5:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
	[BODY_DETAIL_PLAN:BODY_HAIR_TISSUE_LAYERS:HAIR]
			[SET_TL_GROUP:BY_CATEGORY:ALL:HAIR]
                        [TL_COLOR_MODIFIER:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
				
			]]}, 
            weight = 10,
		next_tables = {"procgen_subchart_table_body_tundra"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to extreme cold, with a broad, squat body and a thick layer of insulating blubber. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
		attribute_weight = { 
		ENDURANCE = "+", 
		AGILITY = "--"
		},
            tok = {[[
			[COLOR:7:0:1]
			[BIOME:GLACIER][BIOME:OCEAN_ARCTIC]
                   [DIURNAL]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
				
			[AMPHIBIOUS][SWIMS_INNATE]
			]]}, 
            weight = 10,
		next_tables = {"procgen_subchart_table_body_glacier"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the harsh conditions of the developed surfaces of the Megastructures, with wrinkled, leathery skin resistant to corrosive or toxic chemicals. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"},
		attribute_weight = { 
		TOUGHNESS = "+",
		RECUPERATION = "+", 
		DISEASE_RESISTANCE = "-"
		}, 
            tok = {[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:ANY_DESERT]
			[COLOR:7:0:0]
                   [DIURNAL]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:1:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
			]]}, 
            weight = 200,
		next_tables = {"procgen_subchart_table_body_developed"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the lichen growths of the Megastructures, with wrinkled, leathery skin resistant to corrosive or toxic chemicals, and lichen growths dotting its skin granting bioluminescence. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
		attribute_weight = { 
		RECUPERATION = "+", 
		DISEASE_RESISTANCE = "+"
		},
            tok = {[[
			[GLOWTILE:249][GLOWCOLOR:3:0:1]
					[BIOME:MARSH_TEMPERATE_SALTWATER][BIOME:SWAMP_TEMPERATE_SALTWATER]
					[BIOME:MARSH_TROPICAL_SALTWATER][BIOME:SWAMP_TROPICAL_SALTWATER]
					[BIOME:SWAMP_MANGROVE]
			[COLOR:3:0:0]
                   [DIURNAL]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:1:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
			]]}, 
            weight = 20,
		next_tables = {"procgen_subchart_table_body_lichen"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the upper atmosphere of the Megastructures, with smooth, rubbery, aerodynamic skin. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
		attribute_weight = { 
		ENDURANCE = "++", 
		TOUGHNESS = "-", 
		DISEASE_RESISTANCE = "--"
		},
            tok = {[[
			[BIOME:MOUNTAIN]
			[COLOR:1:0:0]
                   [DIURNAL]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:1:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
			]]}, 
            weight = 20,
		next_tables = {"procgen_subchart_table_body_air"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the moss growths which dot the megastructure, with symbiotic flora growing over its body to provide camoflage and a means of photosynthesis. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
		attribute_weight = { 
		RECUPERATION = "++", 
		DISEASE_RESISTANCE = "--"
		},
            tok = {[[
			[BIOME:MARSH_TEMPERATE_FRESHWATER][BIOME:SWAMP_TEMPERATE_FRESHWATER]
					[BIOME:MARSH_TROPICAL_FRESHWATER][BIOME:SWAMP_TROPICAL_FRESHWATER]
			[COLOR:2:0:0]
				
			[AMPHIBIOUS][SWIMS_INNATE]
                   [DIURNAL]
				   [NO_WINTER]
				   [NO_AUTUMN]
				   
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:DARK_PINK:1]
                [TLCM_NOUN:skin:SINGULAR]
			
			]]}, 
            weight = 50,
		next_tables = {"procgen_subchart_table_body_moss"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the night cycle of the megastructure, with a light-absorbing black pelt and large, faintly luminescent eyes. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
		attribute_weight = { 
		AGILITY = "+", 
		INTUITION = "+"
		},
            tok = {[[
			[BIOME:ANY_LAND]
			[COLOR:0:0:1]
                   [NOCTURNAL]
                    [LOW_LIGHT_VISION:10000]
			
	[BODY_DETAIL_PLAN:BODY_HAIR_TISSUE_LAYERS:HAIR]
			[SET_TL_GROUP:BY_CATEGORY:ALL:HAIR]
                        [TL_COLOR_MODIFIER:BLACK:1]
                [TLCM_NOUN:hair:SINGULAR]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
                        [TL_COLOR_MODIFIER:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:1:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
			]]}, 
            weight = 20,
		next_tables = {"procgen_subchart_table_body_night"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the waters of the Megastructures, with slime-excreting, hydrodynamic skin and webbed digits. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
		attribute_weight = { 
		ENDURANCE = "+", 
		DISEASE_RESISTANCE = "-"
		},
            tok = {[[
			[BIOME:ANY_RIVER]
			[BIOME:ANY_LAKE]
			[BIOME:OCEAN_TROPICAL]
			[BIOME:OCEAN_TEMPERATE]
			[COLOR:5:0:1]
                   [ALL_ACTIVE]
			
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:DARK_PINK:1]
                [TLCM_NOUN:skin:SINGULAR]
				
			[AMPHIBIOUS]
			]]}, 
            weight = 50,
		next_tables = {"procgen_subchart_table_body_water"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the depths of the Megastructures, with a flexible skeleton and loose folds of skin allowing it to squeeze through gaps and maneuver through the dense tunnels of the depths. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
		attribute_weight = { 
		AGILITY = "++", 
		TOUGHNESS = "-", 
		DISEASE_RESISTANCE = "-"
		},
            tok = {[[
			[COLOR:5:0:1]
                   [ALL_ACTIVE]
			[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:DARK_PINK:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:40:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
                    [LOW_LIGHT_VISION:10000]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			]]}, 
            weight = 100,
		next_tables = {"procgen_subchart_table_body_cave"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate found across the megastructures. This specimen has adapted to the active regions of the megastructure, with a slick, flexible skin that creases at the joints, insulated from electricity and gases. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
		attribute_weight = { 
		RECUPERATION = "++", 
		DISEASE_RESISTANCE = "++",
		STRENGTH = "-"
		},
            tok = {[[
			[COLOR:7:0:1]
                   [ALL_ACTIVE]
			[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:40:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
			
                    [LOW_LIGHT_VISION:10000]
			[BIOME:SUBTERRANEAN_WATER][BIOME:ANY_FOREST]
			[UNDERGROUND_DEPTH:0:3]
			]]}, 
            weight = 10,
		next_tables = {"procgen_subchart_table_body_cave"}
        }
    },
	
	   procgen_addon_table_2 = {
    
		{
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a rounded, almost neotenic head ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
			{
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has an uncannily humanoid head ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a long, narrow, tapering head with a jaw running lengthwise across it ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a long, flat head with a jaw running lengthwise across it ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a wide, flat head with a jaw running lengthwise across it ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
			{
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a bullet-shaped head with its mouth below the point ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a simple, blunt head ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a long, flat head with a short jaw below its extended upper skull ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
            },
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a long, narrow, pointed head with a short jaw below its extended upper skull ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
			},
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a wide, pointed head with a short jaw below its extended upper skull ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
			},
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a long, narrow, pointed head with a short jaw below its extended upper skull and an elongated chin below that, all ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
			},
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a wide, pointed head with a short jaw below its extended upper skull and an elongated chin below that, all ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
			},
            {
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a simple, blunt head with an elongated chin ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_neck"}
	
        }
    },
	
	
	
	
	   procgen_addon_table_3 = {
    
		{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 90
            },
			{
                body_token = "",
                desc_part = "It has a layer of cybernetics and dermal plating growing from its body, a relic of failed domestication attempts. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
				]]}, 
                weight = 10
        }
    },
	
	
	
	   procgen_addon_table_4 = {
    
		{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
				tok = {[[ 
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:grunt:grunts:grunting]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:bleat:bleats:bleating]

				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:grunt:grunts:grunting]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:bellow:bellows:bellowing]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"BENIGN"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:burble:burbles:burbling]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:rumble:rumbles:rumbling]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:screech:screeches:screeching]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:whoop:whoops:whooping]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:growl:growls:growling]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:howl:howls:howling]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:screech:screeches:screeching]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:scream:screams:screaming]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				eligible_rating_tags = {"DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:growl:growls:growling]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:roar:roars:roaring]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It makes no noise when it hunts. ",
				eligible_rating_tags = {"DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50
            }
    },
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
        procgen_subchart_table_body_tundra = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_bulk"}
            },
			{
                body_token = "",
                desc_part = "It has a hefty, robust body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_cow"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has an upright body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
	
	
        procgen_subchart_table_body_glacier = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_bulk"}
            },
			{
                body_token = "",
                desc_part = "It has a hefty, robust body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_cow"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            }
    },
   
        procgen_subchart_table_body_developed = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_bulk"}
            },
			{
                body_token = "",
                desc_part = "It has a hefty, robust body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_cow"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            },
			{
                body_token = "",
                desc_part = "It has an upright body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
   
        procgen_subchart_table_body_night = {
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            },
			{
                body_token = "",
                desc_part = "It has an upright body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
        procgen_subchart_table_body_lichen = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_bulk"}
            },
			{
                body_token = "",
                desc_part = "It has a hefty, robust body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_cow"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            },
			{
                body_token = "",
                desc_part = "It has an upright body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
   
        procgen_subchart_table_body_air = {
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            },
			{
                body_token = "",
                desc_part = "It has an upright body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
   
   
        procgen_subchart_table_body_moss = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            }
    },
   
   
   
        procgen_subchart_table_body_cave = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_squat"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_long"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_narrow"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_bulk"}
            },
    },
   
   
   
   
   
        procgen_subchart_table_body_water = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_fin"}
            },
			{
                body_token = "",
                desc_part = "It has a bulky, hunched body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_fin"}
            },
			{
                body_token = "",
                desc_part = "It has a hefty, robust body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_fin"}
            },
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_fin"}
            },
			{
                body_token = "",
                desc_part = "It has a sleek, narrow body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_fin"}
            }
    },
   
   
	
        procgen_subchart_table_legs_squat = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "two short front legs and two powerful rear legs, allowing it to move quickly in short bursts. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
				tok = {[[ 
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		
					[PHYS_ATT_RANGE:ENDURANCE:0:100:200:300:400:450:500]                       ---
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "two short front legs and two powerful rear legs, allowing it to move quickly in short bursts. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
					[PHYS_ATT_RANGE:ENDURANCE:0:100:200:300:400:450:500]                       ---
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            }
    },
	
	
        procgen_subchart_table_legs_cow = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "eight short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:5TOES:",
                desc_part = "eight short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:",
                desc_part = "four long, straight, pillar-like legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LARGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph			
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:",
                desc_part = "six long, straight, pillar-like legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:528:352:176:1900:2900] 50 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:",
                desc_part = "eight long, straight, pillar-like legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            }
    },
	
	
        procgen_subchart_table_legs_fin = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "two short, web-finned legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[AMPHIBIOUS]
				[UNDERSWIM]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
			},
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short, web-finned legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[AMPHIBIOUS]
				[UNDERSWIM]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six, web-finned legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[AMPHIBIOUS]
				[UNDERSWIM]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
            },
			{
                body_token = "SIDE_FLIPPERS:",
                desc_part = "a pair of flippers on its sides. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[AQUATIC][IMMOBILE_LAND]
				[UNDERSWIM]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
            },
			{
                body_token = "FRONT_BODY_FLIPPERS:REAR_BODY_FLIPPERS:",
                desc_part = "two pairs of flippers on its sides. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[AQUATIC][IMMOBILE_LAND]
				[UNDERSWIM]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
            },
			{
                body_token = "FRONT_BODY_FLIPPERS:MIDDLE_BODY_FLIPPERS:REAR_BODY_FLIPPERS:",
                desc_part = "three pairs of flippers on its sides. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[AQUATIC][IMMOBILE_LAND]
				[UNDERSWIM]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_water"}
            }
    },
	
	
	
        procgen_subchart_table_legs_long = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "eight short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:5TOES:",
                desc_part = "eight short legs splayed out from its sides, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
			weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "TAIL_STANCE:",
                desc_part = "no limbs at all, slithering along the ground to move. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 200
			},
			{
                body_token = "2WINGS:TAIL_STANCE:",
                desc_part = "a pair of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ [FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:3512:2634:1756:878:4900:6900] 10 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "4WINGS:TAIL_STANCE:",
                desc_part = "two pairs of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ [FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "BASIC_3PARTARMS:5FINGERS:TAIL_STANCE:",
                desc_part = "no legs, slithering along the ground to move, and a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "BASIC_3PARTARMS:2WINGS:5FINGERS:TAIL_STANCE:",
                desc_part = "a pair of membraneous wings, along with a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:2WINGS:5TOES:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight along with a pair of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight along with a pair of membraneous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:2WINGS:5TOES:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight along with a pair of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body.. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:2WINGS:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight along with a pair of membranous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:5TOES:",
                desc_part = "eight long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:528:352:176:1900:2900] 50 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            }
    },
	
        procgen_subchart_table_legs_ape = {
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and set of arms. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:2WINGS:5TOES:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and set of membranous wings instead of arms. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:4ARMS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and two sets of arms, one pair at its shoulders and another emerging from its midsection. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body with a set of membranous wings emerging from its back. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
           
            },
			{
                body_token = "BASIC_3PARTLEGS:4ARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and two sets of arms, one pair at its shoulders and another emerging from its midsection. A pair of membranous wings emerge from its back.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
           
            },
			{
                body_token = "BASIC_3PARTLEGS:6ARMS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and three sets of arms, one pair at its shoulders, another emerging from its midsection, and a third pair hanging from its back.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
           
            }
    },
	
	
	
	
	
        procgen_subchart_table_legs_narrow = {
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:2WINGS:5TOES:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight along with a pair of membranous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two long, slender, straight digitigrade legs supporting its weight along with a pair of membranous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:2WINGS:5TOES:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight along with a pair of membranous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body.. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:2WINGS:",
                desc_part = "four long, slender, straight digitigrade legs supporting its weight along with a pair of membranous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six long, slender, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six long, slender, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "eight long, slender, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:5TOES:",
                desc_part = "eight long slender digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:528:352:176:1900:2900] 50 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            }
    },
	
	
	
	
        procgen_subchart_table_legs_bulk = {
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:2WINGS:5TOES:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight along with a pair of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_3PARTLEGS:BASIC_3PARTARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight along with a pair of membraneous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four muscular, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:2WINGS:5TOES:",
                desc_part = "four muscular, straight digitigrade legs supporting its weight along with a pair of membraneous wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four muscular digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four muscular, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body.. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:2WINGS:",
                desc_part = "four muscular, straight digitigrade legs supporting its weight along with a pair of membraneous wings, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ [FLIER]
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "four muscular digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"LESSER"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six muscular, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "six muscular digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six muscular, straight digitigrade legs supporting its weight, a pair of eerily humanoid arms and hands hanging from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:BASIC_3PARTARMS:5TOES:5FINGERS:",
                desc_part = "six muscular digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. A pair of eerily humanoid arms and hands hang from the front of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "6LEG:5TOES:",
                desc_part = "eight muscular, straight digitigrade legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            },
			{
                body_token = "8LEG:5TOES:",
                desc_part = "eight muscular digitigrade legs splayed out from its sides in an almost arthropod-like configuration, resting on its belly when not in motion. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
	[USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
	[USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
	[ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:ALL:NAIL]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:scratch:scratches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:528:352:176:1900:2900] 50 kph
				[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_tail_normal"}
            }
    },
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
        procgen_subchart_table_legs_tail_normal = {
			{
                body_token = "TAIL:",
                desc_part = "It has a long, broad, tapering tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				   [RELSIZE:BY_CATEGORY:TAIL:500]
			[ATTACK:SLAP:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:slap:slaps]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_WITH]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
				]]}, 
                weight = 50
            },
			{
                body_token = "TAIL:",
                desc_part = "It has a long, narrow tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				
				   [RELSIZE:BY_CATEGORY:TAIL:300]
			[ATTACK:SLAP:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:1]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_WITH]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
				]]}, 
                weight = 50
            },
			{
                body_token = "TAIL:",
                desc_part = "It has a short, broad, tapering tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				
				   [RELSIZE:BY_CATEGORY:TAIL:200]
				]]}, 
                weight = 50
            },
			{
                body_token = "TAIL:",
                desc_part = "It has a short, narrow tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50
            }
    },
	
	
	
	
        procgen_subchart_table_legs_tail_water = {
			{
                body_token = "TAIL_STANCE:",
                desc_part = "It has a long, paddle-shaped tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 

				   [RELSIZE:BY_CATEGORY:TAIL:300]
			[ATTACK:SLAP:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:slap:slaps]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_WITH]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
				]]}, 
                weight = 50
            },
			{
                body_token = "TAIL_STANCE:",
                desc_part = "It has a long, fluked tail. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				   [RELSIZE:BY_CATEGORY:TAIL:500]
			[ATTACK:SLAP:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:1]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_WITH]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
				]]}, 
                weight = 50
            }
    },
	
   
   
        procgen_subchart_table_neck = {
            {     
                body_token = "", 
                desc_part = "at the end of a thick, tapering neck, with ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				  [RELSIZE:BY_CATEGORY:NECK:200]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_eyes"}
            },
            {     
                body_token = "", 
                desc_part = "at the end of a long, narrow neck, with ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				   [RELSIZE:BY_CATEGORY:NECK:300]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_eyes"} 
            },
            {     
                body_token = "", 
                desc_part = "at the end of a long neck as wide as its head, with ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				   [RELSIZE:BY_CATEGORY:NECK:500]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_eyes"} 
            },
            {     
                body_token = "", 
                desc_part = "at the end of a short neck, with ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_eyes"} 
            }
    },
    
        procgen_subchart_table_eyes = {
            {     
                body_token = "2EYES:", 
                desc_part = "small side-facing eyes and ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				[VISION_ARC:50:310]
                ]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_teeth"} 
            },
            {     
                body_token = "2EYES:", 
                desc_part = "small forward-facing eyes and ",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_teeth"} 
            },
            {     
                body_token = "2EYES:", 
                desc_part = "large forward-facing eyes and ",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				  [LOW_LIGHT_VISION:10000][CREPUSCULAR][MATUTINAL]
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_teeth"} 
            }
		},
    
        procgen_subchart_table_teeth = {
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:FACIAL_FEATURES:", 
                desc_part = "blunt teeth on an enfleshed face with ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_ear"} 
            },
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:FACIAL_FEATURES:", 
                desc_part = "narrow, hooked teeth on an enfleshed face with ",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_ear"} 
            },
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:FACIAL_FEATURES:", 
                desc_part = "sharp, conical teeth on an enfleshed face with ",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_ear"} 
            },
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:2EARHOLE",  
                desc_part = "narrow, hooked teeth on a bony, lipless face. ",
				eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
                ]]},
                weight = 100 
            },
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:2EARHOLE",  
                desc_part = "sharp, conical teeth on a bony, lipless face. ",
				eligible_rating_tags = {"DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 100 
            },
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:2EARHOLE",  
                desc_part = "blunt teeth on a bony, lipless face. ",
				eligible_rating_tags = {"BENIGN", "AMBIENT", "PROBLEMATIC"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 100 
			},
            {     
                body_token = "MOUTH:TONGUE:GENERIC_TEETH:2EARHOLE",  
                desc_part = "blunt teeth on a bony, lipless face. ",
				eligible_rating_tags = {"HAZARDOUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
                tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 100 
				}
			},
			
	   procgen_subchart_table_ear = {
            {     
                body_token = "2EARS", 
                desc_part = "a pair of short, pointed ears. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
                ]]}, 
                weight = 50
            },
            {     
                body_token = "2EARS", 
                desc_part = "a pair of long, pointed ears. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
                ]]}, 
                weight = 50
            },
            {     
                body_token = "2EARS", 
                desc_part = "a pair of long, floppy ears. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
                ]]}, 
                weight = 50
            }
            }
    },
    
    -- ============================================================================
    -- RESTRUCTURED: Non-Sophont Caste Data
    -- ============================================================================
    non_sophont_caste_groups = {
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CHIMERA_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CHIMERA_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CHIMERA_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CHIMERA_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        }
    },

	-- ============================================================================
    -- CASTE FUNCTION RULES
    -- ============================================================================
    generate_caste_raws = function(config, components, lines, final_mass, utils)

        local compatible_castes = utils.filter_components_by_tags(
            config.non_sophont_caste_groups, 
            components.creature_tags, 
            components.size_variant.size_tags or {}
        )
        local chosen_caste_group = utils.pick_random(compatible_castes)
        
        if chosen_caste_group and chosen_caste_group.castes then
            -- This is your NEW logic. It is being preserved.
            -- A specific caste group was found (e.g., for Sophonts or a specific non-sophont)
            local body_str = utils.body_string_constructor(config, components, "non_sophont")
            for _, caste_def in ipairs(chosen_caste_group.castes) do
                local caste_desc = utils.description_constructor(config, components, final_mass, caste_def.description_addon, true, "non_sophont")
                utils.split_to_lines(lines, caste_def.tokens)
                utils.split_to_lines(lines, "[DESCRIPTION:" .. caste_desc .. "]")
                utils.split_to_lines(lines, body_str)
            end
            if chosen_caste_group.shared_tokens then
                utils.split_to_lines(lines, chosen_caste_group.shared_tokens)
            end

            -- This is part of your NEW logic.
            return chosen_caste_group.shared_descriptor_tokens
        else
            -- [[ START: FIXED FALLBACK BLOCK WITH WARNING ]]
            
            -- Grab the log function (print if _G.log isn't available)
            local log_func = _G.log or print
            
            -- Build the specific warning message
            local rating_tag = (components.rating and components.rating.tags and components.rating.tags[1]) or "UNKNOWN_RATING"
            local size_tags = (components.size_variant and components.size_variant.size_tags and table.concat(components.size_variant.size_tags, ", ")) or "NO_SIZE_TAGS"
            local log_prefix = (config and config.ARCHETYPE_CLASS or "UNKNOWN_CONFIG") .. "_GENERATOR_LOG"
            
            log_func(log_prefix .. ": CASTE WARNING - Using fallback caste generation. No specific caste group was found for Rating: [" .. rating_tag .. "] and Size Tags: [" .. size_tags .. "].")

            -- This is the working fallback code from your older config_biomachine.lua file.
            -- It will now correctly generate a male/female pair.
            local body_str = utils.body_string_constructor(config, components, "non_sophont")
            local female_desc = utils.description_constructor(config, components, final_mass, "", true, "non_sophont")
            utils.split_to_lines(lines, "[CASTE:FEMALE][FEMALE]")
            utils.split_to_lines(lines, "[DESCRIPTION:" .. female_desc .. "]")
            utils.split_to_lines(lines, body_str)

            local male_desc = utils.description_constructor(config, components, final_mass, "", true, "non_sophont")
            utils.split_to_lines(lines, "[CASTE:MALE][MALE]")
            utils.split_to_lines(lines, "[DESCRIPTION:" .. male_desc .. "]")
            utils.split_to_lines(lines, body_str)
            -- [[ END: FIXED FALLBACK BLOCK ]]
        end

        -- This is part of your NEW logic.
        return nil
    end,
}