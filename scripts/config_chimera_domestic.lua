
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CHIMERA",
    MIN_CREATURES = 100,
    MAX_CREATURES = 200,
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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
		[PET]
        [CREATURE_CLASS:CHIMERA]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
        
		[PREFSTRING:rugged utility and simple needs]
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
            enabled = true,
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
            enabled = false,
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
			
			[PROFESSION_NAME:SPINNER:textile processor:textile processors]
	[PROFESSION_NAME:WEAVER:textile worker:textile workers]
	[PROFESSION_NAME:LEATHERWORKER:mat processor:mat processor]
	[PROFESSION_NAME:CLOTHIER:textile artist:textile artists]

			
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
			
			[PROFESSION_NAME:SPINNER:textile processor:textile processors]
	[PROFESSION_NAME:WEAVER:textile worker:textile workers]
	[PROFESSION_NAME:LEATHERWORKER:mat processor:mat processor]
	[PROFESSION_NAME:CLOTHIER:textile artist:textile artists]

			
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
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"HUNTER", "SERVANT", "DOMESTIC"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'c'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = true
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"CARRIER", "SERVANT", "HUNTER", "WEAPON", "PRODUCT"},
        size_tags = {"MEDIUM"},
        weight = 50,
        tok = {[[
		[CREATURE_TILE:'c'][CREATURE_CLASS:SIZE_MEDIUM]
		
		[POPULATION_NUMBER:20:50]
		]]},
        enabled = true
    },
    {
        name_part = "LRG",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"CARRIER", "NOMAD", "SERVANT", "WEAPON", "PRODUCT"},
        size_tags = {"LARGE"},
        weight = 30,
        tok = {[[
		[CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_LARGE]
		
		[POPULATION_NUMBER:10:20]
		]]},
        enabled = true
    },
    {
        name_part = "HGE",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"NOMAD", "CARRIER", "SERVANT", "WEAPON", "PRODUCT"},
        size_tags = {"HUGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[POPULATION_NUMBER:5:10]
		]]},
        enabled = true
    },
    {
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"CARRIER", "NOMAD"},
        size_tags = {"GIANT"},
        weight = 4,
        tok = {[[
		[CREATURE_TILE:'C'][CREATURE_CLASS:SIZE_GIANT][SAVAGE]
		
		[POPULATION_NUMBER:1:1]
		]]},
        enabled = true
		}
    },

    procgen_addon_table_1 = {
     
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate domesticated by civilization. This specimen has a pelt of fur, like the beasts of the homeworld before its consumption. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"DOMESTIC", "HUNTER", "PRODUCT", "SERVANT"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
		attribute_weight = { 
		TOUGHNESS = "+", 
		STRENGTH = "+", 
		ENDURANCE = "+"
		},
            tok = {[[
			[COLOR:6:0:0]
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
		next_tables = {"procgen_subchart_table_body_pet"}
        },
        {
            body_token = "BASIC_2PARTBODY:2LUNGS:HEART:GUTS:ORGANS:RIBCAGE:BASIC_HEAD_NECK:",
            desc_part = "_______________________________________________________ __________/TYPE = A genetically-engineered vertebrate domesticated by civilization. This specimen has adapted to the harsh conditions of the developed surfaces of the Megastructures, with wrinkled, leathery skin resistant to corrosive or toxic chemicals. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"NOMAD", "CARRIER", "SERVANT", "PRODUCT", "WEAPON"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"},  
		attribute_weight = { 
		TOUGHNESS = "+", 
		STRENGTH = "+", 
		ENDURANCE = "+"
		},
            tok = {[[
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
        }
    },
	
	   procgen_addon_table_2 = {
    
		{
                body_token = "2NOSEHOLE:THROAT:NECK:SPINE:BRAIN:SKULL:",
                desc_part = "It has a rounded, almost neotenic head ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "PRODUCT"},
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
				eligible_rating_tags = {"WEAPON", "SERVANT"},
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
				eligible_rating_tags = {"HUNTER", "WEAPON", "NOMAD"},
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
				eligible_rating_tags = {"PRODUCT", "WEAPON", "HUNTER", "NOMAD", "DOMESTIC", "CARRIER"},
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
				eligible_rating_tags = {"PRODUCT", "CARRIER"},
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
				eligible_rating_tags = {"WEAPON", "NOMAD", "SERVANT", "HUNTER"},
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
				eligible_rating_tags = {"PRODUCT", "CARRIER", "DOMESTIC"},
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
				eligible_rating_tags = { "WEAPON", "HUNTER", "NOMAD", "DOMESTIC"},
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
				eligible_rating_tags = { "WEAPON", "HUNTER", "NOMAD", "DOMESTIC"},
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
				eligible_rating_tags = { "WEAPON", "HUNTER", "NOMAD", "DOMESTIC", "CARRIER"},
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
				eligible_rating_tags = { "WEAPON", "HUNTER", "DOMESTIC"},
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
				eligible_rating_tags = { "WEAPON", "HUNTER", "DOMESTIC"},
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
				eligible_rating_tags = { "PRODUCT", "PRODUCT", "DOMESTIC"},
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
				eligible_rating_tags = {"DOMESTIC", "PRODUCT", "SERVANT", "DANGEROUS", "HUNTER"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				]]}, 
                weight = 90
            },
			{
                body_token = "",
                desc_part = "It has a layer of cybernetics and dermal plating growing from its body. ",
				eligible_rating_tags = {"WEAPON", "CARRIER", "NOMAD"},
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
	
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
   
        procgen_subchart_table_body_developed = {
			{
                body_token = "",
                desc_part = "It has a squat, flat body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "PRODUCT", "CARRIER"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"NOMAD", "PRODUCT", "CARRIER"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "PRODUCT", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
   
        procgen_subchart_table_body_pet = {
			{
                body_token = "",
                desc_part = "It has a long, sinuous body with ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "PRODUCT", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[ 
				]]}, 
                weight = 50, 
				next_tables = {"procgen_subchart_table_legs_ape"}
            }
         
    },
   
  
	
	
        procgen_subchart_table_legs_squat = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
	
	
	
	
        procgen_subchart_table_legs_long = {
			{
                body_token = "BASIC_FRONTLEGS:BASIC_REARLEGS:5TOES:",
                desc_part = "four short straight legs supporting its weight. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
                body_token = "BASIC_3PARTLEGS:4ARMS:2WINGS:5TOES:5FINGERS:",
                desc_part = "two muscular, straight digitigrade legs supporting its weight, along with an eerily humanoid upper body and three sets of arms, one pair at its shoulders, another emerging from its midsection, and a third pair hanging from its back.",
				transcendent_desc_part = "",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "PRODUCT", "CARRIER"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "",
				transcendent_desc_part = "",
				eligible_rating_tags = {"SERVANT", "CARRIER", "DOMESTIC"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				]]}, 
                weight = 50
            }
    },
	
	
	
	
   
   
        procgen_subchart_table_neck = {
            {     
                body_token = "", 
                desc_part = "at the end of a thick, tapering neck, with ",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "PRODUCT", "CARRIER", "NOMAD"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "SERVANT", "WEAPON"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
                ]]},
                weight = 50, 
				next_tables = {"procgen_subchart_table_teeth"} 
            },
            {     
                body_token = "2EYES:", 
                desc_part = "large forward-facing eyes and ",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "SERVANT", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "SERVANT"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "SERVANT", "WEAPON"},
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
				eligible_rating_tags = {"WEAPON", "HUNTER", "SERVANT"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
				}
			},
			
	   procgen_subchart_table_ear = {
            {     
                body_token = "2EARS", 
                desc_part = "a pair of short, pointed ears. ",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
                ]]}, 
                weight = 50
            },
            {     
                body_token = "2EARS", 
                desc_part = "a pair of long, pointed ears. ",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
                ]]}, 
                weight = 50
            },
            {     
                body_token = "2EARS", 
                desc_part = "a pair of long, floppy ears. ",
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
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
            weight = 75,
				eligible_rating_tags = {"DOMESTIC", "HUNTER", "NOMAD", "SERVANT", "PRODUCT", "CARRIER", "WEAPON"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CHIMERA_FEMALE]
					[MILKABLE:CREATURE_MAT:ORGANISM:MILK:20000]
					]],
                    description_addon = "The females can be milked. "
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CHIMERA_MALE]
					]],
                    description_addon = "The females can be milked. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 25,
				eligible_rating_tags = {"PRODUCT", "NOMAD"},
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