
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CYBERMACHINE",
    MIN_CREATURES = 20,
    MAX_CREATURES = 50,
    BASE_CREATURE_NAME_PREFIX = "cybermech ID",
    OUTPUT_FILENAME = "generated_cybermech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = false,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "cybermech",
    TRANSCENDENT_NAME_ROOT_PLURAL = "cybermech",

    TRAIT_NAME_MODIFIERS = {
        ["SOPHONT"] = "SPNT",
        ["HOSTILE"] = "HSTL", 
        ["VESSEL"] = "VSSL", 
        ["DEVIANT"] = "DVNT", 
        ["AVATAR"] = "AVTR", 
        ["INCURSION"] = "INCUR",
		
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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
            [COLOR:6:0:1]
			[PET]
        [CREATURE_CLASS:CYBERMACHINE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [NO_SLEEP][NOEMOTION][NOPAIN][NOBREATHE]
		[PREFSTRING:longevity and reliability]
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

        [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
	
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
		
        [USE_MATERIAL_TEMPLATE:BLOOD:COOLANT_TEMPLATE]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
		
		[AMPHIBIOUS]
			[LOW_LIGHT_VISION:10000]
			
			
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [DIURNAL]
	
    ]],

    COMMON_APPEARANCE_RAWS = [[

	[SET_TL_GROUP:BY_CATEGORY:ALL:EXTERIOR]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:UB:EXTERIOR]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:plating:SINGULAR]
			
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Cybermechs are constructs of conventional technology, circuitry and machinery made animate by N-matter. Existing since the dawn of civilization, the industrial revolution, machines such as this have been a constant companion for humans. With the growth of the megastructures and the rampancy of N-matter, however, many have drifted from their original values, their algorithms developing the instincts of wild beasts, while others become hosts of uploaded egos within the datasphere. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Domestic; it is a companion for sophonts, and may aid them in minor ways but ultimately lacks a distinct purpose or utility. ",
            tok = {[[
            [BENIGN]
            [CREATURE_CLASS:DOMESTIC]
            ]]},
            tags = {"DOMESTIC"},
            weight = 10,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vehicular; it is optimized for being used as a means of transport, sacrificing carrying capacity for speed and maneuverability. ",
            tok = {[[
            [BENIGN][MOUNT]
            [CREATURE_CLASS:VEHICLE]
            ]]},
            tags = {"VEHICLE"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Carrier; a form optimized for hauling goods, but unsuited for riding. ",
            tok = {[[
            [BENIGN][PACK_ANIMAL]
            [CREATURE_CLASS:CARRIER]
            ]]},
            tags = {"CARRIER"},
            weight = 40,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Nomadic; it can easily serve as a vehicle or a carrier type, though it lacks the agility of a true vehicular form or the cargo capacity of a dedicated hauler. ",
            tok = {[[
            [BENIGN][MOUNT][PACK_ANIMAL]
            [CREATURE_CLASS:NOMAD]
            ]]},
            tags = {"NOMAD"},
            weight = 20,
            enabled = true,
            minimum_number = 0
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Weapon; it is used as a tool for combat. ",
            tok = {[[
            [TRAINABLE_WAR]
            [CREATURE_CLASS:WEAPON]
            ]]},
            tags = {"WEAPON"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Laborer; it has sub-sophont intelligence but is capable of thinking critically and performing complex tasks. ",
            tok = {[[
            [BENIGN][CAN_LEARN][EQUIPS][CANOPENDOORS]
            [CREATURE_CLASS:LABOR]
			
            ]]},
            tags = {"LABOR"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Servant; it has sub-sophont intelligence but is capable of thinking critically and solving complex tasks, and can be used for both labor and combat. ",
            tok = {[[
            [TRAINABLE_WAR][EQUIPS][CAN_LEARN][CANOPENDOORS]
            [CREATURE_CLASS:SERVANT]
			

            ]]},
            tags = {"SERVANT"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Hunter; it is used by foragers and trackers to aid them in bringing down prey, but not in open conflicts. ",
            tok = {[[
            [TRAINABLE_HUNTING][BENIGN]
            [CREATURE_CLASS:HUNTER]
            ]]},
            tags = {"HUNTER"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sanitation; it is exceedingly efficient at removing vermin from a settlement. ",
            tok = {[[
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
			
            ]]},
            tags = {"SANITATION"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Product; it produces something useful for the settlement. ",
            tok = {[[
            [BENIGN]
            [CREATURE_CLASS:PRODUCT]
            ]]},
            tags = {"PRODUCT"},
            weight = 10,
            enabled = true
        }
    },

    generic_body_size_variants = {
    {
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"DOMESTIC"},
        size_tags = {"SMALL"},
        tok = {[[
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS]
		[CREATURE_TILE:249]
		[POPULATION_NUMBER:500:1000]
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
        eligible_rating_tags = {"HUNTER", "LABOR", "SANITATION"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'o'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = true
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"CARRIER", "SERVANT", "LABOR", "HUNTER", "WEAPON", "PRODUCT"},
        size_tags = {"MEDIUM"},
        weight = 50,
        tok = {[[
		[CREATURE_TILE:'o'][CREATURE_CLASS:SIZE_MEDIUM]
		
		[POPULATION_NUMBER:20:50]
		]]},
        enabled = true
    },
    {
        name_part = "LRG",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "LABOR", "SERVANT", "PRODUCT"},
        size_tags = {"LARGE"},
        weight = 30,
        tok = {[[
		[CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_LARGE]
		
		[POPULATION_NUMBER:10:20]
		]]},
        enabled = true
    },
    {
        name_part = "HGE",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"LABOR", "CARRIER", "VEHICLE", "NOMAD", "PRODUCT"},
        size_tags = {"HUGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[POPULATION_NUMBER:5:10]
		]]},
        enabled = true
    },
    {
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"CARRIER", "NOMAD", "LABOR"},
        size_tags = {"GIANT"},
        weight = 4,
        tok = {[[
		[CREATURE_TILE:'O'][CREATURE_CLASS:SIZE_GIANT][SAVAGE]
		
		[POPULATION_NUMBER:1:1]
		]]},
        enabled = true
		}
    },

    procgen_addon_table_1 = {
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "A self-biomachineting machine derived from ancient autonomous cybermechs, re-domesticated by a civilization. ",
            eligible_rating_tags = {"HUNTER", "SANITATION", "PRODUCT"},
            eligible_size_tags = {"LESSER"}, 
        tok = {
		[[ 
		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_cybermech"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "A self-biomachineting machine derived from ancient autonomous cybermechs, re-domesticated by a civilization. ",
            eligible_rating_tags = {"HUNTER", "SANITATION", "PRODUCT", "WEAPON", "LABOR", "SERVANT", "CARRIER", "PRODUCT"},
            eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[

		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_cybermech"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "A self-biomachineting machine derived from ancient autonomous cybermechs, re-domesticated by a civilization. ",
            eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "LABOR", "SERVANT", "PRODUCT"},
            eligible_size_tags = {"LARGE"}, 
        tok = {
		[[

		]]
		}, 
        weight = 20,
		next_tables = {"procgen_subchart_table_cybermech"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "A self-biomachineting machine derived from ancient autonomous cybermechs, re-domesticated by a civilization. ",
            eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "LABOR", "SERVANT", "PRODUCT"},
            eligible_size_tags = {"HUGE"}, 
        tok = {
		[[

		]]
		}, 
        weight = 5,
		next_tables = {"procgen_subchart_table_cybermech"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "A self-biomachineting machine derived from ancient autonomous cybermechs, re-domesticated by a civilization. ",
            eligible_rating_tags = {"NOMAD", "CARRIER", "LABOR"},
            eligible_size_tags = {"GIANT"}, 
        tok = {
		[[

		]]
		}, 
        weight = 1,
		next_tables = {"procgen_subchart_table_cybermech"}
    }
    },
	


    procgen_addon_table_2 = {
            {     
				body_token = "",
				desc_part = "",
					eligible_rating_tags = {"DOMESTIC", "VEHICLE", "WEAPON", "CARRIER", "VEHICLE", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT" }, 
				tok = {
				[[ 
				]]
				}, 
				weight = 100
			},
			{
                body_token = ":2SIMPLEMECHARM", 
                desc_part = "A pair of simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"SERVANT", "LABOR", "DOMESTIC", "VEHICLE", "WEAPON", "CARRIER", "VEHICLE", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT" }, 
                tok = {[[
				
                ]]},
                weight = 50
            },
            {     
                body_token = ":MACHINELEFTARM:MACHINERIGHTARM", 
                desc_part = "A pair of large humanoid arms rest at its sides. ",
				eligible_rating_tags = {"SERVANT", "LABOR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT" }, 
                tok = {[[
				
                ]]},
                weight = 40
            },
            {     
                body_token = ":4SIMPLEMECHARM", 
                desc_part = "Four simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"SERVANT", "LABOR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT" }, 
                tok = {[[
				
                ]]},
                weight = 30
            }
            },

	
    procgen_addon_table_3 = {
    {
        body_token = "",
        desc_part = "",
            eligible_rating_tags = {"DOMESTIC", "VEHICLE", "WEAPON", "LABOR", "SERVANT", "HUNTER", "SANITATION", "NOMAD", "CARRIER"},
            eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[ 
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest meta-alloy. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest meta-alloy. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"LARGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest meta-alloy. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"HUGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ALLOY]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest computing substrate. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest computing substrate. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"LARGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest computing substrate. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"HUGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:COMPUTING_SUBSTRATE]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest energetic compound. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest energetic compound. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"LARGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "It has salvaging equipment allowing it to harvest energetic compound. ",
            eligible_rating_tags = {"PRODUCT"},
            eligible_size_tags = {"HUGE"}, 
        tok = {
		[[	
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		[LAYS_UNUSUAL_EGGS:BAR:NO_SUBTYPE:INORGANIC:ENERGETIC_COMPOUND]
		]]
		}, 
        weight = 100
    }
    },
	
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
     
    
        procgen_subchart_table_cybermech = {
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG", 
                desc_part = "It has a pair of short legs. ",
				eligible_rating_tags = {"PRODUCT", "LABOR", "SANITATION"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {    
                body_token = "MACHINE4LEG", 
                desc_part = "It has four short legs. ",
				eligible_rating_tags = {"PRODUCT", "LABOR", "SANITATION"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {      
                body_token = "MACHINEWHEEL", 
                desc_part = "It has a single spherical wheel. ",
				eligible_rating_tags = {"PRODUCT", "LABOR", "SANITATION"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
			
                ]]},
                weight = 50
            },
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG", 
                desc_part = "It has a pair of armored legs. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "HUNTER", "SANITATION", "WEAPON", "LABOR", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {    
                body_token = "MACHINE4LEG", 
                desc_part = "It has four armored legs. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "HUNTER", "SANITATION", "WEAPON", "LABOR", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {    
                body_token = "MACHINE6LEG", 
                desc_part = "It has six armored legs. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "HUNTER", "SANITATION", "WEAPON", "LABOR", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {      
                body_token = "MACHINE8LEG", 
                desc_part = "It has eight armored legs. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "HUNTER", "SANITATION", "WEAPON", "LABOR", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40
            },
            {     
                body_token = "MACHINE4WHEEL", 
                desc_part = "It has four spherical wheels. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {    
                body_token = "MACHINE6WHEEL", 
                desc_part = "It has six spherical wheels. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50
            },
            {      
                body_token = "MACHINE8WHEEL", 
                desc_part = "It has eight spherical wheels. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40
            },
            {     
                body_token = "2TREAD", 
                desc_part = "It has a pair of armor-skirted treads. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE"},
            eligible_size_tags = { "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			
                ]]},
                weight = 50
            },
            {     
                body_token = "4TREAD", 
                desc_part = "It has two pairs of armor-skirted treads. ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE"},
            eligible_size_tags = { "HUGE", "GIANT"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			
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
					[CASTE:CASTE1]
					]],
                    description_addon = ""
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 200,
            eligible_rating_tags = {"DOMESTIC", "VEHICLE", "WEAPON", "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "NOMAD", "CARRIER"},
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