return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "NANOMACHINE",
    MIN_CREATURES = 50,
    MAX_CREATURES = 100,
    BASE_CREATURE_NAME_PREFIX = "nanomech ID",
    OUTPUT_FILENAME = "generated_nanomech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,
	
	FORCED_GENERATION_QUEUE = {
	
        { rating = "INCURSION", size = "TITANIC", sub_archetype = "CORRUPT", count = 1 },
		
        { rating = "INCURSION", size = "GIANT", sub_archetype = "CORRUPT", count = 3 },
	
        { rating = "AVATAR", size = "GIANT", sub_archetype = "PRISTINE", count = 2 },
		
        { rating = "AVATAR", size = "TITANIC", sub_archetype = "PRISTINE", count = 1 },
		
        { rating = "EXISTENTIAL", size = "GIANT", sub_archetype = "CORRUPT", count = 4 },
		
        { rating = "EXISTENTIAL", size = "TITANIC", sub_archetype = "CORRUPT", count = 2 },
		
        { rating = "VESSEL", size = "MEDIUM", sub_archetype = "CORRUPT", count = 5 },
        
    },

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "nanomech",
    TRANSCENDENT_NAME_ROOT_PLURAL = "nanomechs",

    TRAIT_NAME_MODIFIERS = {
        ["SOPHONT"] = "SPNT",
        ["HOSTILE"] = "HSTL", 
        ["VESSEL"] = "VSSL", 
        ["DEVIANT"] = "DVNT", 
        ["AVATAR"] = "AVTR", 
        ["INCURSION"] = "INCR",
		
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
        ["SERVANT"] = "SRVT", 
        ["HUNTER"] = "HNTR", 
        ["SANITATION"] = "SNTN", 
        ["PRODUCT"] = "PRDC", 
        ["COMPANION"] = "CMPN", 
        ["MILITARY"] = "MLTR"
    },

    COMPONENT_TABLES = {
        { name = "component_sub_archetype", table_key = "procgen_table_sub_archetype" }
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_CLASS:NANOMACHINE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        
		[NOBONES]
	
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

      	[BODY_DETAIL_PLAN:NANITE_MATERIALS]
		[BODY_DETAIL_PLAN:NANITE_TISSUES]
		[BODY_DETAIL_PLAN:NANITE_TISSUE_LAYERS:SKIN:MUSCLE:BONE:MUSCLE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
		
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
		
        [USE_MATERIAL_TEMPLATE:BLOOD:BLOOD_TEMPLATE]
		[STATE_COLOR:ALL:BLACK]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
		
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
		
		[AMPHIBIOUS]
		[LOW_LIGHT_VISION:10000]
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [NOCTURNAL]
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Nanomechanical N-life was one of the last to emerge within the technosystem, existing almost wholly beyond the comprehension of human science. Most are chaotic, decrepit entities, half-formed by complex processes which lack the proper environment to foster such novel phyla, leaving them erratic and ravenous. They are born of detritus, error, and delving into uncharted waters, their genesis dated to the most desperate time in the history of thinking beings, the gulf between the teeming failures and those rare few successes unfathomably vast. But even so, their transmutative power continues to tempt those who would seek unorthodox ascendance. _______________________________________________________ __________" ,
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER][BIOME:ANY_RIVER]
            
            [CREATURE_CLASS:SOPHONT]            [COLOR:3:0:0]

                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
			[BIOME:ANY_LAND]
					
            ]]},
            tags = {"SOPHONT"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
			            [COLOR:1:0:0]
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
			[SAVAGE]
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
            [FREQUENCY:1]
			[SPOUSE_CONVERTER]
			[CONVERTED_SPOUSE]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY2]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
			
            ]]},
            tags = {"HOSTILE"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
			            [COLOR:1:0:0]
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
			[SAVAGE]
            
			[LARGE_PREDATOR]
            [CREATURE_CLASS:EXISTENTIAL]
			[BIOME:ANY_LAND]	
            [LAIR:SIMPLE_BURROW:50]
            [LAIR:SIMPLE_MOUND:50]
            [LAIR:LABYRINTH:25]
            [LAIR:SHRINE:25]
            [HABIT:COLLECT_TROPHIES:50]
            [HABIT:COLLECT_WEALTH:50]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY2]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as an Incursion, the instantiation of a hyperintelligence of the deep Datasphere, the remnant of the predatory pseudosingularities that threatened to consume the solar system. ",
            tok = {[[
			            [COLOR:1:0:0][NIGHT_CREATURE_EXPERIMENTER]
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
            
			[LARGE_PREDATOR]
            [CREATURE_CLASS:INCURSION]
			[SPHERE:BLIGHT]
			[SPHERE:DEATH]
			[SPHERE:MURDER]
			[SPHERE:TWILIGHT]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY2]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
            ]]},
            tags = {"INCURSION"},
            weight = 1,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
			            [COLOR:1:0:0]
            [LARGE_PREDATOR][CRAZED][AMBUSHPREDATOR]
            
            [CREATURE_CLASS:DANGEROUS]
            [FREQUENCY:10]
			[SAVAGE]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"DANGEROUS"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
			            [COLOR:1:0:0]
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS]
            [FREQUENCY:20]
			[SAVAGE]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 30,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
			            [COLOR:1:0:0]
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
            [FREQUENCY:50]
			[SAVAGE]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"BENIGN"},
            weight = 0,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
			            [COLOR:1:0:0]
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
            [FREQUENCY:30]
			[SAVAGE]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 30,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vermin; it is very small but can infest settlements or otherwise inconvenience other organisms. ",
            tok = {[[
			            [COLOR:1:0:0]
            [FISHITEM]
            [CREATURE_CLASS:VERMIN]
            [FREQUENCY:100]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"VERMIN"},
            weight = 0,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
			            [COLOR:1:0:0]
            [FISHITEM]
            [CREATURE_CLASS:AMBIENT]
            [FREQUENCY:100]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"AMBIENT"},
            weight = 0,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Deviant; it is an intelligent being capable of reason and metacognition, but has abandoned or lost human values and psychology in favor of competitiveness within the technosystem. ",
				attribute_weight = { 
				WILLPOWER = "+", 
				INTUITION = "+", 
				TOUGHNESS = "+", 
				ENDURANCE = "+", 
				SOCIAL_AWARENESS = "--", 
				EMPATHY = "--", 
				LINGUISTIC_ABILITY = "--", 
				MUSICALITY = "---"
				},
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER][BIOME:ANY_RIVER]
            
            [CREATURE_CLASS:DEVIANT]            [COLOR:3:0:0]
			[BIOME:ANY_LAND]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]

            ]]},
            tags = {"DEVIANT"},
            weight = 15,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as an Avatar; it is a host body of a powerful hyperintelligence of the Datasphere or a sophont that ascended to that level. ",
            tok = {[[
            [INTELLIGENT][CANOPENDOORS]
            [CREATURE_CLASS:AVATAR]            [COLOR:3:0:0][NIGHT_CREATURE_EXPERIMENTER]
			[BIOME:ANY_LAND]	
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]

            ]]},
            tags = {"AVATAR"},
            weight = 1,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Vessel; it is a node of a distributed system or intelligence, bound to the will of its creator. ",
				attribute_weight = { 
				CREATIVITY = "----", 
				SOCIAL_AWARENESS = "----", 
				EMPATHY = "----", 
				LINGUISTIC_ABILITY = "----", 
				MUSICALITY = "----",
				WILLPOWER = "+++",
				},
            tok = {[[
            [CAN_LEARN][EQUIPS][CANOPENDOORS]
            
            [CREATURE_CLASS:VESSEL][EVIL][NO_EAT][NO_DRINK]            [COLOR:3:0:0]
			[BIOME:ANY_LAND]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]

            ]]},
            weight = 2,
            tags = {"VESSEL"},
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Domestic; it will keep the area clean of vermin and provide comfort, but offers no special services. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN]
			[GOBBLE_VERMIN_CLASS:VERMIN]
			[GOBBLE_VERMIN_CLASS:AMBIENT]
            [CREATURE_CLASS:DOMESTIC]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"DOMESTIC"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Companion; it offers no benefits save comfort. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN]
            [HUNTS_VERMIN]
            [CREATURE_CLASS:DOMESTIC]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"DOMESTIC"},
            weight = 5,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vehicular; it is optimized for being used as a means of transport, sacrificing carrying capacity for speed and maneuverability. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN][MOUNT]
            [CREATURE_CLASS:VEHICULAR]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"VEHICLE"},
            weight = 20,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Carrier; a form optimized for hauling goods, but unsuited for riding. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN][PACK_ANIMAL]
            [CREATURE_CLASS:CARRIER]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"CARRIER"},
            weight = 40,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Nomadic; it can easily serve as a vehicle or a carrier type, though it lacks the agility of a true vehicular form or the cargo capacity of a dedicated hauler. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN][MOUNT][PACK_ANIMAL]
            [CREATURE_CLASS:NOMAD]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"NOMAD"},
            weight = 20,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Weapon; it can be trained for war and hunting. ",
            tok = {[[ [COLOR:1:0:0]
            [TRAINABLE][NOFEAR]
            [CREATURE_CLASS:WEAPON]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"WEAPON"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Military; it is a thing made solely for combat. ",
            tok = {[[ [COLOR:1:0:0]
            [TRAINABLE_WAR][NOFEAR]
            [CREATURE_CLASS:WEAPON]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"WEAPON"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Servant; it has sub-sophont intelligence but is capable of thinking critically and solving complex tasks, and can be used for both labor and combat. ",
            tok = {[[ [COLOR:1:0:0]
            [EQUIPS][CAN_LEARN][CANOPENDOORS]
            [CREATURE_CLASS:SERVANT]
			

                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
			
            ]]},
            tags = {"SERVANT"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Hunter; it is used by foragers and trackers to aid them in bringing down prey, but not in open conflicts. ",
            tok = {[[ [COLOR:1:0:0]
            [TRAINABLE_HUNTING][BENIGN]
            [CREATURE_CLASS:HUNTER]
            ]]},
            tags = {"HUNTER"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sanitation; it is exceedingly efficient at removing vermin from a settlement. ",
            tok = {[[ [COLOR:1:0:0]
            [HUNTS_VERMIN][BENIGN]
			[GOBBLE_VERMIN_CLASS:VERMIN]
			[GOBBLE_VERMIN_CLASS:AMBIENT]
            [CREATURE_CLASS:SANITATION]
	
	[CAN_DO_INTERACTION:CLEANING]
		[CDI:ADV_NAME:Clean]
		[CDI:USAGE_HINT:CLEAN_FRIEND]
		[CDI:VERB:clean:cleans:clean each other]
		[CDI:TARGET:A:SELF_ALLOWED:TOUCHABLE]
		[CDI:TARGET_RANGE:A:1]
		[CDI:MAX_TARGET_NUMBER:A:1]
		[CDI:WAIT_PERIOD:120]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
			
            ]]},
            tags = {"SANITATION"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Product; it produces something useful for the settlement. ",
            tok = {[[ [COLOR:1:0:0]
            [BENIGN]
            [CREATURE_CLASS:PRODUCT]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"PRODUCT"},
            weight = 10,
            enabled = false
        }
    },

    generic_body_size_variants = {
    {
        name_part = "MCR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"MICRO"},
			gaits = { 
        STANDARD_BIPED_GAITS = 1, 
        STANDARD_CRAWLING_GAITS = 1, 
        STANDARD_CLIMBING_GAITS = 1, 
        STANDARD_SWIMMING_GAITS = 1
			},
        tok = {[[
		[VERMIN_MICRO]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
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
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"MINIMAL"},
			gaits = { 
        STANDARD_BIPED_GAITS = 1, 
        STANDARD_CRAWLING_GAITS = 1, 
        STANDARD_CLIMBING_GAITS = 1, 
        STANDARD_SWIMMING_GAITS = 1
			},
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
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"SMALL"},
			gaits = { 
        STANDARD_BIPED_GAITS = 1, 
        STANDARD_CRAWLING_GAITS = 1, 
        STANDARD_CLIMBING_GAITS = 1, 
        STANDARD_SWIMMING_GAITS = 1
			},
        tok = {[[
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:249]
		]]},
        weight = 10,
        enabled = false
    },
    {
        name_part = "LSR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"PROBLEMATIC", "DOMESTIC", "HUNTER", "PRODUCT", "SANITATION", "COMPANION" },
        size_tags = {"LESSER"},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:252][CREATURE_CLASS:SIZE_LESSER]
		
		]]},
        weight = 30,
        enabled = true
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DEVIANT", "VESSEL", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS", "CARRIER", "HUNTER", "WEAPON", "SERVANT", "SANITATION", "PRODUCT"},
        size_tags = {"MEDIUM"},
        weight = 50,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'n'][CREATURE_CLASS:SIZE_MEDIUM]
		
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
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "PROBLEMATIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "SERVANT", "PRODUCT"},
        size_tags = {"LARGE"},
        weight = 30,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_LARGE]
		
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
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "NOMAD", "VEHICLE", "CARRIER", "SERVANT", "PRODUCT", "MILITARY"},
        size_tags = {"HUGE"},
        weight = 19,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_HUGE]
		
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
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "HAZARDOUS", "AVATAR", "NOMAD", "CARRIER", "MILITARY"},
        size_tags = {"GIANT"},
        weight = 1,
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
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
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "AVATAR"},
        size_tags = {"TITANIC"},
        weight = 1,
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 5, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
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
        desc_part = "_______________________________________________________ __________/TYPE = A postbiological life form comprised of nanomachine colonies united in the manner of multicellular organisms. It has tarry, glistening flesh enfolded by a thick, metallic, skin-like integument, veins pulsing just below its surface. This variant is the most virulent and sustainable phylum of nanomachine life, but even then struggles with the high metabolism of its ever-shifting form. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "VERMIN" },
        eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"CORRUPT"},
			attribute_weight = { 
			STRENGTH = "+", 
			WILLPOWER = "++", 
			EMPATHY = "+", 
			LINGUISTIC_ABILITY = "-", 
			FOCUS = "-",
			MEMORY = "--", 
			ANALYTICAL_ABILITY = "-"
			  },
        tok = {
		[[
		[CREATURE_CLASS:NANOMACHINE_CORRUPT]
		
			[PHYS_ATT_RANGE:STRENGTH:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:AGILITY:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:ENDURANCE:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:TOUGHNESS:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:RECUPERATION:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:DISEASE_RESISTANCE:700:1200:1400:1500:1600:1800:2500]    ++
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:GRAY:1]
                [TLCM_NOUN:integument:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
			
		]]
		}, 
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'x'] ",
             ["MEDIUM"] = "[CASTE_TILE:'x'] ",
             ["LARGE"] = "[CASTE_TILE:'X'] ",
             ["HUGE"] = "[CASTE_TILE:'X'] ",
             ["GIANT"] = "[CASTE_TILE:'X'] ",
             ["TITANIC"] = " [CASTE_TILE:'X'] "
        },
        weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_body"
		}
    },
    {
        body_token = "",
        desc_part = "_______________________________________________________ __________/TYPE = A postbiological life form comprised of nanomachine colonies united in the manner of multicellular organisms. It has tarry, glistening flesh covered by a shimmering, reflective integument. This variant emerged from esoteric experiments on N-matter, creating a branch of posthumanity which ruled great swathes of the solar system in the days of the Fade. _______________________________________________________ __________/DESC = ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"PRISTINE"},
			attribute_weight = { 
			CREATIVITY = "+", 
			SOCIAL_AWARENESS = "++", 
			EMPATHY = "+", 
			LINGUISTIC_ABILITY = "+", 
			MEMORY = "-", 
			AGILITY = "++"
			  },
        tok = {
		[[
		[CREATURE_CLASS:NANOMACHINE_PRISTINE]
		
			[PHYS_ATT_RANGE:AGILITY:5000:5000:5000:5000:5000:5000:5000]              max
			[PHYS_ATT_RANGE:STRENGTH:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:AGILITY:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:ENDURANCE:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:TOUGHNESS:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:RECUPERATION:700:1200:1400:1500:1600:1800:2500]    ++
			[PHYS_ATT_RANGE:DISEASE_RESISTANCE:700:1200:1400:1500:1600:1800:2500]    ++
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1:IRIDESCENT:1]
                [TLCM_NOUN:integument and endoskeleton:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'n'] ",
             ["MEDIUM"] = "[CASTE_TILE:'n'] ",
             ["LARGE"] = "[CASTE_TILE:'N'] ",
             ["HUGE"] = "[CASTE_TILE:'N'] ",
             ["GIANT"] = "[CASTE_TILE:'N'] ",
             ["TITANIC"] = " [CASTE_TILE:'N'] "
        },
        weight = 20,
		next_tables = {
		"procgen_subchart_table_pristine_body"
		}
    },
    {
        body_token = "",
        desc_part = "_______________________________________________________ __________/TYPE = A postbiological life form comprised of nanomachine colonies united in the manner of multicellular organisms. It has a tarry, glistening flesh exposed to the environment, giving the impression of a decaying corpse. This variant is a form of life which emerged from the low-energy state of the Fade and the failed experiments of its posthuman rulers, the detritus of desperate attempts to engineer forms which would survive a dying solar system. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
        eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
		sub_archetype = {"WET"},
			attribute_weight = { 
			TOUGHNESS = "+", 
			WILLPOWER = "-", 
			ENDURANCE = "+", 
			INTUITION = "+", 
			MEMORY = "---", 
			FOCUS = "-",
			CREATIVITY = "-"
			  },
        tok = {
		[[
		[CREATURE_CLASS:NANOMACHINE_WET]
		
				
		]]
		}, 
        weight = 30,
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'w'] ",
             ["MEDIUM"] = "[CASTE_TILE:'w'] ",
             ["LARGE"] = "[CASTE_TILE:'W'] ",
             ["HUGE"] = "[CASTE_TILE:'W'] ",
             ["GIANT"] = "[CASTE_TILE:'W'] ",
             ["TITANIC"] = " [CASTE_TILE:'W'] "
        },
		next_tables = {
		"procgen_subchart_table_wet_body"
		}
       
    }
    },
	
	
	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
	
    flowchart_data = {
    
        procgen_subchart_table_corrupt_body = {
            {    
                body_token = "CENTRAL_MASS:BRAIN2", 
                desc_part = "It has an amorphous, blob-like body, with ",
				eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON", "MILITARY","SANITATION", "VERMIN" },
                eligible_size_tags = {"MINIMAL", "SMALL", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_blob_limbs",
		"procgen_subchart_table_corrupt_blob_eyes",
		"procgen_subchart_table_corrupt_blob_mouth"
		}
            },
            { 
                body_token = "CENTRAL_MASS:BRAIN2", 
                desc_part = "It has an amorphous, elongated body, with ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON", "MILITARY", "SANITATION", "VERMIN" },
                eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_blob_limbs",
		"procgen_subchart_table_corrupt_blob_eyes",
		"procgen_subchart_table_corrupt_blob_mouth"
		}
            },
            {         
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has an upright humanoid body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_corrupt_head",
		"procgen_subchart_table_corrupt_arms",
		"procgen_subchart_table_corrupt_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a hunched-over humanoid body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "INCURSION", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "VERMIN" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_corrupt_head",
		"procgen_subchart_table_corrupt_arms",
		"procgen_subchart_table_corrupt_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a sinuous, bestial body, with ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "VERMIN" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_corrupt_head",
		"procgen_subchart_table_corrupt_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a squat, bestial body, with ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "VERMIN" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_corrupt_head",
		"procgen_subchart_table_corrupt_legs"
		}
            }
			},
		
	
			
        procgen_subchart_table_corrupt_blob_limbs = {
            {    
                body_token = "", 
                desc_part = "no limbs, moving by undulating its semi-liquid mass. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "many small, jointed legs. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25
            },
            {
                body_token = ":4LEG", 
                desc_part = "four short, muscular legs that pull its bulk forward. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":6LEG", 
                desc_part = "six short, muscular legs that pull its bulk forward. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
                ]]},
                weight = 25
            },
            {          
                body_token = ":TAIL_STANCE", 
                desc_part = "a long, metallic tail resembling an exposed, flattened spine. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
                ]]},
                weight = 25
            },
            {          
                body_token = ":8LEG", 
                desc_part = "eight short, muscular legs that pull its bulk forward. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25
            }
			},
			
	
			
        procgen_subchart_table_corrupt_blob_eyes = {
            {    
                body_token = "", 
                desc_part = "It has no eyes, and ",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
                eligible_size_tags = {"MICRO", "MINIMAL", "SMALL"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYES", 
                desc_part = "It has two mechanical lens-eyes, and ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":3EYES", 
                desc_part = "It has three mechanical lens-eyes, and ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYES", 
                desc_part = "It has four mechanical lens-eyes, and ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":5EYES", 
                desc_part = "It has five mechanical lens-eyes, and ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":6EYES", 
                desc_part = "It has six mechanical lens-eyes, and ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				

				
                ]]},
                weight = 25

            }
            },
	
			
	
        procgen_subchart_table_corrupt_blob_mouth = {
            {    
                body_token = ":PROBOSCIS", 
                desc_part = "a sharpened, retractable feeding tube. ",
				eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a circular mouth ringed with sharp, jointed teeth that flex like digits. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TEETH", 
                desc_part = "a vertical gash of a mouth lined with sharp, jointed teeth that flex like digits. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:200]
		[ATTACK_PENETRATION_PERC:200]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TEETH", 
                desc_part = "a horizontal gash of a mouth lined with sharp, jointed teeth that flex like digits. ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:200]
		[ATTACK_PENETRATION_PERC:200]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 25
				

            }
            },
				
			
	
        procgen_subchart_table_corrupt_head = {
            {    
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is humanoid, with ",
				eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:NOSE]
            [BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:nose bridge:SINGULAR]
        [SET_BP_GROUP:BY_CATEGORY:EAR]
            [BP_APPEARANCE_MODIFIER:SPLAYED_OUT:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:HANGING_LOBES:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_eyes",
		"procgen_subchart_table_corrupt_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:TEETH", 
                desc_part = "Its head is a half-exposed metal skull, with ",
		eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_eyes",
		"procgen_subchart_table_corrupt_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:TEETH", 
                desc_part = "Its head is an inhuman, half-exposed metal skull, with ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:LENGTH:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
				
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_jaw",
		"procgen_subchart_table_corrupt_eyes",
		"procgen_subchart_table_corrupt_hair"
		}
            }
            },
	
	
        procgen_subchart_table_corrupt_jaw = {
            {    
                body_token = "", 
                desc_part = "a long, narrow jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a short, broad jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a large, broad jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a small, narrow jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            }
            },
			
	
	
 
        procgen_subchart_table_corrupt_eyes = {
            {    
                body_token = ":2EYESOCKET", 
                desc_part = "two empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYESOCKET", 
                desc_part = "four empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
			
                body_token = ":6EYESOCKET", 
                desc_part = "six empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
                ]]},
                weight = 25
            },
            {     
                body_token = ":1EYE", 
                desc_part = "a single mechanical lens-eye, and ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25

            },
            {     
                body_token = ":2EYES", 
                desc_part = "two mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":3EYES", 
                desc_part = "three mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYES", 
                desc_part = "four mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":5EYES", 
                desc_part = "five mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":6EYES", 
                desc_part = "six mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				

        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25

            }
            },
	
			
			
	
        procgen_subchart_table_corrupt_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"INCURSION", "VESSEL", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
			
			
			
			
	
        procgen_subchart_table_corrupt_arms = {
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and the other pair dangling from its chest, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders and the other four dangling from its chest, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_corrupt_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_corrupt_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five skeletal fingers. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five elongated, skeletal fingers. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five elongated, skeletal fingers with blade-like talons. ",
				eligible_rating_tags = {"HOSTILE", "DANGEROUS", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
			}
            },
			
			
	    
	
        procgen_subchart_table_corrupt_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of perpetually bent, bestial legs, with ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has four skeletal legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has six skeletal legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_corrupt_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":TAIL_STANCE", 
                desc_part = "Its lower body is made up of a long spine-like tail. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:lash:lashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				[STANCE_CLIMBER]
                ]]},
                weight = 50
            }
            },
	
			
	
        procgen_subchart_table_corrupt_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "simple clawed feet. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":5TOES", 
                desc_part = "digitigrade clawed feet. ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "INCURSION", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":5TOES", 
                desc_part = "digitigrade feet with long, blade-like talons. ",
				eligible_rating_tags = {"HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "blunt metallic hooves. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "INCURSION", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
			
		
			

	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
	
        procgen_subchart_table_pristine_body = {
            {    
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has an upright, humanoid body, its partial integument mostly concealing the interweaving struts and arches of bone-like scaffolding and pulsing tubes which make up its nanomachine innards, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal_pristine",
		"procgen_subchart_table_pristine_head",
		"procgen_subchart_table_pristine_arms",
		"procgen_subchart_table_pristine_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has an upright, humanoid body, its partial integument a sparse webbing of taut strips revealing the interweaving struts and arches of bone-like scaffolding and pulsing tubes which make up its nanomachine innards, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal_pristine",
		"procgen_subchart_table_pristine_head",
		"procgen_subchart_table_pristine_arms",
		"procgen_subchart_table_pristine_legs"
		}
            }
			},
			
			
			
        procgen_subchart_table_pristine_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
        [SET_BP_GROUP:BY_CATEGORY:NOSE]
            [BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:nose bridge:SINGULAR]
        [SET_BP_GROUP:BY_CATEGORY:EAR]
            [BP_APPEARANCE_MODIFIER:SPLAYED_OUT:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:HANGING_LOBES:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:10:15:20:25:30:35:40]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_pristine_neck",
		"procgen_subchart_table_pristine_eyes",
		"procgen_subchart_table_pristine_mouth",
		"procgen_subchart_table_pristine_hair"
		}
            },
            { 
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is androgynously neotentic, with ",
				eligible_rating_tags = {"HOSTILE", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},  
                tok = {[[
        [SET_BP_GROUP:BY_CATEGORY:NOSE]
            [BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:nose bridge:SINGULAR]
        [SET_BP_GROUP:BY_CATEGORY:EAR]
            [BP_APPEARANCE_MODIFIER:SPLAYED_OUT:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:HANGING_LOBES:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:10:15:20:25:30:35:40]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_pristine_neck",
		"procgen_subchart_table_pristine_eyes",
		"procgen_subchart_table_pristine_mouth",
		"procgen_subchart_table_pristine_hair"
		}
            },
            { 
                body_token = ":HEADNECK_MODULAR:2EARHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is a long, narrow, tapering beak, with ",
				eligible_rating_tags = {"DANGEROUS", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:10:15:20:25:30:35:40]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_pristine_neck",
		"procgen_subchart_table_pristine_eyes",
		"procgen_subchart_table_pristine_mouth2",
		"procgen_subchart_table_pristine_hair"
		}
            },
            { 
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:SKULL", 
                desc_part = "Its head is a blank, faintly rippling mirror-like visage",
				eligible_rating_tags = {"AVATAR", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[EXTRAVISION]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:10:15:20:25:30:35:40]
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_pristine_neck2"
		}
            },
            {         
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:SKULL:MOUTH:TEETH", 
                desc_part = "Its head is a concave abyss, its front a hole of exposed nanomechanical flesh ringed with curving teeth",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[EXTRAVISION]
	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:300]
		[ATTACK_PENETRATION_PERC:300]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
			
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:10:15:20:25:30:35:40]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_pristine_neck2"
		}
            }
            },
	
	
	
        procgen_subchart_table_pristine_neck = {
            {    
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "an elongated, spine-like neck, ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
			
        procgen_subchart_table_pristine_neck2 = {
            {    
                body_token = "", 
                desc_part = ".",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = ", at the end of an elongated, spine-like neck. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
        procgen_subchart_table_pristine_eyes = {
            {    
                body_token = ":2EYESOCKET:EYELIDS", 
                desc_part = "two empty, lidded eye sockets, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYESOCKET", 
                desc_part = "two empty, round eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYESOCKET", 
                desc_part = "four empty, round eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
			
                body_token = ":6EYESOCKET", 
                desc_part = "six empty, round eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				

        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25

            }
            },
	
	
			
			
	
        procgen_subchart_table_pristine_mouth = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "a human mouth. ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "BENIGN"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]
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
                weight = 25
            },
            {     
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "a human mouth that can split wider across its cheeks, revealing long, sharp teeth. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:200]
		[ATTACK_PENETRATION_PERC:200]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a lipless, skeletal jaw with long, curving teeth. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:300]
		[ATTACK_PENETRATION_PERC:300]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 25
				

            }
            },
				
			
	
        procgen_subchart_table_pristine_mouth2 = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a lipless, skeletal jaw with long, curving teeth. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:300]
		[ATTACK_PENETRATION_PERC:300]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 25
            }
            },
				
	
        procgen_subchart_table_pristine_hair = {
            {    
                body_token = "", 
                desc_part = "It has metallic hair on its head, styled like a human's. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "AVATAR", "BENIGN"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
	[USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
	[BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
				
        [SET_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:HIGH_POSITION:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyebrows:PLURAL]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
				
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
	
	
	
        procgen_subchart_table_pristine_arms = {
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and another just below, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders, and the two others just below, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_pristine_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five delicate fingers devoid of nails. ",
				eligible_rating_tags = {"SOPHONT", "BENIGN", "PROBLEMATIC", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five skeletal fingers. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five elongated, skeletal fingers. ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
			}
            },
	
			
	
        procgen_subchart_table_pristine_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of legs, ending in ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_feet",
		"procgen_subchart_table_pristine_wings"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of elongated legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_feet",
		"procgen_subchart_table_pristine_wings"
		}
            },
            {     
                body_token = ":TAIL", 
                desc_part = "Its lower body is made up of a skeletal spine-like tail, carried by ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:lash:lashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND] 
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_legs2",
		"procgen_subchart_table_pristine_wings"
		}
            }
            },
	
			
        procgen_subchart_table_pristine_legs2 = {
            {     
                body_token = ":4LEG", 
                desc_part = "four thin splayed legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_feet"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "six thin splayed legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_pristine_feet"
		}
            }
            },
	
        procgen_subchart_table_pristine_feet = {
            {     
                body_token = ":2TOES", 
                desc_part = "a pair of skeletal, tapering claws. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "EXISTENTIAL", "DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "tapering needle-like gravity engines, giving the impression it hovers off the ground as it walks. ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":5TOES", 
                desc_part = "skeletal clawed feet, talons arranged radially. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "narrow metallic stumps. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR",  "EXISTENTIAL", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
	
        procgen_subchart_table_pristine_wings = {
            {     
                body_token = ":2WINGS", 
                desc_part = "A pair of wings with wispy, trailing metallic feathers grow from its back. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":4WINGS", 
                desc_part = "Two pairs of wings with wispy, trailing metallic feathers grow from its back. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:327:218:109:1900:2900] 80 kph
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":2WINGS", 
                desc_part = "A pair of wings with stiff, blade-like metallic feathers grow from its back. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":4WINGS", 
                desc_part = "Two pairs of wings with stiff, blade-like metallic feathers grow from its back. ",
				eligible_rating_tags = {"AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS"},
				eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:327:218:109:1900:2900] 80 kph
			
                ]]},
                weight = 25
            }
            },
	
	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
        procgen_subchart_table_wet_body = {
            {    
                body_token = "CENTRAL_MASS:BRAIN2", 
                desc_part = "It has an amorphous, slime-like body, with ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MINIMAL", "SMALL", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			

                ]]},
                weight = 100,
		next_tables = {
		"procgen_subchart_table_wet_blob_limbs",
		"procgen_subchart_table_wet_blob_eyes",
		"procgen_subchart_table_wet_blob_mouth"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal_wet",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_arms",
		"procgen_subchart_table_wet_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a skeletal, upright body, with ",
				eligible_rating_tags = { "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal_wet",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_arms",
		"procgen_subchart_table_wet_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a skeletal, hunchbacked body, with ",
				eligible_rating_tags = { "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal_wet",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_arms",
		"procgen_subchart_table_wet_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a sinuous, bestial body, with ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a slim, bestial body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "DOMESTIC", "NOMAD", "HUNTER", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_legs"
		}
            },
            {     
                body_token = "TORSO_MODULAR:SPINE:RIBCAGE:BRAIN2:SKULL2", 
                desc_part = "It has a squat, bestial body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_wet_head",
		"procgen_subchart_table_wet_legs"
		}
            }
			},
			
			
        procgen_subchart_table_wet_blob_limbs = {
            {    
                body_token = "", 
                desc_part = "no limbs, moving by undulating its semi-liquid mass. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "many small, jointed legs. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25
            },
            {
                body_token = ":4LEG", 
                desc_part = "four long, thin legs that pull its bulk forward. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":6LEG", 
                desc_part = "six long, thin legs that pull its bulk forward. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
                ]]},
                weight = 25
            },
            {          
                body_token = ":TAIL_STANCE", 
                desc_part = "a long, metallic tail resembling an exposed, flattened spine. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
	
	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
                ]]},
                weight = 25
            },
            {          
                body_token = ":8LEG", 
                desc_part = "eight long, thin legs that pull its bulk forward. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25
            }
            },
	
	
			
        procgen_subchart_table_wet_blob_eyes = {
            {    
                body_token = "", 
                desc_part = "It has no eyes, and ",
				eligible_rating_tags = {"AMBIENT", "VERMIN"},
                eligible_size_tags = {"MICRO", "MINIMAL", "SMALL"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYESOCKET", 
                desc_part = "It has two empty, round eye sockets, and ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYESOCKET", 
                desc_part = "It has four empty, round eye sockets, and ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
			
                body_token = ":6EYESOCKET", 
                desc_part = "It has six empty, round eye sockets, and ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				

				
                ]]},
                weight = 25

            },
            {     
                body_token = ":1EYE", 
                desc_part = "It has a single mechanical lens-eye, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25

            },
            {     
                body_token = ":2EYES", 
                desc_part = "It has two mechanical lens-eyes, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":3EYES", 
                desc_part = "It has three mechanical lens-eyes, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYES", 
                desc_part = "It has four mechanical lens-eyes, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":5EYES", 
                desc_part = "It has five mechanical lens-eyes, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":6EYES", 
                desc_part = "It has six mechanical lens-eyes, and ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				

        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25

            }
            },
	
			
	
        procgen_subchart_table_wet_blob_mouth = {
            {    
                body_token = "", 
                desc_part = "no mouth, absorbing trace nutrients through its flesh. ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":MOUTH", 
                desc_part = "a simple, round mouth. ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "DOMESTIC", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				

                ]]},
                weight = 25
            },
            {     
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a circular mouth ringed with irregular teeth. ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:BODY:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TEETH", 
                desc_part = "a vertical gash of a mouth lined with irregular teeth. ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":MOUTH:TEETH", 
                desc_part = "a horizontal gash of a mouth lined with irregular teeth. ",
				eligible_rating_tags = {"HAZARDOUS", "DOMESTIC", "SANITATION", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:BODY:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:300]
		[ATTACK_PENETRATION_PERC:300]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 25
				

            }
            },
				
			
	
        procgen_subchart_table_wet_head = {
            {    
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is humanoid, with ",
				eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:NOSE]
            [BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:nose bridge:SINGULAR]
        [SET_BP_GROUP:BY_CATEGORY:EAR]
            [BP_APPEARANCE_MODIFIER:SPLAYED_OUT:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:HANGING_LOBES:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_wet_eyes",
		"procgen_subchart_table_wet_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:TEETH", 
                desc_part = "Its head is a half-exposed metal skull, with ",
		eligible_rating_tags = {"DEVIANT", "HOSTILE", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_eyes",
		"procgen_subchart_table_wet_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:THROAT:NECK:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:TEETH", 
                desc_part = "Its head is an inhuman, half-exposed metal skull, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:LENGTH:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
				
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_wet_jaw",
		"procgen_subchart_table_wet_eyes",
		"procgen_subchart_table_wet_hair"
		}
            }
            },
	
	
        procgen_subchart_table_wet_jaw = {
            {    
                body_token = "", 
                desc_part = "a long, narrow jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a short, broad jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a large, broad jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "a small, narrow jaw with irregular teeth, and ",
				eligible_rating_tags = {"DEVIANT", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 25
            }
            },
			
	
	
 
        procgen_subchart_table_wet_eyes = {
            {    
                body_token = ":2EYESOCKET", 
                desc_part = "two empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYESOCKET", 
                desc_part = "four empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
			
                body_token = ":6EYESOCKET", 
                desc_part = "six empty eye sockets, and ",
				eligible_rating_tags = {"DEVIANT", "AVATAR", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eye sockets:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":1EYE", 
                desc_part = "It has a single mechanical lens-eye, and ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25

            },
            {     
                body_token = ":2EYES", 
                desc_part = "It has two mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":3EYES", 
                desc_part = "It has three mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":4EYES", 
                desc_part = "It has four mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":5EYES", 
                desc_part = "It has five mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":6EYES", 
                desc_part = "It has six mechanical lens-eyes, and ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 25

            }
            },
	
			
			
	
        procgen_subchart_table_wet_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
	
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
                [TLCM_NOUN:endoskeleton:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]

                ]]},
                weight = 25
            }
            },
			
			
			
			
	
        procgen_subchart_table_wet_arms = {
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and the other pair dangling from its chest, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_wet_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders and the other four dangling from its chest, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_wet_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_wet_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five skeletal fingers. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five elongated, skeletal fingers. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five elongated, skeletal fingers with blade-like talons. ",
				eligible_rating_tags = {"HOSTILE", "DANGEROUS", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:BONE]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
			}
            },
			
			
	    
	
        procgen_subchart_table_wet_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of perpetually bent, bestial legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has four skeletal legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has six skeletal legs, ending in ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_wet_feet",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = ":TAIL_STANCE", 
                desc_part = "Its lower body is made up of a long spine-like tail. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:lash:lashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				[STANCE_CLIMBER]
                ]]},
                weight = 50
            }
            },
	
			
	
        procgen_subchart_table_wet_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "simple clawed feet. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":5TOES", 
                desc_part = "digitigrade clawed feet. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":5TOES", 
                desc_part = "digitigrade feet with long, blade-like talons. ",
				eligible_rating_tags = {"HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:BONE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:MAIN]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "blunt metallic hooves. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
			
		
        procgen_subchart_table_tail = {
            {    
                body_token = "", 
                desc_part = "no tail between its legs. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a short tail with exposed metallic bone. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a long tail with exposed metallic bone. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

	
                ]]},
                weight = 25
            }
			},
			

	
	
	
	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
	






        procgen_subchart_table_dermal = {
            {     
                body_token = "", 
                desc_part = "no external armor plating save the metals of its claws and teeth. ",
			eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DOMESTIC", "HUNTER", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "form-fitting meta-alloy dermal plating melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "NOMAD", "VEHICLE", "CARRIER", "WEAPON", "MILITARY", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "form-fitting hyper-alloy dermal plating grows melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = { "AVATAR", "HOSTILE", "INCURSION", "EXISTENTIAL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]
					

                ]]},
                weight = 50
            }
            },




        procgen_subchart_table_dermal_wet = {
            {     
                body_token = "", 
                desc_part = "no external armor plating save the metals of its claws and teeth. ",
			eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DOMESTIC", "HUNTER", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:flesh:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "organic human skin grown over its surface . ",
			eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:10:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:50:50:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "form-fitting meta-alloy dermal plating melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "NOMAD", "WEAPON", "MILITARY", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:GRAY:10:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
                [TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "form-fitting, ragged-jointed plastic melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = {"SOPHONT", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:WHITE:1:CLEAR:1:WHITE:1:CLEAR:1:WHITE:1:CLEAR:1:WHITE:1:CLEAR:1:WHITE:1:CLEAR:1]
                [TLCM_NOUN:plastic:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                [TISSUE:PLASTIC]
                    [TISSUE_NAME:plastic exterior:NP]
                    [TISSUE_MATERIAL:INORGANIC:PLASTICWARE]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:PLASTIC]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:PLASTIC]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:plastic exterior:SINGULAR]

					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "form-fitting, ball-jointed ceramic plating melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = {"SOPHONT", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE:CERAMIC]
                    [TISSUE_NAME:ceramic exterior:NP]
                    [TISSUE_MATERIAL:INORGANIC:CERAMICWARE]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:CERAMIC]
				
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:CERAMIC]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:ceramic:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:CERAMIC]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:ceramic exterior:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:CERAMIC]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:ceramic exterior:SINGULAR]

					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "form-fitting B-tech dermal plating melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = { "AVATAR", "HOSTILE", "INCURSION", "EXISTENTIAL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
				
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:GRAY:10:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
                [TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]
					

                ]]},
                weight = 50
            }
            },


        procgen_subchart_table_dermal_pristine = {
            {     
                body_token = "", 
                desc_part = "no external armor coating save the metals of its claws and teeth. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "VESSEL", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "a meta-alloy coating atop its integument, reacting in response to trauma. ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "a B-tech coating atop its integument, hardening in response to trauma. ",
			eligible_rating_tags = { "AVATAR", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
					

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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:NANOMACHINE_FEMALE][POP_RATIO:10000]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:NANOMACHINE_MALE][POP_RATIO:10000]
					]],
                    description_addon = ""
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 100,
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "VESSEL", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
			eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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

            -- This is the working fallback code from your older config_nanomachine.lua file.
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