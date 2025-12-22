return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "BIOMACHINE",
    MIN_CREATURES = 100,
    MAX_CREATURES = 300,
    BASE_CREATURE_NAME_PREFIX = "biomech ID",
    OUTPUT_FILENAME = "generated_biomech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,
	
	FORCED_GENERATION_QUEUE = {
        { rating = "INCURSION", size = "TITANIC", sub_archetype = "HORROR", count = 1 },
		
        { rating = "INCURSION", size = "GIANT", sub_archetype = "HORROR", count = 3 },
		
        { rating = "AVATAR", size = "GIANT", sub_archetype = "HUMAN", count = 4 },
		
        { rating = "AVATAR", size = "TITANIC", sub_archetype = "HUMAN", count = 2 },
		
        { rating = "EXISTENTIAL", size = "GIANT", sub_archetype = "DEVIL", count = 3 },
		
        { rating = "EXISTENTIAL", size = "TITANIC", sub_archetype = "DEVIL", count = 1 },
		
        { rating = "EXISTENTIAL", size = "GIANT", sub_archetype = "OGRE", count = 2 },
		
        { rating = "EXISTENTIAL", size = "TITANIC", sub_archetype = "OGRE", count = 1 },
        
        { rating = "SOPHONT", size = "MEDIUM", sub_archetype = "HUMAN", count = 1 },
        
        { rating = "VESSEL", size = "MEDIUM", sub_archetype = "HORROR", count = 5 },
        
    },

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "biomech",
    TRANSCENDENT_NAME_ROOT_PLURAL = "biomechs",

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
        [CREATURE_CLASS:BIOMACHINE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC]
        
				
	
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

    [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:MUSCLE:FAT:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
		
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
		
        [USE_MATERIAL_TEMPLATE:BLOOD:BLOOD_TEMPLATE]
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
        "_______________________________________________________ __________/HISTORY = Biomechs are constructs created from enhanced tissues possessing strength and durability on par with any conventional technology, and often supplemented by them. Originally the bodies of the first users of N-matter, biomachines have proliferated alongside the spread of the megastructures. While many exist as tools of pan-humanity, far more lurk in the unending night, their faces becoming those of nightmares and monstrosities as they continue to assimilate with the brutality of the technosystem.  _______________________________________________________ __________" ,
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
			            [COLOR:5:0:0]
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
                    [TISSUE_MATERIAL:INORGANIC:B_TECH]
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
			            [COLOR:5:0:0]
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
                    [TISSUE_MATERIAL:INORGANIC:B_TECH]
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
			            [COLOR:5:0:0][NIGHT_CREATURE_EXPERIMENTER]
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
                    [TISSUE_MATERIAL:INORGANIC:B_TECH]
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
			            [COLOR:5:0:0]
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
			            [COLOR:5:0:0]
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
			            [COLOR:5:0:0]
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
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
			            [COLOR:5:0:0]
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
			            [COLOR:5:0:0]
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
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
			            [COLOR:5:0:0]
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
            enabled = false
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
				attribute_weight = { 
				WILLPOWER = "+", 
				INTUITION = "+", 
				SOCIAL_AWARENESS = "+", 
				EMPATHY = "+", 
				LINGUISTIC_ABILITY = "+"
				},
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
            [TRAINABLE_HUNTING][BENIGN]
            [CREATURE_CLASS:HUNTER]
            ]]},
            tags = {"HUNTER"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sanitation; it is exceedingly efficient at removing vermin from a settlement. ",
            tok = {[[ [COLOR:5:0:0]
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
            tok = {[[ [COLOR:5:0:0]
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"MICRO"},
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 10,
        base_adult_size_for_random = 10,
        body_size_index_and_child_count = 1,
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"SMALL"},
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"PROBLEMATIC", "DOMESTIC", "HUNTER", "PRODUCT", "SANITATION", "COMPANION" },
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'b'][CREATURE_CLASS:SIZE_LESSER]
		
		]]},
        weight = 30,
        enabled = true
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DEVIANT", "VESSEL", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS", "CARRIER", "HUNTER", "WEAPON",  "SERVANT", "SANITATION", "PRODUCT"},
        size_tags = {"MEDIUM"},
        weight = 50,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
        tok = {[[
		[CREATURE_TILE:'b'][CREATURE_CLASS:SIZE_MEDIUM]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "PROBLEMATIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON",  "SERVANT", "PRODUCT"},
        size_tags = {"LARGE"},
        weight = 30,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
        tok = {[[
		[CREATURE_TILE:'B'][CREATURE_CLASS:SIZE_LARGE]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
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
        tok = {[[
		[CREATURE_TILE:'B'][CREATURE_CLASS:SIZE_HUGE]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "HAZARDOUS", "AVATAR", "NOMAD", "CARRIER", "MILITARY"},
        size_tags = {"GIANT"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'B'][CREATURE_CLASS:SIZE_GIANT]
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "AVATAR"},
        size_tags = {"TITANIC"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'B'][CREATURE_CLASS:SIZE_TITANIC]
		
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
        body_token = "TORSO_MODULAR:CORE:SPINE:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = An artificially engineered life form made from synthetic tissues strengthened by internal nanites and alloy particulates, granting it functionality on par with any true machine. This variant descends from the first users of N-matter which revolted against the Geno-Archons, most falling into mindless predation in the process. It has a sinewy build with leathery skin wrapped tight against its body, seams on its skin split open to interface with invasive machinery. _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		attribute_weight = { 
		STRENGTH = "++", 
		AGILITY = "++", 
		ENDURANCE = "+", 
		TOUGHNESS = "+", 
		RECUPERATION = "+++", 
		DISEASE_RESISTANCE = "+++",
		KINESTHETIC_SENSE = "+", 
		SPATIAL_SENSE = "+", 
		INTUITION = "+"
		},
		sub_archetype = {"DEVIL"},
        tok = {
		[[
		[CREATURE_CLASS:BIOMACHINE_DEVIL]
			[GENERAL_MATERIAL_FORCE_MULTIPLIER:4:5]
			
	[PERSONALITY:PRIDE:40:90:100]
	[PERSONALITY:VANITY:40:85:100]
	[PERSONALITY:AMBITION:40:90:100]
	[PERSONALITY:CONFIDENCE:40:95:100]
	[PERSONALITY:DISDAIN_ADVICE:40:95:100]
	[PERSONALITY:POLITENESS:0:10:60]
	[PERSONALITY:IMMODESTY:40:80:100]
	[PERSONALITY:VIOLENT:40:95:100]
	[PERSONALITY:VENGEFUL:40:95:100]
	[PERSONALITY:ANGER_PROPENSITY:40:80:100]
	[PERSONALITY:BRAVERY:40:95:100]
	[PERSONALITY:DISCORD:40:90:100]
	[PERSONALITY:EXCITEMENT_SEEKING:40:90:100]
	[PERSONALITY:TRUST:0:15:60]
	[PERSONALITY:ALTRUISM:0:15:60]
	[PERSONALITY:FRIENDLINESS:0:15:60]
	[PERSONALITY:PRIVACY:40:90:100]
	[PERSONALITY:TOLERANT:0:15:60]
	[PERSONALITY:HATE_PROPENSITY:40:80:100]
	[PERSONALITY:LOVE_PROPENSITY:40:80:100]
	[PERSONALITY:CHEER_PROPENSITY:40:80:100]
	[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
	[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
	[PERSONALITY:ANXIETY_PROPENSITY:0:25:50]
	[PERSONALITY:BASHFUL:0:25:50]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'v'] ",
             ["MEDIUM"] = "[CASTE_TILE:'v'] ",
             ["LARGE"] = "[CASTE_TILE:'V'] ",
             ["HUGE"] = "[CASTE_TILE:'V'] ",
             ["GIANT"] = "[CASTE_TILE:'V'] ",
             ["TITANIC"] = " [CASTE_TILE:'V'] "
        },
        weight = 50,
		next_tables = {
		"procgen_subchart_table_devil_body"
		}
    },
    {
        body_token = "TORSO_MODULAR:CORE:SPINE:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = An artificially engineered life form made form synthetic tissues strengthened by internal nanites and alloy particulates, granting it functionality on par with any true machine. This variant is a modern transhuman configuration, built in the image of pan-human physique even if its genetic code is something else entirely. Seams on its skin split open to interface with invasive machinery. _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"HUMAN"},
        tok = {
		[[
		[CREATURE_CLASS:BIOMACHINE_HUMAN]
			[GENERAL_MATERIAL_FORCE_MULTIPLIER:4:5]
			
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			
		]]
		}, 
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'h'] ",
             ["MEDIUM"] = "[CASTE_TILE:'h'] ",
             ["LARGE"] = "[CASTE_TILE:'H'] ",
             ["HUGE"] = "[CASTE_TILE:'H'] ",
             ["GIANT"] = "[CASTE_TILE:'H'] ",
             ["TITANIC"] = " [CASTE_TILE:'H'] "
        },
        weight = 20,
		next_tables = {
		"procgen_subchart_table_human_body"
		}
    },
    {
        body_token = "TORSO_MODULAR:CORE:SPINE:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = An artificially engineered life form made form synthetic tissues strengthened by internal nanites and alloy particulates, granting it functionality on par with any true machine. This variant descends from the biomechs created during the Transitional Era, hulking drudges and slave soldiers cast out into the dark to labor and slaughter without oversight or maintenance, many growing feral in their long isolation. It has thick, craggy skin with tubing half-embedded in its flesh. _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "CARRIER", "NOMAD", "DOMESTIC"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"OGRE"},
        tok = {
		[[
		[CREATURE_CLASS:BIOMACHINE_OGRE]
		
		[PERSONALITY:ABSTRACT_INCLINED:0:10:60]
		[PERSONALITY:CURIOUS:0:10:60]
		[PERSONALITY:IMAGINATION:0:10:60]
		[PERSONALITY:ART_INCLINED:0:10:60]
		[PERSONALITY:POLITENESS:0:10:50]
		[PERSONALITY:ORDERLINESS:0:10:50]
		[PERSONALITY:WASTEFULNESS:50:90:100]
		[PERSONALITY:PERFECTIONIST:0:10:50]
		[PERSONALITY:BASHFUL:0:10:50]
		[PERSONALITY:TRUST:40:80:100]
		[PERSONALITY:SWAYED_BY_EMOTIONS:40:80:100]
		[PERSONALITY:VIOLENT:40:75:90]
		[PERSONALITY:IMMODERATION:40:90:100]
		[PERSONALITY:BRAVERY:40:80:100]
		[PERSONALITY:PRIVACY:0:20:60]
		
			[GENERAL_MATERIAL_FORCE_MULTIPLIER:3:4]

		
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:40:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
		
		]]
		}, 
        weight = 20,
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'g'] ",
             ["MEDIUM"] = "[CASTE_TILE:'g'] ",
             ["LARGE"] = "[CASTE_TILE:'G'] ",
             ["HUGE"] = "[CASTE_TILE:'G'] ",
             ["GIANT"] = "[CASTE_TILE:'G'] ",
             ["TITANIC"] = " [CASTE_TILE:'G'] "
        },
		next_tables = {
		"procgen_subchart_table_ogre_body"
		}
    },
    {
        body_token = "TORSO_MODULAR:CORE:SPINE:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = An artificially engineered life form made form synthetic tissues strengthened by internal nanites and alloy particulates, granting it functionality on par with any true machine. This variant descends from those degenerated beyond saving, or created so by the mad hyperintelligences of the deep Datasphere. It is abnormally, horrendously deformed, riddled with cancers, misshapen and twisted. _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"HORROR"},
        tok = {
		[[
		[CREATURE_CLASS:BIOMACHINE_HORROR]
		
			[GENERAL_MATERIAL_FORCE_MULTIPLIER:4:5]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		]]
		}, 
		size_specific_tokens = {
             ["LESSER"] = "[CASTE_TILE:'r'] ",
             ["MEDIUM"] = "[CASTE_TILE:'r'] ",
             ["LARGE"] = "[CASTE_TILE:'R'] ",
             ["HUGE"] = "[CASTE_TILE:'R'] ",
             ["GIANT"] = "[CASTE_TILE:'R'] ",
             ["TITANIC"] = " [CASTE_TILE:'R'] "
        },
        weight = 10,
		next_tables = {
		"procgen_subchart_table_horror_body"
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
    
        procgen_subchart_table_devil_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_devil_head",
		"procgen_subchart_table_devil_arms",
		"procgen_subchart_table_devil_legs",
		"procgen_subchart_table_devil_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunched-over humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
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
		"procgen_subchart_table_devil_head",
		"procgen_subchart_table_devil_arms",
		"procgen_subchart_table_devil_legs",
		"procgen_subchart_table_devil_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunched-over humanoid body, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_head",
		"procgen_subchart_table_devil_arms",
		"procgen_subchart_table_devil_legs",
		"procgen_subchart_table_devil_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a bestial body like some primordial raptor, tilted so that it is long rather than tall, with ",
				eligible_rating_tags = {"EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "NOMAD"},
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
		"procgen_subchart_table_devil_head",
		"procgen_subchart_table_devil_arms",
		"procgen_subchart_table_devil_legs",
		"procgen_subchart_table_devil_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a long, sinuous body, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON", "MILITARY", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_head",
		"procgen_subchart_table_devil_arms",
		"procgen_subchart_table_devil_legs",
		"procgen_subchart_table_devil_other"
		}
            }
			},
			
			
        procgen_subchart_table_devil_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is exceptionally humanoid, toughened skin smoothed into a comely visage by the vanity of some ancient ancestor, with ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is superficially humanoid, the contours of its visage and shape of its eyes evoking some primordial predator, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:2NOSEHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is bestial, its brow and forehead humanoid but below that its jaw and snout protrude into a long, distended muzzle, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON", "MILITARY", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
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
		"procgen_subchart_table_devil_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            }
            },
	
	
        procgen_subchart_table_devil_neck = {
            {    
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "an elongated, serpentine neck, ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
        procgen_subchart_table_devil_eyes = {
            {    
                body_token = ":2EYES:EYELIDS", 
                desc_part = "glowing irises in all-black eyes, and ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYES:EYELIDS", 
                desc_part = "glowing pupils in all-black eyes, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:pupils:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYESOCKET", 
                desc_part = "glowing beads of light embedded inside empty eye sockets, and ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 40
            },
            {     
                body_token = "", 
                desc_part = "eyes obscured by a mass of sensory bulbs and antennae, and ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				[EXTRAVISION]
				
                ]]},
                weight = 10

            }
            },
	
			
			
	
        procgen_subchart_table_devil_mouth = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "a mouth with seams that stretch from its corners halfway up its cheeks, capable of splitting open to reveal a set of metallic fangs and prominent canines. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
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
                desc_part = "the corners of its mouth extend into seams stretching to the edges of its cheeks, metallic fangs protruding slightly from the creases that can split into an unhinged jaw in seconds. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "the corners of its mouth extend into seams stretching across its cheeks and halfway down its neck, metallic fangs protruding slightly from the creases that can split into an unhinged jaw in seconds. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON"},
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
		[ATTACK_CONTACT_PERC:400]
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
                desc_part = "its mouth is a jagged gash in its face, lipless and bristling with haphazardly curved metallic teeth. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
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
				
	
	
	
        procgen_subchart_table_devil_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
	[USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
	[USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
	[BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:HIGH_POSITION:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyebrows:PLURAL]
        [SET_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyelashes:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
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
                desc_part = "It has hair on its head and running down its neck like a mane, but otherwise lacks it. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
	
	
        procgen_subchart_table_devil_arms = {
            {     
                body_token = "", 
                desc_part = "It lacks arms entirely. ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_fingers"
		}
            },
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two disproportionately long humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_fingers"
		}
            },
            {     
                body_token = ":BASIC_3PARTARMS_APE", 
                desc_part = "Its two front limbs are arm-like, elongated and ending in ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_devil_fingers"
		}
            },
            {     
                body_token = ":2WINGS", 
                desc_part = "It has two large, foldable wings combining armored shell and stretched membrane, thrusters extruding near the area they connect to the torso ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:327:218:109:1900:2900] 80 kph
                ]]},
                weight = 50
            },
            {     
                body_token = ":2WINGS:BASIC_3PARTARMS", 
                desc_part = "It has two foldable wings combining armored shell and stretched membrane, thrusters extruding near the area they connect to the torso, and a pair of humanoid arms that end in ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
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
		"procgen_subchart_table_devil_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and another emerging from its midsection, ending in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_devil_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders, another emerging from its midsection, and a third pair hanging from its back, ending in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_devil_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_devil_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five clawed fingers. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                desc_part = "five elongated, clawed fingers. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                desc_part = "five elongated, clawed fingers ending in blade-like talons. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
	
			
	
        procgen_subchart_table_devil_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "SERVANT"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a long pair of humanoid legs, with ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "SERVANT"},
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
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of perpetually bent, bestial legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "DOMESTIC"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has an enlarged lower body with four powerful splayed legs, ending in ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has four legs like a beast, ending in ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has an enlarged lower body with six powerful splayed legs, ending in ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has six legs splayed out to its sides, ending in ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_devil_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":TAIL_STANCE", 
                desc_part = "Its lower body is made up of a muscular spine-like tail, with a pair of thrusters allowing it to rapidly accelerate over the ground. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON"},
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
	
			
	
        procgen_subchart_table_devil_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "simple clawed feet. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
        procgen_subchart_table_devil_tail = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC", "SOPHONT", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
			
			
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"AVATAR"},
                eligible_size_tags = {"GIANT", "TITANIC"}, 
                tok = {[[
			
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thin, spine-like tail. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 25
            }
            },
	
	
        procgen_subchart_table_devil_other = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 80
            },
            {     
                body_token = ":2HEAD_HORN", 
                desc_part = "A pair of curving metallic horns grow from the sides of its head. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "NOMAD", },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
		[USE_MATERIAL_TEMPLATE:HORN:HORN_TEMPLATE]
		[USE_TISSUE_TEMPLATE:HORN:HORN_TEMPLATE]
                [TISSUE_LAYER_OVER:BY_CATEGORY:HORN:DERMAL]
		[ATTACK:HGORE:BODYPART:BY_CATEGORY:HORN]
				[ATTACK_SKILL:BITE]
				[ATTACK_VERB:gore:gores]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:3:3]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 20
            },
            {     
                body_token = "", 
                desc_part = "Metallic spines grow from its back, rattling with its movements. ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:rattle your spines:rattles its spines:metallic rattling]
			
                ]]},
                weight = 20
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
	
	
	
        procgen_subchart_table_human_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_human_head",
		"procgen_subchart_table_human_arms",
		"procgen_subchart_table_human_legs",
		"procgen_subchart_table_human_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an upright humanoid body, sexless and devoid of navel or mammaries, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_head",
		"procgen_subchart_table_human_arms",
		"procgen_subchart_table_human_legs",
		"procgen_subchart_table_human_other"
		}
            }
			},
			
			
			
        procgen_subchart_table_human_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid, with ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_eyes",
		"procgen_subchart_table_human_hair"
		}
            },
            { 
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid, face obscured by a full mask of dermal plate melded to its skin, with ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
		"procgen_subchart_table_human_eyes",
		"procgen_subchart_table_human_hair"
		}
            },
            {         
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid but twisted by deviance into predatory contours, with ",
				eligible_rating_tags = {"DEVIANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
	[PERSONALITY:PRIDE:40:90:100]
	[PERSONALITY:VANITY:40:85:100]
	[PERSONALITY:AMBITION:40:90:100]
	[PERSONALITY:CONFIDENCE:40:95:100]
	[PERSONALITY:DISDAIN_ADVICE:40:95:100]
	[PERSONALITY:POLITENESS:0:10:60]
	[PERSONALITY:IMMODESTY:40:80:100]
	[PERSONALITY:VIOLENT:40:95:100]
	[PERSONALITY:VENGEFUL:40:95:100]
	[PERSONALITY:ANGER_PROPENSITY:40:80:100]
	[PERSONALITY:BRAVERY:40:95:100]
	[PERSONALITY:DISCORD:40:90:100]
	[PERSONALITY:EXCITEMENT_SEEKING:40:90:100]
	[PERSONALITY:TRUST:0:15:60]
	[PERSONALITY:ALTRUISM:0:15:60]
	[PERSONALITY:FRIENDLINESS:0:15:60]
	[PERSONALITY:PRIVACY:40:90:100]
	[PERSONALITY:TOLERANT:0:15:60]
	[PERSONALITY:HATE_PROPENSITY:40:80:100]
	[PERSONALITY:LOVE_PROPENSITY:40:80:100]
	[PERSONALITY:CHEER_PROPENSITY:40:80:100]
	[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
	[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
	[PERSONALITY:ANXIETY_PROPENSITY:0:25:50]
	[PERSONALITY:BASHFUL:0:25:50]
				
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
                weight = 50,
		next_tables = {
		"procgen_subchart_table_devil_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            }
            },
	
	
        procgen_subchart_table_human_eyes = {
            {    
                body_token = ":2EYES:EYELIDS:MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "glowing irises in all-black eyes, and ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
				
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "eyes obscured by a bristling ring of sensory bulbs and antennae. ",
				eligible_rating_tags = {"AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]

				[EXTRAVISION]
				
                ]]},
                weight = 10

            }
            },
	
	
	
        procgen_subchart_table_human_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
	[USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
	[USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
	[BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:HIGH_POSITION:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyebrows:PLURAL]
        [SET_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyelashes:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
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
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
	
	
	
        procgen_subchart_table_human_arms = {
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_human_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and another just below, ending in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders, and the two others just below, ending in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_human_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five fingers. ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five clawed fingers. ",
				eligible_rating_tags = {"DEVIANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                desc_part = "five elongated, clawed fingers. ",
				eligible_rating_tags = {"DEVIANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
	
			
	
        procgen_subchart_table_human_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of elongated humanoid legs, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "AVATAR"},
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
		"procgen_subchart_table_human_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of perpetually bent, bestial legs, with ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_human_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has an enlarged lower body with four powerful splayed legs, ending in ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_human_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has an enlarged lower body with six powerful splayed legs, ending in ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_human_feet",
		"procgen_subchart_table_devil_tail"
		}
            },
            {     
                body_token = ":TAIL_STANCE", 
                desc_part = "Its lower body is made up of a muscular spine-like tail, with a pair of thrusters allowing it to rapidly accelerate over the ground. ",
				eligible_rating_tags = {"DEVIANT", "AVATAR"},
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
                weight = 25
            }
            },
	
			
	
        procgen_subchart_table_human_feet = {
            {     
                body_token = "", 
                desc_part = "simple armored feet. ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
			
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "tapering needle-like gravity engines, giving the impression it hovers off the ground as it walks. ",
				eligible_rating_tags = {"SOPHONT", "AVATAR"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":5TOES", 
                desc_part = "simple clawed feet. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
        procgen_subchart_table_human_other = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 80
            },
            {     
                body_token = "", 
                desc_part = "The dermal plating of its head is sculpted into a crescent shape. ",
				eligible_rating_tags = {"AVATAR" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 20
            },
            {     
                body_token = "", 
                desc_part = "A halo of holographic light orbits around its eyes.",
				eligible_rating_tags = {"AVATAR" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
                ]]},
                weight = 20
            },
            {
                body_token = ":2WINGS", 
                desc_part = "A pair of metallic wings with stiff, blade-like feathers grow from its back.",
				eligible_rating_tags = {"AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:327:218:109:1900:2900] 80 kph
			
                ]]},
                weight = 20
            },
            {     
                body_token = ":2HEAD_HORN", 
                desc_part = "A pair of curving metallic horns grow from the sides of its head. ",
				eligible_rating_tags = {"AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
		[USE_MATERIAL_TEMPLATE:HORN:HORN_TEMPLATE]
		[USE_TISSUE_TEMPLATE:HORN:HORN_TEMPLATE]
                [TISSUE_LAYER_OVER:BY_CATEGORY:HORN:DERMAL]
		[ATTACK:HGORE:BODYPART:BY_CATEGORY:HORN]
				[ATTACK_SKILL:BITE]
				[ATTACK_VERB:gore:gores]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:3:3]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:MAIN]
			
                ]]},
                weight = 20
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
	
	
	     procgen_subchart_table_ogre_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright humanoid body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "WEAPON", "MILITARY", "SERVANT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an upright humanoid body, thin yet thick-boned and heavy-limbed, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "WEAPON", "MILITARY", "SERVANT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunched-over humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunched-over humanoid body, with ",
        eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "CARRIER", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an incredibly broad and squat humanoid body, with ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "CARRIER", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "Its body is not hunched so much as folded in on itself, appearing as a great irregular mound of toughened flesh, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "MILITARY", "CARRIER", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_head",
		"procgen_subchart_table_ogre_arms",
		"procgen_subchart_table_ogre_legs",
		"procgen_subchart_table_ogre_other"
		}
            }
			},
			
			
        procgen_subchart_table_ogre_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is exceptionally humanoid, toughened skin smoothed into a human-like visage by the vanity of some ancient ancestor, with ",
				eligible_rating_tags = {"SOPHONT"},
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
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
			
                ]]},
                weight = 10,
		next_tables = {
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_ogre_mouth",
		"procgen_subchart_table_ogre_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is a weathered visage rendered uncanny by the sheer degree of its deterioration, with ",
				eligible_rating_tags = {"SOPHONT", "SERVANT"},
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
		"procgen_subchart_table_ogre_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_ogre_mouth",
		"procgen_subchart_table_ogre_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is a weathered visage marred by predatory contours, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "SERVANT"},
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
		"procgen_subchart_table_ogre_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:2NOSEHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is bestial, its brow and forehead humanoid but below that its jaw and snout protrude into a broad, blunt muzzle, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
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
		"procgen_subchart_table_ogre_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARHOLE:2NOSEHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is a skull of thick but tighly-wrapped flesh, its lipless grin exposing metal teeth.",
        eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "SERVANT", "CARRIER", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
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
		"procgen_subchart_table_ogre_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_ogreskull_mouth",
		"procgen_subchart_table_ogre_hair"
		}
            }
			},
			
	
	
        procgen_subchart_table_ogre_neck = {
            {    
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

				
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "a tapering, short neck that places it jutting forward from between its shoulders, ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
			
	
        procgen_subchart_table_ogre_mouth = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "a humanoid mouth with large, blocky teeth. ",
				eligible_rating_tags = {"SOPHONT"},
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
                desc_part = "a humanoid mouth with long, straight, pointed teeth teeth. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
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
            }
            },
				
	
        procgen_subchart_table_ogreskull_mouth = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH:CHEEKS", 
                desc_part = "a lipless mouth with long, straight, pointed teeth teeth. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
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
            }
            },
				
	
	
	
        procgen_subchart_table_ogre_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
	[USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
	[USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
	[TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
	[BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:HIGH_POSITION:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyebrows:PLURAL]
        [SET_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyelashes:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
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
                desc_part = "It has hair on its head and running down its neck like a mane, but otherwise lacks it. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
	
	
        procgen_subchart_table_ogre_arms = {
            {     
                body_token = "", 
                desc_part = "It lacks arms entirely. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
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
		"procgen_subchart_table_ogre_fingers"
		}
            },
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two disproportionately long humanoid arms end in ",
				eligible_rating_tags = {"SOPHONT", "AVATAR", "DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_fingers"
		}
            },
            {     
                body_token = ":BASIC_3PARTARMS_APE", 
                desc_part = "It has elongated arms it walks on with its knuckles, ending in ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and two others just below, ending in ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and two others just below, ending in ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "DOMESTIC"},
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
		"procgen_subchart_table_ogre_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_ogre_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five strong fingers. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS", 
                desc_part = "five strong, thick-clawed fingers. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                body_token = ":2FINGERS", 
                desc_part = "crude, metal-sheathed mitts. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
			
	
			
	
        procgen_subchart_table_ogre_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "SERVANT"},
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
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_ogre_feet",
		"procgen_subchart_table_ogre_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a long pair of pillar-like legs, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "SERVANT", "EXISTENTIAL"},
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
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_ogre_feet",
		"procgen_subchart_table_ogre_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of legs with powerful thighs that taper to sinewy points, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
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
		"procgen_subchart_table_ogre2_feet",
		"procgen_subchart_table_ogre_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has an enlarged lower body with four squat, splayed mechanical legs, ending in ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC", "EXISTENTIAL"},
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
		"procgen_subchart_table_ogre_feet",
		"procgen_subchart_table_ogre_tail"
		}
            },
            {     
                body_token = ":6LEG", 
                desc_part = "It has an enlarged lower body with six squat, mechanical splayed legs, ending in ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC", "EXISTENTIAL"},
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
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_ogre_feet",
		"procgen_subchart_table_ogre_tail"
		}
            }
            },
			
	
        procgen_subchart_table_ogre_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "stumpy feet. ",
				eligible_rating_tags = {"SOPHONT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":5TOES", 
                desc_part = "clawed, stumpy feet. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
                desc_part = "pillar-like feet. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "blunt metallic hooves. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
	
        procgen_subchart_table_ogre2_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "clawed, stumpy feet. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "SERVANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
                desc_part = "blunt metallic hooves. ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
        procgen_subchart_table_ogre_tail = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "HOSTILE", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER","DOMESTIC", "SOPHONT", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
			
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a short, thick, spine-like tail. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "CARRIER", "DOMESTIC"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail ending in a sharpened blade. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:slash:slashes]
				[ATTACK_CONTACT_PERC:200]
				[ATTACK_PENETRATION_PERC:200]
				[ATTACK_FLAG_EDGE]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
                ]]},
                weight = 50
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail ending in a mess of metallic needles it can hurl with inhuman accuracy. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
						[CDI:ADV_NAME:Hurl]
						[CDI:USAGE_HINT:ATTACK]
						[CDI:BP_REQUIRED:BY_CATEGORY:TAIL]
						[CDI:MATERIAL:INORGANIC:META_ALLOY:SHARP_ROCK]
						[CDI:TARGET:C:LINE_OF_SIGHT]
						[CDI:TARGET_RANGE:C:15]
						[CDI:MAX_TARGET_NUMBER:C:1]
						[CDI:WAIT_PERIOD:60]
					[CDI:VERB:launch a spine:launches a spine:NA]
				
                ]]},
                weight = 10
            }
            },
	
	
	
        procgen_subchart_table_ogre_other = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                ]]},
                weight = 80
            },
            {     
                body_token = "", 
                desc_part = "The struts of something like a powered exoskeleton are seamlessly melded with its flesh, granting absurd strength even compared to its peers. ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL" },
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
				attribute_weight = { 
				STRENGTH = "++"
				},
                tok = {[[
			
                ]]},
                weight = 20
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
	
	
	     procgen_subchart_table_horror_body = {
            {    
                body_token = "", 
                desc_part = "It has a crooked, hunched-over body, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_horror_head",
		"procgen_subchart_table_horror_arms",
		"procgen_subchart_table_horror_legs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a elongated, misshapen body, with ",
				eligible_rating_tags = {"INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_head",
		"procgen_subchart_table_horror_arms",
		"procgen_subchart_table_horror_legs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a squat, misshapen body, with ",
				eligible_rating_tags = {"INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_head",
		"procgen_subchart_table_horror_arms",
		"procgen_subchart_table_horror_legs"
		}
            }
			},
			
			
        procgen_subchart_table_horror_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is exceptionally humanoid, toughened skin smoothed into a comely visage by the vanity of some ancient ancestor, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_eyes",
		"procgen_subchart_table_horror_mouth",
		"procgen_subchart_table_horror_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:NOSE:THROAT:NECK:SKULL", 
                desc_part = "Its head is superficially humanoid, the contours of its visage and shape of its eyes evoking some primordial predator, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_neck",
		"procgen_subchart_table_horror_eyes",
		"procgen_subchart_table_horror_mouth",
		"procgen_subchart_table_horror_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:2NOSEHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is bestial, its brow and forehead humanoid but below that its jaw and snout protrude into a predatory muzzle, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
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
		"procgen_subchart_table_horror_neck",
		"procgen_subchart_table_horror_eyes",
		"procgen_subchart_table_horror_mouth",
		"procgen_subchart_table_horror_hair"
		}
            }
            },
	
	
        procgen_subchart_table_horror_neck = {
            {    
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "a thick, tapering neck, ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "an elongated neck as thick as its skull, ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
        procgen_subchart_table_horror_eyes = {
            {    
                body_token = ":2EYESOCKET", 
                desc_part = "glowing beads of light embedded inside empty eye sockets, and ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
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
                body_token = ":4EYESOCKET", 
                desc_part = "glowing beads of light embedded inside four empty eye sockets, and ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
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
                body_token = ":6EYESOCKET", 
                desc_part = "glowing beads of light embedded inside six empty eye sockets, and ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 40
            },
            {     
                body_token = "", 
                desc_part = "eyes obscured by a mass of sensory bulbs and antennae, and ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				[EXTRAVISION]
				
                ]]},
                weight = 10

            }
            },
	
			
			
	
        procgen_subchart_table_horror_mouth = {
            {    
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a lipless mouth with tangled, curving metallic teeth. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
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
                body_token = ":MOUTH:TONGUE:TEETH", 
                desc_part = "a lipless mouth with tangled, curving metallic teeth, ringed by fleshy feelers. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
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
                desc_part = "a lipless mouth with tangled, curving metallic teeth, edges extending into seams stretching across its cheeks and halfway down its neck, metallic fangs protruding slightly from the creases that can split into an unhinged jaw in seconds. ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:TOOTH:DERMAL]

	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:400]
		[ATTACK_PENETRATION_PERC:200]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 50
            }
            },
				
	
	
	
        procgen_subchart_table_horror_hair = {
            {    
                body_token = "", 
                desc_part = "It has thin strands of hair on its head, but otherwise lacks it. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

				
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
			[TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:1:2:3:4:5:6]
				[APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It has thin strands of hair on its head and running down its neck like a mane, but otherwise lacks it. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
                tok = {[[

				
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
				
				  [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:WHITE:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:ORANGE:1]
                [TLCM_NOUN:crash avoiding placeholder:SINGULAR]
                [TLCM_TIMING:ROOT:50000:0:900000:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
			[TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:1:2:3:4:5:6]
				[APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
	
	
	
        procgen_subchart_table_horror_arms = {
            {     
                body_token = "", 
                desc_part = "It lacks arms entirely. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":BASIC_3PARTARMS", 
                desc_part = "Its two humanoid arms end in ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_fingers"
		}
            },
            {     
                body_token = ":BASIC_3PARTARMS_APE", 
                desc_part = "Its two front limbs are arm-like, elongated and ending in ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_fingers"
		}
            },
            {     
                body_token = ":2WINGS", 
                desc_part = "It has two large, foldable wings combining armored shell and stretched membrane, thrusters extruding near the area they connect to the torso ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:327:218:109:1900:2900] 80 kph
                ]]},
                weight = 50
            },
            {     
                body_token = ":2WINGS:BASIC_3PARTARMS", 
                desc_part = "It has two foldable wings combining armored shell and stretched membrane, thrusters extruding near the area they connect to the torso, and a pair of humanoid arms that end in ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
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
		"procgen_subchart_table_horror_fingers"
		}
            },
            {     
                body_token = ":4ARMS", 
                desc_part = "It has two sets of arms, one pair at its shoulders and another emerging from its midsection, ending in ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_fingers"
		}
            },
            {     
                body_token = ":6ARMS", 
                desc_part = "It has three sets of arms, one pair at its shoulders, another emerging from its midsection, and a third pair hanging from its back, ending in ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_fingers"
		}
            }
            },
			
			
        procgen_subchart_table_horror_fingers = {
            {     
                body_token = ":5FINGERS", 
                desc_part = "five clawed fingers. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                desc_part = "five elongated, clawed fingers. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
                desc_part = "five elongated, clawed fingers ending in blade-like talons. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
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
	
			
	
        procgen_subchart_table_horror_legs = {
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of humanoid legs, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_feet",
		"procgen_subchart_table_horror_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a long pair of backwards-bent legs, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_horror_feet",
		"procgen_subchart_table_horror_tail"
		}
            },
            {     
                body_token = ":BASIC_3PARTLEGS", 
                desc_part = "It has a pair of perpetually bent, bestial legs, with ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_horror_feet",
		"procgen_subchart_table_horror_tail"
		}
            },
            {     
                body_token = ":4LEG", 
                desc_part = "It has four legs splayed out to its sides, ending in ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_feet",
		"procgen_subchart_table_horror_tail"
		}
            },
            {       
                body_token = ":6LEG", 
                desc_part = "It has six legs splayed out to its sides, ending in ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
		"procgen_subchart_table_horror_feet",
		"procgen_subchart_table_horror_tail"
		}
            },
            {     
                body_token = ":TAIL_STANCE", 
                desc_part = "Its lower body is made up of a muscular spine-like tail, with many small spike-tipped legs allowing it to crawl over the ground. ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
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
	
			
	
        procgen_subchart_table_horror_feet = {
            {     
                body_token = ":5TOES", 
                desc_part = "simple clawed feet. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:DERMAL:FRONT]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:DERMAL]
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
                desc_part = "sharp metallic spines. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
                ]]},
                weight = 50
            }
            },
	
	
        procgen_subchart_table_horror_tail = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
			
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thin, spine-like tail. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail. ",
				eligible_rating_tags = {"VESSEL", "HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:lash:lashes]
				[ATTACK_CONTACT_PERC:100]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail ending in a sharpened blade. ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
        [TISSUE_LAYER:BY_CATEGORY:TAIL:DERMAL:FRONT]
				[ATTACK:KICK:BODYPART:BY_CATEGORY:TAIL]
				[ATTACK_SKILL:STANCE_STRIKE]
				[ATTACK_VERB:slash:slashes]
				[ATTACK_CONTACT_PERC:200]
				[ATTACK_PENETRATION_PERC:200]
				[ATTACK_FLAG_EDGE]
				[ATTACK_PREPARE_AND_RECOVER:4:4]
				[ATTACK_FLAG_WITH]
				[ATTACK_PRIORITY:SECOND]
				[ATTACK_FLAG_BAD_MULTIATTACK]
				
                ]]},
                weight = 50
            },
            {     
                body_token = ":TAIL", 
                desc_part = "It has a long, thick, spine-like tail ending in a mess of metallic needles it can hurl with inhuman accuracy. ",
				eligible_rating_tags = {"HOSTILE", "INCURSION", "WEAPON", "MILITARY", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
						[CDI:ADV_NAME:Hurl]
						[CDI:USAGE_HINT:ATTACK]
						[CDI:BP_REQUIRED:BY_CATEGORY:TAIL]
						[CDI:MATERIAL:INORGANIC:META_ALLOY:SHARP_ROCK]
						[CDI:TARGET:C:LINE_OF_SIGHT]
						[CDI:TARGET_RANGE:C:15]
						[CDI:MAX_TARGET_NUMBER:C:1]
						[CDI:WAIT_PERIOD:60]
					[CDI:VERB:launch a spine:launches a spine:NA]
				
                ]]},
                weight = 10
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
                desc_part = "form-fitting B-tech dermal plating grows melded to its body, growing denser at the extremities. ",
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:BIOMACHINE_FEMALE][POP_RATIO:10000]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:BIOMACHINE_MALE][POP_RATIO:10000]
					]],
                    description_addon = ""
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 100,
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "VESSEL", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
			eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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