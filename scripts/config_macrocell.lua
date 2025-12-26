
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "MACROCELL",
    MIN_CREATURES = 50,
    MAX_CREATURES = 200,
    BASE_CREATURE_NAME_PREFIX = "macrocell ID",
    OUTPUT_FILENAME = "generated_macrocell_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "macrocell",
    TRANSCENDENT_NAME_ROOT_PLURAL = "macrocells",

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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_CLASS:MACROCELL]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [UBIQUITOUS]
		[ALL_ACTIVE]

    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]
	[BODY_DETAIL_PLAN:MACROCELL_MATERIALS]
	[BODY_DETAIL_PLAN:MACROCELL_TISSUES]
	[BODY_DETAIL_PLAN:MACROCELL_TISSUE_LAYERS:FAT:MUSCLE:SHELL]
	[BODY_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
	[ALL_ACTIVE]
	[NO_DRINK]
	[NO_DIZZINESS]
	[NO_FEVERS]
	[SWIMS_INNATE]
	

    ]],

    COMMON_APPEARANCE_RAWS = [[
			
	[SET_TL_GROUP:BY_CATEGORY:ALL:FAT]
		[TL_COLOR_MODIFIER:CLEAR:1]
			[TLCM_NOUN:protoplasm:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1]
			[TLCM_NOUN:core:SINGULAR]
		
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Macrocells are single-celled organisms which use N-matter-derived fuel and materials to sustain their impossible sizes, existing in the most extreme environments in the Solar System through their temperature-resistant bodies. Though many can be nuisances, their fluids make for precious fuel even in the most undeveloped areas of the Solar System. _______________________________________________________ __________",
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
            enabled = true,
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
            enabled = false,
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
        eligible_rating_tags = {"AMBIENT", "AMBIENT"},
        size_tags = {"MICRO"},
        tok = {[[
		[VERMIN_MICRO]
		[SMALL_REMAINS][VERMIN_HATEABLE][VERMIN_SOIL]
		]]},
        weight = 10,
        enabled = true
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
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE][VERMIN_SOIL]
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
			eligible_rating_tags = {"AMBIENT", "AMBIENT"},
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
            [CREATURE_TILE:111][CREATURE_CLASS:SIZE_LESSER]
            
				[CLUSTER_NUMBER:1:20]
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
            eligible_rating_tags = {"HAZARDOUS", "BENIGN"},
            size_tags = {"MEDIUM"}, 
            weight = 50, 
            tok = {[[
           
        [CREATURE_TILE:'o']
        [CREATURE_CLASS:SIZE_MEDIUM]
            
            [CREATURE_CLASS:NORMALHEAD]
            [CREATURE_CLASS:NORMALARMS]
            [CREATURE_CLASS:NORMALSHOULDERS]
            [CREATURE_CLASS:NORMALHIPS]
            [CREATURE_CLASS:NORMALLEGS]
            [CREATURE_CLASS:NORMALBODY]
				[CLUSTER_NUMBER:1:10]
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
            [CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_LARGE]
            
            [CREATURE_CLASS:LARGEHEAD]
            [CREATURE_CLASS:LARGEARMS]
            [CREATURE_CLASS:LARGESHOULDERS]
            [CREATURE_CLASS:LARGEHIPS]
            [CREATURE_CLASS:LARGELEGS]
            [CREATURE_CLASS:LARGEBODY]
				[CLUSTER_NUMBER:1:5]
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
            [CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            [SAVAGE]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
				[CLUSTER_NUMBER:1:2]
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
            [CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_GIANT]
            [SAVAGE]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
				[CLUSTER_NUMBER:1:1]
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
            [CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = true
        }
    },

    procgen_addon_table_1 = {
     
        {
            body_token = "BODY_HEAD:NUCLEUS:",
            desc_part = "_______________________________________________________ __________/TYPE = A gelatinous amoeboid with translucent skin and a core that glows with faint, pulsing light. It has a thin membrane with an exterior that shifts and ripples as it moves. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL"},   
		attribute_weight = { 
		RECUPERATION = "+", 
		KINESTHETIC_SENSE = "--", 
		SPATIAL_SENSE = "--"
		},
            tok = {[[
			[COLOR:7:0:0]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:ANY_WETLAND]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
			
				
			]]}, 
            weight = 100,
		next_tables = {"procgen_subchart_table_body_basic"}
        },
        {
            body_token = "BODY_HEAD:NUCLEUS",
            desc_part = "_______________________________________________________ __________/TYPE = A gelatinous amoeboid with translucent skin and a core that glows with faint, pulsing light. It has evolved to survive in the void of space and the coldest parts of the Megastructures using a thick, semi-opaque membrane. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"},  
		attribute_weight = { 
		ENDURANCE = "++", 
		KINESTHETIC_SENSE = "--", 
		SPATIAL_SENSE = "--"
		},
            tok = {[[
			[COLOR:1:0:1]
			[BIOME:TUNDRA]
			[BIOME:GLACIER]
			[BIOME:MOUNTAIN]
			
			]]}, 
            weight = 50,
		next_tables = {"procgen_subchart_table_body_cold"}
        },
        {
            body_token = "BODY_HEAD:NUCLEUS",
            desc_part = "_______________________________________________________ __________/TYPE = A gelatinous amoeboid with translucent skin and a core that glows with faint, pulsing light. It has evolved to survive in aquatic environments, with muscle-like organelles that pulse rhythmically to propel it through the water. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"},  
		attribute_weight = { 
		AGILITY = "-", 
		STRENGTH = "-", 
		KINESTHETIC_SENSE = "--", 
		SPATIAL_SENSE = "--"
		},
            tok = {[[
			[COLOR:7:0:0]
			[BIOME:ANY_OCEAN][BIOME:ANY_LAKE][BIOME:ANY_RIVER]
			[BIOME:SUBTERRANEAN_CHASM][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
			
			[AQUATIC][UNDERSWIM][IMMOBILE_LAND][SWIMS_INNATE]
			]]}, 
            weight = 50,
		next_tables = {"procgen_subchart_table_body_water"}
        },
        {
            body_token = "BODY_HEAD:NUCLEUS",
            desc_part = "_______________________________________________________ __________/TYPE = A gelatinous amoeboid with translucent skin and a core that glows with faint, pulsing light. It has evolved to survive environments with extremely high heat, and is covered in airtight scutes and spines of corroded metallic black carapace. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"},  
		attribute_weight = { 
		TOUGHNESS = "++", 
		KINESTHETIC_SENSE = "--", 
		SPATIAL_SENSE = "--"
		},
            tok = {[[
			[BIOME:SUBTERRANEAN_LAVA]
			[UNDERGROUND_DEPTH:4:4]
			[COLOR:0:0:1][FIREIMMUNE_SUPER][MAGMA_VISION]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:exterior shell:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
			
			]]}, 
            weight = 100,
		next_tables = {"procgen_subchart_table_body_hot"}
        }
    },
	
	   procgen_addon_table_2 = {
    
			{
                body_token = "",
                desc_part = "It lacks a mouth, absorbibng trace nutrients from the surface it crawls on. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
			
				]]},  
                weight = 50
            },
			{
                body_token = ":MOUTH",
                desc_part = "It has distinct mouth orifice which can split open to engulf and crush prey or other hard-to-digest objects. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 25
            },
            {
                body_token = ":BEAK",
                desc_part = "It has a beak-like mouth of two smooth plates of hardened membrane, acting like a pair of shears. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				
	[ATTACK:STING:BODYPART:BY_CATEGORY:BEAK]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:20]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
		[ATTACK_FLAG_CANLATCH]
				]]}, 
                weight = 50
            },
            {
                body_token = ":BEAK",
                desc_part = "It has a beak-like mouth of hardened membrane constructed out of many fused quills of hardened membrane, leaving torn and ragged marks on anything it sinks into. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"}, 
				tok = {[[ 
				
	[ATTACK:STING:BODYPART:BY_CATEGORY:BEAK]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:20]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
		[ATTACK_FLAG_CANLATCH]
				]]}, 
                weight = 50
			}
    },
	
	
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
        procgen_subchart_table_body_basic = {		
			{
                body_token = "",
                desc_part = "It has an amorphous amoeboid shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            },		
			{
                body_token = "",
                desc_part = "It has a long, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            },
			{
                body_token = "",
                desc_part = "It has a fat, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            },
			{
                body_token = "",
                desc_part = "It has a semi-epsilloid shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            },
			{
                body_token = "",
                desc_part = "It has a semi-spherical shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            },
			{
                body_token = "",
                desc_part = "It has a droplet-like shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_basic"}
            }
		},
		
		
	
        procgen_subchart_table_body_cold = {		
			{
                body_token = "",
                desc_part = "It has an amorphous amoeboid shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            },		
			{
                body_token = "",
                desc_part = "It has a long, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            },
			{
                body_token = "",
                desc_part = "It has a fat, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            },
			{
                body_token = "",
                desc_part = "It has a semi-epsilloid shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            },
			{
                body_token = "",
                desc_part = "It has a semi-spherical shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            },
			{
                body_token = "",
                desc_part = "It has a droplet-like shape with a wide, flat bottom and a rounded top, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_cold"}
            }
		},
	
	
	
        procgen_subchart_table_body_water = {		
			{
                body_token = "",
                desc_part = "It has an amorphous amoeboid shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_water"}
            },		
			{
                body_token = "",
                desc_part = "It has a long, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_water"}
            },
			{
                body_token = "",
                desc_part = "It has a fat, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_water"}
            },
			{
                body_token = "",
                desc_part = "It has a semi-spherical shape with a wide, flat r and a rounded front, with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_water"}
            }
		},
	
	
	
        procgen_subchart_table_body_hot = {		
			{
                body_token = "",
                desc_part = "It has an amorphous amoeboid shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_hot"}
            },		
			{
                body_token = "",
                desc_part = "It has a long, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_hot"}
            },
			{
                body_token = "",
                desc_part = "It has a fat, wormlike shape, and ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50,
				next_tables = {"procgen_subchart_table_legs_hot"}
            }
		},
	
        procgen_subchart_table_legs_basic = {		
			{
                body_token = "",
                desc_part = "It is limbless, undulating across the ground. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP][CANNOT_CLIMB]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 50
            }
         
		},
	
	
        procgen_subchart_table_legs_cold = {		
			{
                body_token = "",
                desc_part = "It is limbless, undulating across the ground. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":4PSEUDOLEG",
                desc_part = "Four small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
		
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":6PSEUDOLEG",
                desc_part = "Six small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":8PSEUDOLEG",
                desc_part = "Eight small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            }
         
		},
	
	
        procgen_subchart_table_legs_water = {		
			{
                body_token = "",
                desc_part = "It is limbless, undulating through the water. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 100
            },
			{
                body_token = "",
                desc_part = "A core of tendrils trail behind it. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
		
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "A ring of tendrils trail about the edges of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It has a core of tendrils ringed by smaller ones at the edges of its body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				
				]]}, 
                weight = 50
            }
         
			},
	
	
        procgen_subchart_table_legs_hot = {		
			{
                body_token = "",
                desc_part = "It is limbless, undulating across the ground.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":4PSEUDOLEG",
                desc_part = "Four small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
		
				[APPLY_CREATURE_VARIATION:STANDARD_QUADRUPED_GAITS:900:711:521:293:1900:2900] 30 kph				
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":6PSEUDOLEG",
                desc_part = "Six small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
				]]}, 
                weight = 50
            },
			{
                body_token = ":8PSEUDOLEG",
                desc_part = "Eight small, short pseudopod-legs grow out from its sides, granting limited ambulation. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:MACROCELL_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:MACROCELL_MALE]
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
					[CASTE:CASTE1]
					[BODY:2PSEUDOARM]
					]],
                    description_addon = "A pair of pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2]
					[BODY:3PSEUDOARM]
					]],
                    description_addon = "Three pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3]
					[BODY:4PSEUDOARM]
					]],
                    description_addon = "Four pseudopod-arms emerge from its body. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1]
					[BODY:3PSEUDOARM]
					]],
                    description_addon = "Three pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2]
					[BODY:4PSEUDOARM]
					]],
                    description_addon = "Four pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3]
					[BODY:5PSEUDOARM]
					]],
                    description_addon = "Five pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4]
					[BODY:6PSEUDOARM]
					]],
                    description_addon = "Six pseudopod-arms emerge from its body. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1]
					[BODY:4PSEUDOARM]
					]],
                    description_addon = "Four pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2]
					[BODY:5PSEUDOARM]
					]],
                    description_addon = "Five pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3]
					[BODY:6PSEUDOARM]
					]],
                    description_addon = "Six pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4]
					[BODY:7PSEUDOARM]
					]],
                    description_addon = "Seven pseudopod-arms emerge from its body. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1]
					[BODY:5PSEUDOARM]
					]],
                    description_addon = "Five pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2]
					[BODY:6PSEUDOARM]
					]],
                    description_addon = "Six pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3]
					[BODY:7PSEUDOARM]
					]],
                    description_addon = "Seven pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4]
					[BODY:8PSEUDOARM]
					]],
                    description_addon = "Eight pseudopod-arms emerge from its body. "
                },
                {
                    tokens = [[
					[CASTE:CASTE5]
					[BODY:8PSEUDOARM]
					]],
                    description_addon = "Nine pseudopod-arms emerge from its body. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"HUGE", "GIANT"}, 
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