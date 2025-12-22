
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CYCASTE",
    MIN_CREATURES = 20,
    MAX_CREATURES = 50,
    BASE_CREATURE_NAME_PREFIX = "cycaste ID",
    OUTPUT_FILENAME = "generated_cycaste_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "cycaste",
    TRANSCENDENT_NAME_ROOT_PLURAL = "cycastes",

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
        { name = "component_4", table_key = "procgen_addon_table_4" },
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
            [COLOR:3:0:0]
        [CREATURE_CLASS:CYCASTE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        

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
			
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
	[ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD_ROBOT:BY_CATEGORY:TOOTH_ROBOT]
		[ATTACK_SKILL:BITE]
		[ATTACK_VERB:bite:bites]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_CANLATCH]
			
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [DIURNAL]
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
			
        [SET_BP_GROUP:BY_CATEGORY:HEAD_ROBOT]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
			
        [SET_BP_GROUP:BY_CATEGORY:HEAD_ROBOT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
				
				
        [SET_TL_GROUP:BY_CATEGORY:EYE_ROBOT:ENDOSKELETON]
			[TL_COLOR_MODIFIER:IRIS_EYE_WHITE:1:IRIS_EYE_WHITE:1:IRIS_EYE_WHITE:1:IRIS_EYE_PINK:1:IRIS_EYE_RED:1:IRIS_EYE_BLUE:1:IRIS_EYE_YELLOW:1:IRIS_EYE_GREEN:1:IRIS_EYE_PURPLE:1:IRIS_EYE_ORANGE:1]
                [TLCM_NOUN:ocular lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = During the Transitional Era, cycastes were often the ruling class of the arcology-megacities that dominated the period, the old restrictions on cybernetics left by the wayside as humanity augmented itself into new forms of life. Though their prominence has faded in the face of Transcendence, they remain a common sight in human civilization, with larger specimens on par with any vehicular war machine. But these days they are considered an outdated, barbaric form of existence, with many having degraded into maddened itinerants or wandering disasters, endlessly seeking fresh parts to replace their old ones. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
            [CREATURE_CLASS:SOPHONT][NIGHT_CREATURE_EXPERIMENTER]
			[BIOME:ANY_LAND]
            ]]},
            tags = {"SOPHONT"},
            weight = 20,
            enabled = true,
            minimum_number = 1
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            [NIGHT_CREATURE_HUNTER]	[BIOME:ANY_LAND]
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
            ]]},
            tags = {"HOSTILE"},
            weight = 25,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
            [BIOME:ANY_LAND]
            [CREATURE_CLASS:EXISTENTIAL]
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 5,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
            [LARGE_PREDATOR][AMBUSHPREDATOR]
            
            [CREATURE_CLASS:DANGEROUS]
            [FREQUENCY:10]
            ]]},
            tags = {"DANGEROUS"},
            weight = 10,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS]
            [FREQUENCY:20]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 20,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
            [FREQUENCY:50]
            ]]},
            tags = {"BENIGN"},
            weight = 40,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
            [FREQUENCY:30]
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
            [FREQUENCY:100]
            ]]},
            tags = {"VERMIN"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
            [FISHITEM]
            [CREATURE_CLASS:AMBIENT]
            [FREQUENCY:100]
            ]]},
            tags = {"AMBIENT"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Deviant; it is an intelligent being capable of reason and metacognition, but has abandoned or lost human values and psychology in favor of competitiveness within the technosystem. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
            [CREATURE_CLASS:DEVIANT]            [COLOR:3:0:0]

            ]]},
            tags = {"DEVIANT"},
            weight = 5,
            enabled = false,
            minimum_number = 1
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as an Avatar; it is a host body of an immense hyperintelligence within the Datasphere. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            [CREATURE_CLASS:AVATAR][POWER]            [COLOR:3:0:0]
			[POWER]

            ]]},
            tags = {"AVATAR"},
            weight = 1,
            enabled = false,
            minimum_number = 1
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Vessel; it is a node of a distributed system or intelligence, bound to the will of its creator. ",
            tok = {[[
            [CAN_LEARN][EQUIPS][CANOPENDOORS]
            
            [CREATURE_CLASS:VESSEL]            [COLOR:3:0:0]

            ]]},
            tags = {"VESSEL"},
            weight = 1,
            enabled = false,
            minimum_number = 1
        }
    },

    generic_body_size_variants = {
    {
        name_part = "MCR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT"},
        size_tags = {"MICRO"},
        tok = {[[
		[VERMIN_MICRO]
		[SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:5000:10000]
		]]},
        weight = 10,
        enabled = false
    },
    {
        name_part = "MCR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"VERMIN"},
        size_tags = {"MICRO"},
        tok = {[[
		[VERMIN_MICRO]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:2500:5000]
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
        eligible_rating_tags = {"AMBIENT"},
        size_tags = {"MINIMAL"},
        tok = {[[
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:1000:2000]
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
        eligible_rating_tags = {"VERMIN"},
        size_tags = {"MINIMAL"},
        tok = {[[
		
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:500:1000]
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
        eligible_rating_tags = {"VERMIN"},
        size_tags = {"SMALL"},
        tok = {[[
		[VERMIN_GROUNDER]
		
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:249]
		[POPULATION_NUMBER:500:1000]
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
        eligible_rating_tags = {"AMBIENT"},
        size_tags = {"SMALL"},
        tok = {[[
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
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
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'s'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = false
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS"},
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
		[CREATURE_TILE:'y'][CREATURE_CLASS:SIZE_MEDIUM]
		[CREATURE_SOLDIER_TILE:152]
		
		[POPULATION_NUMBER:20:50]
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
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "PROBLEMATIC"},
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
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_LARGE]
		
		[POPULATION_NUMBER:10:20]
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
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE"},
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
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[POPULATION_NUMBER:5:10]
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
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"GIANT"},
        weight = 1,
        favored_size_multiplier_enabled = true,
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_GIANT]
		
		[POPULATION_NUMBER:1:1]
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
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"TITANIC"},
        weight = 1,
        favored_size_multiplier_enabled = false,
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_TITANIC]
		
		[POPULATION_NUMBER:1:1]
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

    procgen_addon_table_1 = {
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL:FACIAL_FEATURES:NOSE:2EARS:",
        transcendent_body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:CORE:FACIAL_FEATURES:NOSE:2EARS:",
        desc_part = "An eerily skeletal machine of hydraulics, tubes, and wires wrapped around a metallic endoskeleton. Its body is positioned upright, covered in flexible plastic segments resembling the proportions and figure of a human body. Bulbous containers housed in a metallic ribcage host the brain and organs of its original biological form. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE"},
        eligible_size_tags = {"MEDIUM", "LARGE"}, 
        tok = {
		[[
		
	[TISSUE:PLASTIC]
		[TISSUE_NAME:plastic:NP]
		[TISSUE_MATERIAL:INORGANIC:PLASTICWARE]
		[HEALING_RATE:100]
		[RELATIVE_THICKNESS:1]
		[CONNECTS]
		[TISSUE_SHAPE:LAYER]
	[TISSUE_LAYER_OVER:BY_CATEGORY:ALL:PLASTIC]
	[TISSUE_LAYER_OVER:BY_CATEGORY:NOSE:PLASTIC]
	[TISSUE_LAYER_OVER:BY_CATEGORY:CHEEK:PLASTIC]
	[TISSUE_LAYER_OVER:BY_CATEGORY:EYELID:PLASTIC]
	[TISSUE_LAYER_OVER:BY_CATEGORY:LIP:PLASTIC]
	[TISSUE_LAYER_OVER:BY_CATEGORY:EAR:PLASTIC]
			
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
				[TLCM_NOUN:exterior:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]

		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_1_1"}
    },
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL:",
        transcendent_body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:CORE:",
        desc_part = "An eerily skeletal machine of hydraulics, tubes, and wires wrapped around a metallic endoskeleton. Its body is positioned upright, covered in a form-fitting exterior resembling the proportions and figure of a human body. Bulbous containers housed in a metallic ribcage host the brain and organs of its original biological form. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
			
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:endoskeleton:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_1_2"}
    },
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL:",
        transcendent_body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:CORE:",
        desc_part = "An eerily skeletal machine of hydraulics, tubes, and wires wrapped around a metallic endoskeleton. Its body is hunched-over, covered in a form-fitting exterior, otherwise resembling the proportions and figure of a human body. Bulbous containers housed in a metallic ribcage host the brain and organs of its original biological form. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:endoskeleton:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_1_2"}
    },
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:HEART:ORGANS:SPINE:BRAIN:SKULL:",
        transcendent_body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:CORE:",
        desc_part = "An eerily skeletal machine of hydraulics, tubes, and wires wrapped around a metallic endoskeleton. Its body is a shapeless mass covered in a form-fitting exterior, its neck and head emerging from the center-front of its chest. Bulbous containers housed in a metallic ribcage host the brain and organs of its original biological form. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"HUGE", "GIANT"}, 
        tok = {
		[[
			
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:endoskeleton:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_1_2"}
    }
    },
	
    procgen_addon_table_2 = {
           {
        body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:MACHINETOES:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:MACHINETOES",
        desc_part = "Its limbs are proportioned to its body. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			[PHYS_ATT_RANGE:TOUGHNESS:450:950:1150:1250:1350:1550:2250]             +
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:MACHINETOES:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:MACHINETOES",
        desc_part = "Its limbs are disproportionately long. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are proportioned to its body, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			[PHYS_ATT_RANGE:TOUGHNESS:450:950:1150:1250:1350:1550:2250]             +
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are disproportionately long, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        desc_part = "Its enlarged lower body has four splayed legs ending in simple metal platforms, sacrificing durability for increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
			[PHYS_ATT_RANGE:TOUGHNESS:150:600:800:900:1000:1100:1500]                -
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        desc_part = "Its enlarged lower body has six splayed legs ending in simple metal platforms, considerably sacrificing durability toughness for highly increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:400:600:750:800:900:1100]                    --
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER_HUGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS:GUTS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_HUGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        desc_part = "Its enlarged lower body has eight splayed legs ending in simple metal platforms, greatly sacrificing toughness for extremely increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:375:250:125:1900:2900] 70 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:100:200:300:400:450:500]                       ---
			]]
        }, 
        weight = 5 
    }
    },
    
	
	   procgen_addon_table_3 = {
           {
        body_token = "",
        desc_part = "It has bulky hydraulics with incredible physical output, and ",
        transcendent_desc_part = "It has grotesquely bulging musculature with incredible physical output, and ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[PHYS_ATT_RANGE:STRENGTH:1250:1500:1750:2000:2500:3000:5000]  +++
			]]
        }, 
        weight = 5,
		next_tables = {"procgen_subchart_table_3_1"}
    },
    {
        body_token = "",
        desc_part = "It has ball-jointed limbs with astounding flexibility, and ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[PHYS_ATT_RANGE:AGILITY:1250:1500:1750:2000:2500:3000:5000]  +++
			]]
        }, 
        weight = 5,
		next_tables = {"procgen_subchart_table_3_2"}
    },
    {
        body_token = "",
        desc_part = "It has a bulky engine built into its back granting immense energy reserves, and ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[PHYS_ATT_RANGE:ENDURANCE:1250:1500:1750:2000:2500:3000:5000]  +++
			]]
        }, 
        weight = 5,
		next_tables = {"procgen_subchart_table_3_3"}
    }
    },
    
	
	   procgen_addon_table_4= {
           {
        body_token = "",
        desc_part = "",
        eligible_rating_tags = {"SOPHONT"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			]]
        }, 
        weight = 5
    },
    {
        body_token = "",
        desc_part = "It is covered in misshapen armor plating scavenged the megastructure and destroyed machines. ",
        eligible_rating_tags = {"HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			]]
        }, 
        weight = 5
    }
    },
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
    
        procgen_subchart_table_1_1 = {
            {     
                body_token = "2MACHINEEYE:MACHINEMOUTH:MACHINETEETH:", 
                desc_part = "It has a simple humanoid face and synthetic hair. ",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
                tok = {[[
				
        [BODY_DETAIL_PLAN:HEAD_HAIR_ROBOT_TISSUE_LAYERS]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_ROBOT:HAIR]
            [TL_COLOR_MODIFIER:BLACK:1:WHITE:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:BLACK:1:CLEAR:1:CLEAR:1:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:HEAD_ROBOT:HAIR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_ROBOT:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 50 
            }
        },
        procgen_subchart_table_1_2 = {
            {     
                body_token = "2MACHINEEYE:MACHINEMOUTH:MACHINETEETH:", 
                desc_part = "It has a simple humanoid faceplate. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
				[TLCM_NOUN:faceplate:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
	
                ]]},
                weight = 50 
            }
        },
        procgen_subchart_table_3_1 = {
            {     
                body_token = "", 
                desc_part = "sophisticated hinged joints with considerable flexibility, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:AGILITY:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_3"}
            },
            {     
                body_token = "", 
                desc_part = "a large engine with considerable energy reserves, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:ENDURANCE:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_2"} 
            }
            },
        procgen_subchart_table_3_2 = {
            {     
                body_token = "", 
                desc_part = "bulky hydraulics with considerable physical output, but ",
				transcendent_desc_part = "bulging musculature with considerable physical output, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:STRENGTH:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_3"}
            },
            {     
                body_token = "", 
                desc_part = "a large engine with considerable energy reserves, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:ENDURANCE:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_1"} 
            }
			},
        procgen_subchart_table_3_3 = {
            {     
                body_token = "", 
                desc_part = "bulky hydraulics with considerable physical output, but ",
				transcendent_desc_part = "bulging musculature with considerable physical output, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:STRENGTH:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_2"}
            },
            {     
                body_token = "", 
                desc_part = "flexible hinged joints with considerable flexibility, but ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:AGILITY:700:1200:1400:1500:1600:1800:2500]    ++
                ]]},
                weight = 50,
				next_tables = {"procgen_subchart_table_3_3_1"}
			}
            },
        procgen_subchart_table_3_3_1 = {
            {     
                body_token = "", 
                desc_part = "only slightly enhanced hydraulics with minimal physical output increase. ",
                transcendent_desc_part = "lean musculature with minimal physical output increase. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:STRENGTH:450:950:1150:1250:1350:1550:2250]             +
                ]]},
                weight = 50
            }
			},
        procgen_subchart_table_3_3_2 = {
            {     
                body_token = "", 
                desc_part = "only slightly enhanced joints with minimal bonuses to flexibility. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:AGILITY:450:950:1150:1250:1350:1550:2250]             +
                ]]},
                weight = 50
            }
			},
        procgen_subchart_table_3_3_3 = {
            {     
                body_token = "", 
                desc_part = "a small engine on its back with minimal energy reserves. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
					[PHYS_ATT_RANGE:ENDURANCE:450:950:1150:1250:1350:1550:2250]             +
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CYCASTE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CYCASTE_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT", "EXISTENTIAL", "HOSTILE"},
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