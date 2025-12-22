
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "HICASTE",
    MIN_CREATURES = 8,
    MAX_CREATURES = 12,
    BASE_CREATURE_NAME_PREFIX = "hicaste ID",
    OUTPUT_FILENAME = "generated_hicaste_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = false,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "hicaste",
    TRANSCENDENT_NAME_ROOT_PLURAL = "hicaste",

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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [CREATURE_TILE:'i'][COLOR:3:0:0]
        [CREATURE_SOLDIER_TILE:139]
        [CREATURE_CLASS:HICASTE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
        
		[MAXAGE:100:150]

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
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
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
        [USE_MATERIAL_TEMPLATE:SWEAT:SWEAT_TEMPLATE]
        [USE_MATERIAL_TEMPLATE:TEARS:TEARS_TEMPLATE]
        [USE_MATERIAL_TEMPLATE:SPIT:SPIT_TEMPLATE]
        [SECRETION:LOCAL_CREATURE_MAT:SWEAT:LIQUID:BY_CATEGORY:ALL:SKIN:EXERTION]
        [SECRETION:LOCAL_CREATURE_MAT:TEARS:LIQUID:BY_CATEGORY:EYE:ALL:EXTREME_EMOTION]
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
        [BABY:1]
        [CHILD:13]
        [BODY_SIZE:0:0:4000]
        [BODY_SIZE:1:168:17500]
        [BODY_SIZE:18:0:70000]
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
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
        [MANNERISM_FINGERS:finger:fingers]
        [MANNERISM_NOSE:nose]
        [MANNERISM_EAR:ear]
        [MANNERISM_HEAD:head]
        [MANNERISM_EYES:eyes]
        [MANNERISM_MOUTH:mouth]
        [MANNERISM_HAIR:hair]
        [MANNERISM_KNUCKLES:knuckles]
        [MANNERISM_LIPS:lips]
        [MANNERISM_CHEEK:cheek]
        [MANNERISM_NAILS:nails]
        [MANNERISM_FEET:feet]
        [MANNERISM_ARMS:arms]
        [MANNERISM_HANDS:hands]
        [MANNERISM_TONGUE:tongue]
        [MANNERISM_LEG:leg]
        [MANNERISM_LAUGH]
        [MANNERISM_SMILE]
        [MANNERISM_WALK]
        [MANNERISM_SIT]
        [MANNERISM_BREATH]
        [MANNERISM_POSTURE]
        [MANNERISM_STRETCH]
        [MANNERISM_EYELIDS]
        [SPOUSE_CONVERSION_TARGET]
		
		
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
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
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:150:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:IRIS_EYE_BLUE:1:IRIS_EYE_LIGHT_BLUE:1:IRIS_EYE_DARK_BLUE:1:IRIS_EYE_GREEN:1:IRIS_EYE_LIGHT_GREEN:1:IRIS_EYE_DARK_GREEN:1:IRIS_EYE_BROWN:1:IRIS_EYE_LIGHT_BROWN:1:IRIS_EYE_DARK_BROWN:1:IRIS_EYE_GRAY:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
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
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
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
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = The hi-caste are the descendants of homeworld humans who served the Geno-Archons, bred not to colonize the harsh frontiers of the system with minimal aid but to excel at a specific vocation underneath those ancient masters of humanity. Though their masters have been dead for uncountable centuries the stability of the hi-caste genome ensures their lineages survive into the distant future, even if they have grown into forms and roles their makers could never have anticipated. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER]
            [BENIGN]
            [CREATURE_CLASS:SOPHONT]
            ]]},
            tags = {"SOPHONT"},
            weight = 5,
            enabled = true,
            minimum_number = 1
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
        }
    },

    generic_body_size_variants = {
        {
            name_part = "MCR",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 1,
            base_adult_size_for_random = 1,
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MICRO"}, 
            tok = {[[
            [VERMIN_MICRO]
            [SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            [POPULATION_NUMBER:5000:10000]
            ]]}, 
            weight = 10, 
            enabled = true
        },
        {
            name_part = "MNL", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 10, 
            body_size_index_and_child_count = 0, 
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MINIMAL"}, 
            tok = {[[
            [VERMIN_GROUNDER]
            [NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            [POPULATION_NUMBER:1000:2000]
            ]]}, 
            weight = 10, 
            enabled = true
        },
        {
            name_part = "SML", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 100,
            base_adult_size_for_random = 100,
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC"},
            size_tags = {"SMALL"}, 
            tok = {[[
            [VERMIN_GROUNDER]
            [NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:249]
            [POPULATION_NUMBER:500:1000]
            ]]}, 
            weight = 10, 
            enabled = true
        },
        {
            name_part = "LSR", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 1000,
            body_size_index_and_child_count = 1,
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE"},
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_CLASS:SIZE_LESSER]
            
            [POPULATION_NUMBER:250:500]
            ]]}, 
            weight = 30, 
            enabled = true
        },
        {
            name_part = "MDM",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 100,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 5,
            eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS"},
            size_tags = {"MEDIUM"}, 
            weight = 100, 
            favored_size_multiplier_enabled = true, 
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
            tok = {[[
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
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 1000,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 10,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "PROBLEMATIC"},
            size_tags = {"LARGE"}, 
            weight = 10, 
            favored_size_multiplier_enabled = true, 
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_LARGE]
            
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
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 1000000,
            body_size_index_and_child_count = 15,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "EXISTENTIAL"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            
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
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 10000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "HOSTILE", "BENIGN", "EXISTENTIAL"},
            size_tags = {"GIANT"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_GIANT]
            
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
        },
        {
            name_part = "TTN", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 100000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"EXISTENTIAL"},
            size_tags = {"TITANIC"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = true
        }
    },

    procgen_addon_table_1 = {
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:MOUTH:TONGUE:FACIAL_FEATURES:TEETH:RIBCAGE",
            desc_part = "_______________________________________________________ __________/TYPE = A human with a complex barcode on its forehead marking it as one of the Civclade, a gene-tailored human built for managerial and social labor. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"SOPHONT"},
            eligible_size_tags = {"MEDIUM"}, 
			sub_archetype = {"CIVCLADE"},
            tok = {[[
            [MAXAGE:280:340]
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 30,
			next_tables = {"procgen_subchart_table_1_1"}
        },
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:MOUTH:TONGUE:FACIAL_FEATURES:TEETH:RIBCAGE",
            desc_part = "_______________________________________________________ __________/TYPE = A human with a complex barcode on its forehead marking it as one of the Warclade, a gene-tailored human built for combat, terror, and law enforcement. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"SOPHONT"},
            eligible_size_tags = {"MEDIUM", "LARGE"}, 
			sub_archetype = {"WARCLADE"},
            tok = {[[
            [MAXAGE:180:220]
                    [LOW_LIGHT_VISION:10000]
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 10,
			next_tables = {"procgen_subchart_table_1_2"}
        },
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:MOUTH:TONGUE:FACIAL_FEATURES:TEETH:RIBCAGE",
            desc_part = "_______________________________________________________ __________/TYPE = A human with a complex barcode on its forehead marking it as one of the Sciclade, a gene-tailored human built for engineering and digital infrastructure management. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"SOPHONT"},
            eligible_size_tags = {"MEDIUM"}, 
			sub_archetype = {"SCICLADE"},
            tok = {[[
            [MAXAGE:180:220][STRANGE_MOODS]
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 10,
			next_tables = {"procgen_subchart_table_1_3"}
        },
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:MOUTH:TONGUE:FACIAL_FEATURES:TEETH:RIBCAGE",
            desc_part = "_______________________________________________________ __________/TYPE = A human with a complex barcode on its forehead marking it as one of the Joyclade, a gene-tailored human built for entertainment and aesthetics. _______________________________________________________ __________/DESC = ",
            eligible_rating_tags = {"SOPHONT"},
            eligible_size_tags = {"MEDIUM"}, 
			sub_archetype = {"JOYCLADE"},
            tok = {[[
            [MAXAGE:180:220]
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 5,
			next_tables = {"procgen_subchart_table_1_4"}
        }
    },

    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
   
        procgen_subchart_table_1_1 = {
            {     
                body_token = "", 
                desc_part = "Its pedigree is exceptional, with compulsive psychological programming towards order, duty, and civility, and a mind optimized for analysis, social acumen, and keen focus, at the cost of physical aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "---", 
				STRENGTH = "--", 
				TOUGHNESS = "--", 
				ENDURANCE = "--", 
				LINGUISTIC_ABILITY = "+++",
				SOCIAL_AWARENESS = "+++", 
				ANALYTICAL_ABILITY = "+++", 
				FOCUS = "+++"
				},
                tok = {[[	
				
					
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is notable, with rigid psychological programming towards order, duty, and civility, and a mind optimized for analysis, social acumen, and keen focus, at the cost of physical aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "---", 
				STRENGTH = "-", 
				TOUGHNESS = "-", 
				ENDURANCE = "-", 
				LINGUISTIC_ABILITY = "++",
				SOCIAL_AWARENESS = "++", 
				ANALYTICAL_ABILITY = "++", 
				FOCUS = "++"
				},
                tok = {[[	
				
				[PERSONALITY:SINGLEMINDED:25:75:100]
				[PERSONALITY:PERFECTIONIST:25:75:100]
				[PERSONALITY:ALTRUISM:25:75:100]
				[PERSONALITY:ORDERLINESS:25:75:100]
				[PERSONALITY:ACTIVITY_LEVEL:25:75:100]
				[PERSONALITY:POLITENESS:25:75:100]
				[PERSONALITY:DISCORD:0:25:25]
				[PERSONALITY:STRESS_VULNERABILITY:0:25:25]
				[PERSONALITY:WASTEFULNESS:0:25:50]
				[PERSONALITY:IMMODESTY:0:25:50]
					
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is adequate, with functional psychological programming towards order, duty, and civility, and a mind optimized for analysis, social acumen, and keen focus, but not finely focused to the detriment of physical attributes. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "---", 
				LINGUISTIC_ABILITY = "+",
				SOCIAL_AWARENESS = "+", 
				ANALYTICAL_ABILITY = "+", 
				FOCUS = "+"
				},
                tok = {[[	
				
				[PERSONALITY:SINGLEMINDED:0:60:100]
				[PERSONALITY:PERFECTIONIST:0:60:100]
				[PERSONALITY:ALTRUISM:0:60:100]
				[PERSONALITY:ORDERLINESS:0:60:100]
				[PERSONALITY:ACTIVITY_LEVEL:0:60:100]
				[PERSONALITY:POLITENESS:0:60:100]
				[PERSONALITY:DISCORD:0:25:50]
				[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
				[PERSONALITY:WASTEFULNESS:0:25:50]
				[PERSONALITY:IMMODESTY:0:25:50]
					
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            }
        },
   
        procgen_subchart_table_1_2 = {
            {     
                body_token = "", 
                desc_part = "Its pedigree is exceptional, with compulsive psychological programming towards obedience, fearlessness, and brutality, and a body optimized for raw performance, at the cost of intellectual aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "+++", 
				STRENGTH = "+++", 
				TOUGHNESS = "+++", 
				ENDURANCE = "+++", 
				AGILITY = "+++", 
				RECUPERATION = "+++",
				FOCUS = "+++", 
				EMPATHY = "---",
				SOCIAL_AWARENESS = "--",
				MEMORY = "--",
				CREATIVITY = "--"
				},
                tok = {[[	
				
					[PERSONALITY:EXCITEMENT_SEEKING:50:75:100]
					[PERSONALITY:VIOLENT:50:75:100]
					[PERSONALITY:PERSEVERANCE:50:75:100]
					[PERSONALITY:BRAVERY:50:75:100]
					[PERSONALITY:DUTIFULNESS:50:75:100]
					[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
					[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
					[PERSONALITY:AMBITION:0:25:50]
					[PERSONALITY:SWAYED_BY_EMOTIONS:0:25:50]
					[PERSONALITY:POLITENESS:50:75:100]

					
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is notable, with rigid psychological programming towards obedience, fearlessness, and brutality, and a body optimized for raw performance, at the cost of intellectual aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "++", 
				STRENGTH = "++", 
				TOUGHNESS = "++", 
				ENDURANCE = "++", 
				AGILITY = "++", 
				RECUPERATION = "++",
				FOCUS = "++", 
				EMPATHY = "---",
				SOCIAL_AWARENESS = "-",
				MEMORY = "-",
				CREATIVITY = "-"
				},
                tok = {[[	
				
					[PERSONALITY:EXCITEMENT_SEEKING:25:75:100]
					[PERSONALITY:VIOLENT:25:75:100]
					[PERSONALITY:PERSEVERANCE:25:75:100]
					[PERSONALITY:BRAVERY:25:75:100]
					[PERSONALITY:DUTIFULNESS:25:75:100]
					[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
					[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
					[PERSONALITY:AMBITION:0:25:50]
					[PERSONALITY:SWAYED_BY_EMOTIONS:0:25:50]
					[PERSONALITY:POLITENESS:50:75:100]

                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is adequate, with functional psychological programming towards obedience, fearlessness, and brutality, and a body optimized for raw performance, but not finely focused to the detriment of mental attributes. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
				attribute_weight = { 
				DISEASE_RESISTANCE = "+", 
				STRENGTH = "+", 
				TOUGHNESS = "+", 
				ENDURANCE = "+", 
				AGILITY = "+", 
				RECUPERATION = "+",
				FOCUS = "+", 
				EMPATHY = "---"
				},
                tok = {[[	
				
					[PERSONALITY:EXCITEMENT_SEEKING:0:60:100]
					[PERSONALITY:VIOLENT:0:60:100]
					[PERSONALITY:PERSEVERANCE:0:60:100]
					[PERSONALITY:BRAVERY:0:60:100]
					[PERSONALITY:DUTIFULNESS:0:60:100]
					[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
					[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
					[PERSONALITY:AMBITION:0:25:50]
					[PERSONALITY:SWAYED_BY_EMOTIONS:0:25:50]
					[PERSONALITY:POLITENESS:50:75:100]				
					
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            }
        },
   
        procgen_subchart_table_1_3 = {
            {     
                body_token = "", 
                desc_part = "Its pedigree is exceptional, with compulsive psychological programming towards curiosity, singleminded focus, and uninterrupted labor, and a mind optimized for analysis, social acumen, and keen focus, at the cost of physical aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				SOCIAL_AWARENESS = "---", 
				EMPATHY = "--", 
				TOUGHNESS = "--", 
				ENDURANCE = "--", 
				STRENGTH = "--", 
				PATIENCE = "+++", 
				SPATIAL_SENSE = "+++", 
				KINESTHETIC_SENSE = "+++", 
				INTUITION = "+++", 
				FOCUS = "+++", 
				CREATIVITY = "+++" 
				},
                tok = {[[	
				
			[PERSONALITY:SINGLEMINDED:50:75:100]
			[PERSONALITY:PERFECTIONIST:50:75:100]
			[PERSONALITY:ORDERLINESS:50:75:100]
			[PERSONALITY:ACTIVITY_LEVEL:50:75:100]
			[PERSONALITY:CURIOUS:50:75:100]
			[PERSONALITY:IMAGINATION:0:25:50]
			[PERSONALITY:AMBITION:0:25:50]
			[PERSONALITY:EXCITEMENT_SEEKING:0:25:50]
			
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is notable, with rigid psychological programming towards curiosity, singleminded focus, and uninterrupted labor, and a mind optimized for analysis, social acumen, and keen focus, at the cost of physical aptitude. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				SOCIAL_AWARENESS = "---", 
				EMPATHY = "-", 
				TOUGHNESS = "-", 
				ENDURANCE = "-", 
				STRENGTH = "-", 
				PATIENCE = "++", 
				SPATIAL_SENSE = "++", 
				KINESTHETIC_SENSE = "++", 
				INTUITION = "++", 
				FOCUS = "++", 
				CREATIVITY = "++" 
				},
                tok = {[[	
				
			[PERSONALITY:SINGLEMINDED:25:75:100]
			[PERSONALITY:PERFECTIONIST:25:75:100]
			[PERSONALITY:ORDERLINESS:25:75:100]
			[PERSONALITY:ACTIVITY_LEVEL:25:75:100]
			[PERSONALITY:CURIOUS:25:75:100]
			[PERSONALITY:IMAGINATION:0:25:50]
			[PERSONALITY:AMBITION:0:25:50]
			[PERSONALITY:EXCITEMENT_SEEKING:0:25:50]

			
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is adequate, with functional psychological programming towards curiosity, singleminded focus, and uninterrupted labor, and a mind optimized for analysis, social acumen, and keen focus, but not finely focused to the detriment of physical attributes. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				SOCIAL_AWARENESS = "---", 
				SPATIAL_SENSE = "+", 
				KINESTHETIC_SENSE = "+", 
				INTUITION = "+", 
				FOCUS = "+", 
				CREATIVITY = "+" 
				},
                tok = {[[	
				
			[PERSONALITY:SINGLEMINDED:0:60:100]
			[PERSONALITY:PERFECTIONIST:0:60:100]
			[PERSONALITY:ORDERLINESS:0:60:100]
			[PERSONALITY:ACTIVITY_LEVEL:0:60:100]
			[PERSONALITY:CURIOUS:0:60:100]
			[PERSONALITY:IMAGINATION:0:25:50]
			[PERSONALITY:AMBITION:0:25:50]
			[PERSONALITY:EXCITEMENT_SEEKING:0:25:50]

			
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            }
        },
   
        procgen_subchart_table_1_4 = {
            {     
                body_token = "", 
                desc_part = "Its pedigree is exceptional, with compulsive psychological programming towards sociality, performance, and artistic pursuits, and a mind and body optimized for grace and charm, at the cost of physical fragility and mental instability. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				AGILITY = "+++", 
				RECUPERATION = "+++", 
				SPATIAL_SENSE = "+++", 
				KINESTHETIC_SENSE = "+++", 
				MUSICALITY = "+++", 
				LINGUISTIC_ABILITY = "+++", 
				EMPATHY = "+++", 
				SOCIAL_AWARENESS = "--", 
				FOCUS = "--", 
				WILLPOWER = "--", 
				ANALYTICAL_ABILITY = "---", 
				TOUGHNESS = "--"
				},
                tok = {[[	
			
			[PERSONALITY:VANITY:50:75:100]
			[PERSONALITY:LUST_PROPENSITY:50:75:100]
			[PERSONALITY:TOLERANT:50:75:100]
			[PERSONALITY:SWAYED_BY_EMOTIONS:50:75:100]
			[PERSONALITY:EMOTIONALLY_OBSESSIVE:50:75:100]
			[PERSONALITY:CHEER_PROPENSITY:50:75:100]
			[PERSONALITY:IMMODESTY:50:75:100]
			[PERSONALITY:GREGARIOUSNESS:50:75:100]
			[PERSONALITY:IMAGINATION:50:75:100]
			[PERSONALITY:ABSTRACT_INCLINED:50:75:100]
			[PERSONALITY:HUMOR:50:75:100]
			[PERSONALITY:BASHFUL:0:25:50]
			[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]

			[PHYS_ATT_RANGE:AGILITY:1250:1500:1750:2000:2500:3000:5000]  +++	
			[PHYS_ATT_RANGE:RECUPERATION:1250:1500:1750:2000:2500:3000:5000]  +++	
			[MENT_ATT_RANGE:SPATIAL_SENSE:1250:1500:1750:2000:2500:3000:5000]  +++
			[MENT_ATT_RANGE:KINESTHETIC_SENSE:1250:1500:1750:2000:2500:3000:5000]  +++
			[MENT_ATT_RANGE:MUSICALITY:1250:1500:1750:2000:2500:3000:5000]  +++
			[MENT_ATT_RANGE:LINGUISTIC_ABILITY:1250:1500:1750:2000:2500:3000:5000]  +++
			[MENT_ATT_RANGE:EMPATHY:1250:1500:1750:2000:2500:3000:5000]  +++									
			[MENT_ATT_RANGE:SOCIAL_AWARENESS:0:400:600:750:800:900:1100]                   -- 								
			[MENT_ATT_RANGE:MEMORY:0:400:600:750:800:900:1100]                   -- 
			[MENT_ATT_RANGE:CREATIVITY:0:400:600:750:800:900:1100]                   -- 
			
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is notable, with rigid psychological programming towards sociality, performance, and artistic pursuits, and a mind and body optimized for grace and charm, at the cost of physical fragility and mental instability. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				AGILITY = "++", 
				RECUPERATION = "++", 
				SPATIAL_SENSE = "++", 
				KINESTHETIC_SENSE = "++", 
				MUSICALITY = "++", 
				LINGUISTIC_ABILITY = "++", 
				EMPATHY = "++", 
				SOCIAL_AWARENESS = "-", 
				FOCUS = "-", 
				WILLPOWER = "-", 
				ANALYTICAL_ABILITY = "---", 
				TOUGHNESS = "-"
				},
                tok = {[[	
			
			[PERSONALITY:VANITY:25:75:100]
			[PERSONALITY:LUST_PROPENSITY:25:75:100]
			[PERSONALITY:TOLERANT:25:75:100]
			[PERSONALITY:SWAYED_BY_EMOTIONS:25:75:100]
			[PERSONALITY:EMOTIONALLY_OBSESSIVE:25:75:100]
			[PERSONALITY:CHEER_PROPENSITY:25:75:100]
			[PERSONALITY:IMMODESTY:25:75:100]
			[PERSONALITY:GREGARIOUSNESS:25:75:100]
			[PERSONALITY:IMAGINATION:25:75:100]
			[PERSONALITY:ABSTRACT_INCLINED:25:75:100]
			[PERSONALITY:HUMOR:25:75:100]
			[PERSONALITY:BASHFUL:0:25:50]
			[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
			
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {     
                body_token = "", 
                desc_part = "Its pedigree is adequate, with functional psychological programming towards sociality, performance, and artistic pursuits, and a mind and body optimized for grace and charm, but not finely focused to the detriment of physical fragility and mental instability. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT"},
                eligible_size_tags = {"MEDIUM"}, 
				attribute_weight = { 
				AGILITY = "+", 
				RECUPERATION = "+", 
				SPATIAL_SENSE = "+", 
				KINESTHETIC_SENSE = "+", 
				MUSICALITY = "+", 
				LINGUISTIC_ABILITY = "+", 
				EMPATHY = "+", 
				ANALYTICAL_ABILITY = "---"
				},
                tok = {[[	
			
			[PERSONALITY:VANITY:0:60:100]
			[PERSONALITY:LUST_PROPENSITY:0:60:100]
			[PERSONALITY:TOLERANT:0:60:100]
			[PERSONALITY:SWAYED_BY_EMOTIONS:0:60:100]
			[PERSONALITY:EMOTIONALLY_OBSESSIVE:0:60:100]
			[PERSONALITY:CHEER_PROPENSITY:0:60:100]
			[PERSONALITY:IMMODESTY:0:60:100]
			[PERSONALITY:GREGARIOUSNESS:0:60:100]
			[PERSONALITY:IMAGINATION:0:60:100]
			[PERSONALITY:ABSTRACT_INCLINED:0:60:100]
			[PERSONALITY:HUMOR:0:60:100]
			[PERSONALITY:BASHFUL:0:25:50]
			[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]

                ]]},
                transcendent_tok = {[[]]}, 
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:HICASTE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:HICASTE_MALE]
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:HICASTE_FEMALE][SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:HICASTE_MALE][SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
            eligible_rating_tags = {"HOSTILE"},
            eligible_size_tags = {"MEDIUM"}
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