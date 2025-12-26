
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "POLYMERID",
    MIN_CREATURES = 50,
    MAX_CREATURES = 200,
    BASE_CREATURE_NAME_PREFIX = "polymerid ID",
    OUTPUT_FILENAME = "generated_polymerid_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "polymerid",
    TRANSCENDENT_NAME_ROOT_PLURAL = "polymerids",

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
        { name = "component_3", table_key = "procgen_addon_table_3" }
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_CLASS:POLYMERID]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        
		[PREFSTRING:versatility and low cost]
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

[BODY_DETAIL_PLAN:STANDARD_MATERIALS]
		[REMOVE_MATERIAL:HAIR]
		[REMOVE_MATERIAL:BONE]
	[BODY_DETAIL_PLAN:STANDARD_TISSUES]
		[REMOVE_TISSUE:HAIR]
		[REMOVE_TISSUE:BONE]
	[BODY_DETAIL_PLAN:EXOSKELETON_TISSUE_LAYERS:SKIN:FAT:MUSCLE]

	[TISSUE:PLASTIC]
		[TISSUE_NAME:plastic:NP]
		[TISSUE_MATERIAL:INORGANIC:PLASTICWARE]
		[HEALING_RATE:100]
		[RELATIVE_THICKNESS:6]
		[CONNECTS]
		[TISSUE_SHAPE:LAYER]
	[TISSUE_LAYER_OVER:BY_CATEGORY:ALL:PLASTIC]

				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:click:clicks:clicking]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:buzz:buzzes:buzzing]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:chitter:chitters:chittering]

	[HAS_NERVES]
	[USE_MATERIAL_TEMPLATE:ICHOR:ICHOR_TEMPLATE]
	[BLOOD:LOCAL_CREATURE_MAT:ICHOR:LIQUID]
	[CREATURE_CLASS:GENERAL_POISON]
	[GETS_WOUND_INFECTIONS]
	[GETS_INFECTIONS_FROM_ROT]
	[USE_MATERIAL_TEMPLATE:PUS:PUS_TEMPLATE]
	[PUS:LOCAL_CREATURE_MAT:PUS:LIQUID]
	[BODY_APPEARANCE_MODIFIER:LENGTH:90:95:98:100:102:105:110]
	[ALL_ACTIVE]
	[NO_SLEEP]
	[NO_DIZZINESS]
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]
	[SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
		[TL_COLOR_MODIFIER:PINK:1:PALE_PINK:1:DARK_PINK:1]
			[TLCM_NOUN:skin:SINGULAR]

    ]],

    COMMON_APPEARANCE_RAWS = [[
			
		
		
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Polymerids are the descendants of engineered scavengers, recyclers, and bioweapons of the Transitional Era, displacing conventional invertebrates and filling many of the niches they once occupied, along with ones once filled by larger creatures. _______________________________________________________ __________",
    },

 
    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Domestic; it is a companion for sophonts, and may aid them in minor ways but ultimately lacks a distinct purpose or utility. ",
            tok = {[[
            [BENIGN]
            [HUNTS_VERMIN]
			[GOBBLE_VERMIN_CLASS:VERMIN]
			[GOBBLE_VERMIN_CLASS:AMBIENT]
            [CREATURE_CLASS:DOMESTIC]
            ]]},
            tags = {"DOMESTIC"},
            weight = 10,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vehicular; it is optimized for being used as a means of transport, sacrificing carrying capacity for speed and maneuverability. ",
            tok = {[[
            [BENIGN][MOUNT]
            [CREATURE_CLASS:VEHICULAR]
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
            enabled = false
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
            enabled = false
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
            name_part = "LSR", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 1,
            base_adult_size_for_random = 1000,
            body_size_index_and_child_count = 1,
            eligible_rating_tags = {"SANITATION", "HUNTER"},
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_TILE:'*'][CREATURE_CLASS:SIZE_LESSER]
            
            [POPULATION_NUMBER:250:500]
            ]]}, 
            weight = 30, 
            enabled = true
        },
        {
            name_part = "MDM",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 5,
            eligible_rating_tags = {"SANITATION", "HUNTER", "WEAPON", "PRODUCT", "CARRIER"},
            size_tags = {"MEDIUM"}, 
            weight = 50, 
            tok = {[[
           
        [CREATURE_TILE:'*']
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
            min_raw_size_factor = 100,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 10,
            eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "WEAPON", "PRODUCT"},
            size_tags = {"LARGE"}, 
            weight = 20, 
            tok = {[[
            [CREATURE_TILE:015][CREATURE_CLASS:SIZE_LARGE]
            
            [POPULATION_NUMBER:20:100]
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
            min_raw_size_factor = 1000,
            base_adult_size_for_random = 1000000,
            body_size_index_and_child_count = 15,
            eligible_rating_tags = {"CARRIER", "NOMAD", "VEHICLE", "WEAPON", "PRODUCT"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:015][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            [SAVAGE]
            [POPULATION_NUMBER:10:50]
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
            min_raw_size_factor = 1000,
            base_adult_size_for_random = 10000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"CARRIER", "NOMAD", "PRODUCT"},
            size_tags = {"GIANT"}, 
            tok = {[[
			[CREATURE_TILE:015][CREATURE_CLASS:SIZE_GIANT]
            [SAVAGE]
            [POPULATION_NUMBER:5:10]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 2,
            enabled = true
        }
    },

    procgen_addon_table_1 = {
     
        {
            body_token = "",
            desc_part = "An invertebrate creature with an exoskeleton of hardened plastic concealing soft, pallid flesh underneath, possessing a thin, semi-translucent exterior of thick, spiny segments, found within the layers of biomatter present in the more organic regions of the Megastructures. ",
            eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
            tok = {[[]
			
			[COLOR:6:0:0]
				 
	[SET_TL_GROUP:BY_CATEGORY:ALL:PLASTIC]
		[TL_COLOR_MODIFIER:BROWN:1]
			[TLCM_NOUN:shell:SINGULAR]
				
			
			]]}, 
            weight = 20
        }
    },
	
	   procgen_addon_table_2 = {
    
		{
                body_token = "INSECT_PLASTIC:2EYES:HEART:GUTS_PLASTIC:BRAIN:MOUTH:",
                desc_part = "It has a three-part body with ",
            eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_bug"}
            },
			{
                body_token = "SPIDER_PLASTIC:2EYES:HEART:GUTS_PLASTIC:BRAIN:MOUTH:",
                desc_part = "It has a two-part body with ",
            eligible_rating_tags = {"CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_spider"}
            },
			{
                body_token = "CRAB_BODY_PLASTIC:2EYES:HEART:GUTS:BRAIN:MOUTH:",
                desc_part = "It has a squat, flat one-part body with ",
            eligible_rating_tags = {"CARRIER", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_crab"}
            },
            {
                body_token = "CRAB_BODY_PLASTIC:2EYES:HEART:GUTS:BRAIN:MOUTH:",
                desc_part = "It has a domed one-part body with ",
            eligible_rating_tags = {"CARRIER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_crab"}
            },
            {
                body_token = "BASIC_1PARTBODY:BASIC_HEAD:2EYES:HEART:GUTS:BRAIN:MOUTH:",
                desc_part = "It has a long, sinuous segmented body with ",
            eligible_rating_tags = {"WEAPON", "HUNTER"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_crawler"}
            },
            {
                body_token = "BASIC_1PARTBODY:BASIC_HEAD:2EYES:HEART:GUTS:BRAIN:MOUTH:",
                desc_part = "It has a squat, domed segmented body with ",
				eligible_rating_tags = {"CARRIER", "NOMAD", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 25, 
				next_tables = {"procgen_subchart_table_crawler"}
	
        }
    },
	
	
	   procgen_addon_table_3 = {
    
		{
                body_token = "LARGE_MANDIBLES",
                desc_part = "It has small, blunt mandibles and scraping mouthparts. ",
            eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
	[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:50]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 50
            },
			{
                body_token = "LARGE_MANDIBLES",
                desc_part = "It has large, blunt mandibles and scraping mouthparts. ",
            eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
	[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 50
            },
			{
                body_token = "LARGE_MANDIBLES",
                desc_part = "It has large, sickle-like mandibles and cutting mouthparts. ",
            eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
	[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 25
            },
			{
                body_token = "LARGE_MANDIBLES",
                desc_part = "It has downward-facing fang-like mandibles and grasping pedipalps. ",
            eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON", "HUNTER"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
	[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:MAIN]
		[ATTACK_FLAG_CANLATCH]
				]]}, 
                weight = 25
            }
        
    },
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
        procgen_subchart_table_bug = {
			{
                body_token = "6LEG:",
                desc_part = "six short, stubby legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "6LEG:",
                desc_part = "six long legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "6LEG:",
                desc_part = "four long front legs and two even longer rear ones, allowing it to jump great distances. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "4LEG:UPPERBODY_PINCERS:",
                desc_part = "four short, stubby legs and two front legs modified into powerful pincers",
				transcendent_desc_part = "",
				eligible_rating_tags = {"NOMAD", "WEAPON"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
	[APPLY_CREATURE_VARIATION:PINCER_ATTACK]
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "6LEG:2WINGS:",
                desc_part = "six long legs and a pair of narrow, transparent wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "6LEG:4WINGS:",
                desc_part = "six long legs and two pairs of narrow, transparent wings. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON", "HUNTER"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "6LEG:4WINGS:",
                desc_part = "six long legs and a pair of flowing wings colored like oil on water, resembling the beautiful pollinators of the homeworld. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "NOMAD", "SANITATION"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            }
         
    },
	
	
	
        procgen_subchart_table_spider = {
			{
                body_token = "8LEG:",
                desc_part = "eight short, thick legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "8LEG:",
                desc_part = "eight long legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "8LEG:",
                desc_part = "six long front legs and two even longer rear ones, allowing it to jump great distances. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON", "HUNTER", "SANITATION"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            },
			{
                body_token = "4LEG:UPPERBODY_PINCERS:",
                desc_part = "six short, stubby legs and two front legs modified into powerful pincers",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "NOMAD", "WEAPON"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
	[APPLY_CREATURE_VARIATION:PINCER_ATTACK]
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_abdomen"}
            }
         
    },
	
	
	
        procgen_subchart_table_crab = {
			{
                body_token = "6LEG:",
                desc_part = "six short, thick legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "8LEG:",
                desc_part = "eight short, thick legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "6LEG:",
                desc_part = "six long legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "8LEG:",
                desc_part = "eight long legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "8LEG:",
                desc_part = "six long front legs and two even longer rear ones, allowing it to jump great distances. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "4LEG:UPPERBODY_PINCERS:",
                desc_part = "six short, stubby legs and two front legs modified into powerful pincers",
				transcendent_desc_part = "",
				eligible_rating_tags = {"CARRIER", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				
	[APPLY_CREATURE_VARIATION:PINCER_ATTACK]
				]]}, 
                weight = 50
            }
         
    },
	
	
        procgen_subchart_table_crawler = {
			{
                body_token = "",
                desc_part = "many short, thin legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_webmouth"}
            },
			{
                body_token = "",
                desc_part = "many short, thick legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8390:8204:8040:4388:8989:9567] 2 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_webmouth"}
            },
			{
                body_token = "",
                desc_part = "many long, thin legs. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = { "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[CANNOT_JUMP]
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_webmouth"}
				
            }
         
    },
	
        procgen_subchart_table_abdomen = {
    
		{
                body_token = "",
                desc_part = "It has a long, narrow, straight abdomen with ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_stinger"}
            },
			{
                body_token = "",
                desc_part = "It has a long, thick, straight abdomen with ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_stinger"}
            },
			{
                body_token = "",
                desc_part = "It has a short, thick, straight abdomen with ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 100, 
				next_tables = {"procgen_subchart_table_stinger"}
            },
			{
                body_token = "",
                desc_part = "It has a long, narrow, upwards-curving abdomen with ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_stinger"}
            },
			{
                body_token = "",
                desc_part = "It has a long, thick, outwards-flaring abdomen with horizontal fin-like tip. ",
				eligible_rating_tags = {"WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[AMPHIBIOUS][UNDERSWIM]
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It has a round, bloated abdomen capable of spraying webs of polymer at prey",
				eligible_rating_tags = {"WEAPON", "HUNTER"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				[THICKWEB]
				[WEBBER:CREATURE_MAT:SYNTHETIC:SILK]
	[CAN_DO_INTERACTION:MATERIAL_EMISSION]
		[CDI:ADV_NAME:Spray web]
		[CDI:USAGE_HINT:ATTACK]
		[CDI:BP_REQUIRED:BY_TOKEN:UB]
		[CDI:MATERIAL:CREATURE_MAT:SYNTHETIC:SILK:WEB_SPRAY]
		[CDI:TARGET:C:TOUCHABLE]
		[CDI:TARGET_RANGE:C:5]
		[CDI:MAX_TARGET_NUMBER:C:1]
		[CDI:WAIT_PERIOD:1200]
				
				]]}, 
                weight = 50
            }
         
    },
	
	      procgen_subchart_table_stinger  = {
    
		{
                body_token = "",
                desc_part = "a pair of antennae bristling at its end. ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 100
            },
			{
                body_token = "",
                desc_part = "a pair of pincers at its end. ",
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 30, 
				next_tables = {"procgen_subchart_table_stinger"}
            },
			{
                body_token = "STINGER:",
                desc_part = "a stinger containing dangerously harmful venom. ",
				eligible_rating_tags = {"WEAPON", "HUNTER"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				[USE_MATERIAL_TEMPLATE:VENOM:CREATURE_EXTRACT_TEMPLATE]
		[STATE_NAME:ALL_SOLID:congealed harmful polymerid venom]
		[STATE_ADJ:ALL_SOLID:congealed harmful polymerid venom]
		[STATE_NAME:LIQUID:harmful polymerid venom]
		[STATE_ADJ:LIQUID:harmful polymerid venom]
		[STATE_NAME:GAS:boiling harmful polymerid enom]
		[STATE_ADJ:GAS:boiling harmful polymerid venom]
		[PREFIX:NONE]
		[ENTERS_BLOOD]
		[SYNDROME]
			[SYN_NAME:polymerid sting]
			[SYN_AFFECTED_CLASS:ORGANIC_VULNERABLE]
			[SYN_INJECTED]
			[CE_NECROSIS:SEV:100:PROB:37:RESISTABLE:SIZE_DILUTES:LOCALIZED:VASCULAR_ONLY:START:100:PEAK:500:END:2400]
			[CE_NAUSEA:SEV:50:PROB:14:RESISTABLE:SIZE_DILUTES:START:50:PEAK:500:END:1500]
			[CE_FEVER:SEV:50:PROB:14:RESISTABLE:SIZE_DILUTES:START:50:PEAK:500:END:1500]
			[CE_PAIN:SEV:25:PROB:100:RESISTABLE:SIZE_DILUTES:LOCALIZED:VASCULAR_ONLY:START:100:PEAK:500:END:2400]
			
		[ATTACK:STING:BODYPART:BY_CATEGORY:STINGER]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:sting:stings]
		[ATTACK_CONTACT_PERC:5]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:2:2]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PRIORITY:MAIN]
		[SPECIALATTACK_INJECT_EXTRACT:LOCAL_CREATURE_MAT:VENOM:LIQUID:100:100]
				]]}, 
                weight = 50
            },
			{
                body_token = "STINGER:",
                desc_part = "a stinger containing lethal venom. ",
				eligible_rating_tags = {"WEAPON", "HUNTER"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 

				[USE_MATERIAL_TEMPLATE:VENOM:CREATURE_EXTRACT_TEMPLATE]
		[STATE_NAME:ALL_SOLID:congealed lethal polymerid venom]
		[STATE_ADJ:ALL_SOLID:congealed lethal polymerid venom]
		[STATE_NAME:LIQUID:lethal polymerid venom]
		[STATE_ADJ:LIQUID:lethal polymerid venom]
		[STATE_NAME:GAS:boiling lethal polymerid enom]
		[STATE_ADJ:GAS:boiling lethal polymerid venom]
		[PREFIX:NONE]
		[ENTERS_BLOOD]
		[SYNDROME]
			[SYN_NAME:polymerid sting]
			[SYN_AFFECTED_CLASS:ORGANIC_VULNERABLE]
			[SYN_INJECTED]
			[CE_NECROSIS:SEV:100:PROB:100:RESISTABLE:BP:BY_TYPE:THOUGHT:ALL:BP:BY_TYPE:NERVOUS:ALL:START:0:PEAK:1:END:15:DWF_STRETCH:80]
			
		[ATTACK:STING:BODYPART:BY_CATEGORY:STINGER]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:sting:stings]
		[ATTACK_CONTACT_PERC:5]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:2:2]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PRIORITY:MAIN]
		[SPECIALATTACK_INJECT_EXTRACT:LOCAL_CREATURE_MAT:VENOM:LIQUID:100:100]
				]]}, 
                weight = 10
            }
         
    },
	
        procgen_subchart_table_webmouth = {
    
		{
                body_token = "",
                desc_part = "It can vomit thick polymer strands to entangle prey. ",
				eligible_rating_tags = {"WEAPON", "HUNTER"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[THICKWEB]
				[WEBBER:CREATURE_MAT:SYNTHETIC:SILK]

	[CAN_DO_INTERACTION:MATERIAL_EMISSION]
		[CDI:ADV_NAME:Spray web]
		[CDI:USAGE_HINT:ATTACK]
		[CDI:BP_REQUIRED:BY_TOKEN:MOUTH]
		[CDI:MATERIAL:CREATURE_MAT:SYNTHETIC:SILK:WEB_SPRAY]
		[CDI:TARGET:C:TOUCHABLE]
		[CDI:TARGET_RANGE:C:5]
		[CDI:MAX_TARGET_NUMBER:C:1]
		[CDI:WAIT_PERIOD:1200]
				]]}, 
                weight = 10
            },
			{
                body_token = "",
                desc_part = "It can vomit polymer strands when prompted. ",
				eligible_rating_tags = {"PRODUCT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				[WEBBER:CREATURE_MAT:SYNTHETIC:SILK]

	[CAN_DO_INTERACTION:MATERIAL_EMISSION]
		[CDI:ADV_NAME:Spray web]
		[CDI:USAGE_HINT:GREETING]
		[CDI:BP_REQUIRED:BY_TOKEN:MOUTH]
		[CDI:MATERIAL:CREATURE_MAT:SYNTHETIC:SILK:WEB_SPRAY]
		[CDI:TARGET:C:LINE_OF_SIGHT]
		[CDI:TARGET_RANGE:C:5]
		[CDI:MAX_TARGET_NUMBER:C:1]
		[CDI:WAIT_PERIOD:1200]
				]]}, 
                weight = 10	
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:POLYMERID_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:POLYMERID_MALE]
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:POLYMERID_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:POLYMERID_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 50,
				eligible_rating_tags = {"VEHICLE", "CARRIER", "NOMAD", "WEAPON", "HUNTER", "SANITATION", "PRODUCT"},
				eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:POLYMERID_FEMALE]
					[MILKABLE:CREATURE_MAT:SYNTHETIC2:MILK:20000]
					]],
                    description_addon = "It can be milked for nectar. "
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:POLYMERID_MALE]
					]],
                    description_addon = "It can be milked for nectar. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 50,
				eligible_rating_tags = {"PRODUCT"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
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