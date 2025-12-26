return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "PROTOCHIMERA",
    MIN_CREATURES = 50,
    MAX_CREATURES = 100,
    BASE_CREATURE_NAME_PREFIX = "protochimera ID",
    OUTPUT_FILENAME = "generated_protochimera_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "protochimera",
    TRANSCENDENT_NAME_ROOT_PLURAL = "protochimeras",

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
        { name = "component_sub_archetype", table_key = "procgen_table_sub_archetype" },
        { name = "component_1", table_key = "procgen_addon_table_1" },
        { name = "component_2", table_key = "procgen_addon_table_2" },
        { name = "component_3", table_key = "procgen_addon_table_3" },
        { name = "component_4", table_key = "procgen_addon_table_4" },
		},

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_CLASS:PROTOCHIMERA]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
        

    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]
            [COLOR:7:0:1]

        [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
		
        [SELECT_TISSUE_LAYER:HEART:BY_CATEGORY:HEART]
        [PLUS_TISSUE_LAYER:SKIN:BY_CATEGORY:THROAT]
            [TL_MAJOR_ARTERIES]
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [USE_MATERIAL_TEMPLATE:SINEW:SINEW_TEMPLATE]
        [TENDONS:LOCAL_CREATURE_MAT:SINEW:200]
        [LIGAMENTS:LOCAL_CREATURE_MAT:SINEW:200]
        [HAS_NERVES]
        [USE_MATERIAL_TEMPLATE:BLOOD:ICHOR_TEMPLATE]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
        [CREATURE_CLASS:GENERAL_POISON]
        [GETS_WOUND_INFECTIONS]
        [GETS_INFECTIONS_FROM_ROT]
        [USE_MATERIAL_TEMPLATE:PUS:PUS_TEMPLATE]
        [PUS:LOCAL_CREATURE_MAT:PUS:LIQUID]
		
			
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [ALL_ACTIVE]
    ]],

    COMMON_APPEARANCE_RAWS = [[
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:WHITE:1:CLEAR:1:MOTTLED_WHITE_CLEAR:1]
                [TLCM_NOUN:skin:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:60:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Protochimeras are basal, irregular organisms said to originate from the runoff of the early Transitional Era, their simplistic and amorphous forms belying appreciable fitness and tenacity. Capable of feeding on soft synthetics like plastic and polymer as much as biomass, their populations bloom and shrink in accordance with the bounty of the megastructures, and are a perpetual bane to those developed civilizations that would rend them open to plumb their depths. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
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
            [FREQUENCY:5]
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
            [LARGE_PREDATOR][CRAZED][AMBUSHPREDATOR]
            
            [CREATURE_CLASS:DANGEROUS]
            ]]},
            tags = {"DANGEROUS"},
            weight = 5,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS][PRONE_TO_RAGE]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 25,
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
            weight = 40,
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
            [CREATURE_CLASS:VERMIN]
            ]]},
            tags = {"VERMIN"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
            [CREATURE_CLASS:AMBIENT]
            ]]},
            tags = {"AMBIENT"},
            weight = 10,
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
		[SMALL_REMAINS][VERMIN_HATEABLE][VERMIN_SOIL]
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
            [FISHITEM]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[VERMIN_SOIL]
		]]},
        weight = 10,
        enabled = true
    },
    {
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 0,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"SMALL"},
        tok = {[[
            [FISHITEM]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
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
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'p'][CREATURE_CLASS:SIZE_LESSER]
		
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
        favored_size_multiplier_enabled = true,
        tok = {[[
		[CREATURE_TILE:'p'][CREATURE_CLASS:SIZE_MEDIUM]
		
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
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "PROBLEMATIC"},
        size_tags = {"LARGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'P'][CREATURE_CLASS:SIZE_LARGE]
		
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
        body_size_index_and_child_count = 20,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "EXISTENTIAL"},
        size_tags = {"HUGE"},
        weight = 10,
        tok = {[[
		[CREATURE_TILE:'P'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[CREATURE_CLASS:HUGEHEAD]
		[CREATURE_CLASS:HUGEARMS]
		[CREATURE_CLASS:HUGESHOULDERS]
		[CREATURE_CLASS:HUGEHIPS]
		[CREATURE_CLASS:HUGELEGS]
		[CREATURE_CLASS:HUGEBODY]
		]]},
        enabled = true
    },
    {
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100000,
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 30,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "EXISTENTIAL"},
        size_tags = {"GIANT"},
        weight = 5,
        tok = {[[
		[CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_GIANT]
		
		[CREATURE_CLASS:GIANTHEAD]
		[CREATURE_CLASS:GIANTARMS]
		[CREATURE_CLASS:GIANTSHOULDERS]
		[CREATURE_CLASS:GIANTHIPS]
		[CREATURE_CLASS:GIANTLEGS]
		[CREATURE_CLASS:GIANTBODY]
		]]},
        enabled = true
    },
    {
        name_part = "TTN",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1000000,
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 40,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"TITANIC"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_TITANIC]
		
		[CREATURE_CLASS:TITANICHEAD]
		[CREATURE_CLASS:TITANICARMS]
		[CREATURE_CLASS:TITANICSHOULDERS]
		[CREATURE_CLASS:TITANICHIPS]
		[CREATURE_CLASS:TITANICLEGS]
		[CREATURE_CLASS:TITANICBODY]
		]]},
        enabled = false
    }
    },
	
	
    procgen_table_sub_archetype = {
    {
        body_token = "",
        desc_part = "_______________________________________________________ __________/TYPE = A biological organism with pallid, half-transparent skin showing pulsing organs and veins underneath, the product of irregular and desperate genetic recombination and the erratic biomass of the megastructures left unculled. _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		attribute_weight = { 
		STRENGTH = "-", 
		AGILITY = "--", 
		TOUGHNESS = "+", 
		RECUPERATION = "+", 
		DISEASE_RESISTANCE = "+++",
		SPATIAL_SENSE = "-", 
		INTUITION = "--"
		},
		sub_archetype = {"PROTO"},
        tok = {
		[[
		
		]]
		}, 
        weight = 50
       
    }
    },
	
	

    procgen_addon_table_1 = {
          {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has an oval-like shape with a slim, spine-like tail. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
		  [AQUATIC][UNDERSWIM][IMMOBILE_LAND][UBIQUITOUS]
		  [BIOME:SUBTERRANEAN_WATER][BIOME:ANY_LAKE][BIOME:ANY_RIVER][BIOME:ANY_OCEAN][BIOME:ANY_POOL]
			[UNDERGROUND_DEPTH:0:3]
			]]
			}, 
        weight = 10, 
		next_tables = {"procgen_subchart_table_1_1"} 
    },
    {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has a flattened teardrop-like shape with a thick, tapering tail. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
		  [AQUATIC][UNDERSWIM][IMMOBILE_LAND][UBIQUITOUS]
		  [BIOME:SUBTERRANEAN_WATER][BIOME:ANY_LAKE][BIOME:ANY_RIVER][BIOME:ANY_OCEAN][BIOME:ANY_POOL]
			[UNDERGROUND_DEPTH:0:3]
			]]
			}, 
        weight = 10, 
		next_tables = {"procgen_subchart_table_1_1"} 
    },
    {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has a rounded teardrop-like shape with a thick, tapering tail. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
		  [AQUATIC][UNDERSWIM][IMMOBILE_LAND][UBIQUITOUS]
		  [BIOME:SUBTERRANEAN_WATER][BIOME:ANY_LAKE][BIOME:ANY_RIVER][BIOME:ANY_OCEAN][BIOME:ANY_POOL]
			[UNDERGROUND_DEPTH:0:3]
			]]
			}, 
        weight = 10, 
		next_tables = {"procgen_subchart_table_1_1"} 
    },
    {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has a rounded elongated shape. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		  [AMPHIBIOUS]
		 [BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			]]
			}, 
        weight = 10, 
		next_tables = {"procgen_subchart_table_1_2"} 
    },
    {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has a flattened elongated shape. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
		  [AMPHIBIOUS]
		 [BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			]]
			}, 
        weight = 10, 
		next_tables = {"procgen_subchart_table_1_2"} 
    },
    {
        body_token = "BASIC_2PARTBODY:",
        desc_part = "It is ribbed with fleshy segments and has a fat, grub-like shape. ",
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		  [AMPHIBIOUS]
		 [BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			]]
			}, 
        weight = 20, 
		next_tables = {"procgen_subchart_table_1_3"} 
    }
    },
	
    procgen_addon_table_2 = {
          {
        body_token = "BASIC_HEAD:2LUNGS:HEART:GUTS:ORGANS:SPINE:BRAIN:",
        desc_part = "It has a neckless head at the front of its body. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
			]]
			}, 
        weight = 10
    },
    {
        body_token = "BASIC_HEAD_NECK:2LUNGS:HEART:GUTS:ORGANS:SPINE:BRAIN:",
        desc_part = "It has a shapeless head on the end of a short neck at the front of its body. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
			]]
			}, 
        weight = 10
    },
    {
        body_token = "BASIC_HEAD_NECK:2LUNGS:HEART:GUTS:ORGANS:SPINE:BRAIN:",
        desc_part = "It has a shapeless head on the end of a long neck at the front of its body. ",
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			]]
			}, 
        weight = 10
    }
    },
	
    procgen_addon_table_3 = {
          {
        body_token = "MOUTH",
        desc_part = "Its mouth is a simple gawping hole, and ",
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
			]]
			}, 
        weight = 50
    },
    {
        body_token = "MOUTH",
        desc_part = "Its mouth is a curling proboscis, and ",
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
			]]
			}, 
        weight = 50
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open horizontally to reveal two fleshy petal-like jaws with multiple rows of blunt teeth, and ",
        eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open vertically to reveal two fleshy petal-like jaws with multiple rows of blunt teeth, and ",
        eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open trilaterally to reveal three fleshy petal-like jaws with multiple rows of blunt teeth, and ",
        eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open quadrilaterally to reveal four fleshy petal-like jaws with multiple rows of blunt teeth, and ",
        eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open quintilaterally to reveal five fleshy petal-like jaws with multiple rows of blunt teeth, and ",
        eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open horizontally to reveal two fleshy petal-like jaws with multiple rows of sharp teeth, and ",
        eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open vertically to reveal two fleshy petal-like jaws with multiple rows of sharp teeth, and ",
        eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open trilaterally to reveal three fleshy petal-like jaws with multiple rows of sharp teeth, and ",
        eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open quadrilaterally to reveal four fleshy petal-like jaws with multiple rows of sharp teeth, and ",
        eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    },
    {
        body_token = "MOUTH:TEETH",
        desc_part = "Its head splits open quintilaterally to reveal five fleshy petal-like jaws with multiple rows of sharp teeth, and ",
        eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
		[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			]]
			}, 
        weight = 10
    }
    },
	
    procgen_addon_table_4 = {
          {
        body_token = "",
        desc_part = "it lacks any eyes, relying on its other senses to perceive the environment. ",
        eligible_rating_tags = {"BENIGN", "HAZARDOUS", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			]]
			}, 
        weight = 50
    },
          {
        body_token = "",
        desc_part = "it has clusters of small, round black eyes all around its head. ",
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN", "DANGEROUS"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
		[EXTRAVISION]
			]]
			}, 
        weight = 30
    },
          {
        body_token = "",
        desc_part = "it has clusters of large, round black eyes all around its head. ",
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN", "DANGEROUS"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
		[EXTRAVISION]
        [LOW_LIGHT_VISION:10000]
			]]
			}, 
        weight = 20
    }
    },
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
        procgen_subchart_table_1_1 = {
            {     
                body_token = "SIDE_FINS:", 
                desc_part = "It has a pair of ribbed, narrow membraneous fins on its sides. ",
                eligible_rating_tags = {"AMBIENT"},
				eligible_size_tags = {"MINIMAL", "SMALL"}, 
                tok = {[[
					[CREATURE_TILE:224]
                   [VERMIN_FISH]
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "SIDE_FINS:", 
                desc_part = "It has a pair of ribbed, broad membraneous fins on its sides. ",
                eligible_rating_tags = {"AMBIENT"},
				eligible_size_tags = {"MINIMAL", "SMALL"}, 
                tok = {[[
					[CREATURE_TILE:224]
                   [VERMIN_FISH]
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
                ]]},
                weight = 30 
            },
            {     
                body_token = "SIDE_FINS:", 
                desc_part = "It has a pair of ribbed, elongated membraneous fins on its sides. ",
                eligible_rating_tags = {"AMBIENT"},
				eligible_size_tags = {"MINIMAL", "SMALL"}, 
                tok = {[[
					[CREATURE_TILE:224]
                   [VERMIN_FISH]
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:750:600:439:1900:2900] 20 kph
                ]]},
                weight = 30 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, narrow fleshy fins on its sides. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, broad fleshy fins on its sides. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
                ]]},
                weight = 30 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, elongated fleshy fins on its sides. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:750:600:439:1900:2900] 20 kph
                ]]},
                weight = 20 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, narrow fleshy fins on its sides and another on its back. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:711:521:293:1900:2900] 30 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, broad fleshy fins on its sides and another on its back. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:657:438:219:1900:2900] 40 kph
                ]]},
                weight = 30 
            },
            {
                body_token = "SIDE_FINS:DORSAL_FIN:", 
                desc_part = "It has a pair of ribbed, elongated fleshy fins on its sides and another on its back. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				   [APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:528:352:176:1900:2900] 50 kph
                ]]},
                weight = 20 
            }
            },
	
        procgen_subchart_table_1_2 = {
            {     
                body_token = "", 
                desc_part = "It is limbless, locomoting by squirming on the ground. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"MINIMAL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER][VERMIN_SOIL][BIOME:ANY_LAND]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:9000:8900:8825:8775:9500:9900] 1 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "It is limbless, locomoting by squirming on the ground. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER][VERMIN_SOIL][BIOME:ANY_LAND]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "BASIC_LEGS:", 
                desc_part = "It has a pair of short but muscular pillar-like legs. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "BASIC_LEGS:", 
                desc_part = "It has a pair of short but muscular pillar-like legs near the front of its body. ",
                eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:3512:2634:1756:878:4900:6900] 10 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "It has two rows of long, narrow boneless legs that move like spasming tubes. ",
                eligible_rating_tags = {"PROBLEMATIC", "BENIGN", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "", 
                desc_part = "It has two rows of short, small boneless legs that crawl along the ground. ",
                eligible_rating_tags = {"PROBLEMATIC", "BENIGN", "HAZARDOUS", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:750:600:439:1900:2900] 20 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "", 
                desc_part = "It has two rows of short, thick boneless legs that can propel it with surprising swiftness. ",
                eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "2WINGS:", 
                desc_part = "It has two membraneous, ribbed wings which it uses for ungainly flight. ",
                eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
					[FLIER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                  	[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
                ]]},
                weight = 20 
            },
            {
                body_token = "4WINGS:", 
                desc_part = "It has four membraneous, ribbed wings which it uses for swift but ungainly flight. ",
                eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
					[FLIER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                  	[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:657:438:219:1900:2900] 40 kph
                ]]},
                weight = 20 
            },
            {
                body_token = "2WINGS:", 
                desc_part = "It has two fleshy, triangular wings which it uses for languid, gliding flight. ",
                eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
					[FLIER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                  	[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:711:521:293:1900:2900] 30 kph
                ]]},
                weight = 20 
            }
            },
	
        procgen_subchart_table_1_3 = {
          
            {     
                body_token = "", 
                desc_part = "It is limbless, locomoting by squirming on the ground. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"MINIMAL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER][VERMIN_SOIL]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:9000:8900:8825:8775:9500:9900] 1 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "It is limbless, locomoting by squirming on the ground. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "BASIC_LEGS:", 
                desc_part = "It has a pair of short but muscular pillar-like legs. ",
                eligible_rating_tags = {"AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL"}, 
                tok = {[[
					[CREATURE_TILE:126]
                   [VERMIN_GROUNDER]
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
                ]]},
                weight = 50 
            },
            {     
                body_token = "BASIC_LEGS:", 
                desc_part = "It has a pair of short but muscular pillar-like legs near the front of its body. ",
                eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:3512:2634:1756:878:4900:6900] 10 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "", 
                desc_part = "It has two rows of short, small boneless legs that crawl along the ground. ",
                eligible_rating_tags = {"PROBLEMATIC", "BENIGN", "HAZARDOUS", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:750:600:439:1900:2900] 20 kph
                ]]},
                weight = 50 
            },
            {
                body_token = "", 
                desc_part = "It has two rows of short, thick boneless legs that can propel it with surprising swiftness. ",
                eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
                  	[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:657:438:219:1900:2900] 40 kph
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:PROTOCHIMERA_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:PROTOCHIMERA_MALE]
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:PROTOCHIMERA_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:PROTOCHIMERA_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
			eligible_rating_tags = {"BENIGN", "AMBIENT", "VERMIN", "HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "HOSTILE", "SOPHONT", "EXISTENTIAL"},
			eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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