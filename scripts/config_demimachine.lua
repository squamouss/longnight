
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "DEMIMACHINE",
    MIN_CREATURES = 100,
    MAX_CREATURES = 200,
    BASE_CREATURE_NAME_PREFIX = "demimech ID",
    OUTPUT_FILENAME = "generated_demimech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "demimech",
    TRANSCENDENT_NAME_ROOT_PLURAL = "demimechs",

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
       [COLOR:3:0:0][NOBREATHE]
        [CREATURE_CLASS:DEMIMACHINE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
			[LOW_LIGHT_VISION:10000]
				[SWIMS_INNATE]
        
	[PERSONALITY:PERSEVERANCE:25:75:100]
	[PERSONALITY:SINGLEMINDED:25:75:100]
	[PERSONALITY:DUTIFULNESS:25:75:100]
	[PERSONALITY:AMBITION:0:25:50]
	[PERSONALITY:HATE_PROPENSITY:0:25:50]
	[PERSONALITY:LOVE_PROPENSITY:0:25:50]
	[PERSONALITY:ENVY_PROPENSITY:0:25:50]
	[PERSONALITY:LUST_PROPENSITY:0:25:50]
	[PERSONALITY:CHEER_PROPENSITY:0:25:50]
	[PERSONALITY:ANGER_PROPENSITY:0:25:50]
	[PERSONALITY:DEPRESSION_PROPENSITY:0:25:50]
	[PERSONALITY:ANXIETY_PROPENSITY:0:25:50]
	[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
	
			[PROFESSION_NAME:SPINNER:textile processor:textile processors]
	[PROFESSION_NAME:WEAVER:textile worker:textile workers]
	[PROFESSION_NAME:LEATHERWORKER:mat processor:mat processor]
	[PROFESSION_NAME:CLOTHIER:textile artist:textile artists]
		
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]
	
      [BODY_DETAIL_PLAN:DEMIMECH_MATERIALS]
        [BODY_DETAIL_PLAN:DEMIMECH_TISSUES]
        [BODY_DETAIL_PLAN:DEMIMECH_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
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
        [USE_MATERIAL_TEMPLATE:SWEAT:COOLANT_TEMPLATE]
        [SECRETION:LOCAL_CREATURE_MAT:SWEAT:LIQUID:BY_CATEGORY:ALL:SKIN:EXERTION]
		
        [BABY:1]
		
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
					
					
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
        "_______________________________________________________ __________/HISTORY = Demimechs are constructs which combine machinery and artificially grown tissues into modular, adaptable organisms well-known for their low cost and rapacious tendencies. The weakest of 'mechlife, demimechs are nonetheless exceedingly tenacious as a whole due to the sheer number produced. Created during the Transitional Era, billions of demimechanical drone swarms devoured one another in endless, grueling conflicts for diminishing resources. In the present, the abandoned descendants of such powers continue to proliferate across the solar system, now occupied with the task of survival. _______________________________________________________ __________",
    },

    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            [BENIGN]
            [CREATURE_CLASS:SOPHONT]
			            [COLOR:3:0:0]
            ]]},
            tags = {"SOPHONT"},
            weight = 5,
            enabled = true,
            minimum_number = 1
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
			            [COLOR:4:0:0]
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            [NIGHT_CREATURE_HUNTER]	
            [LAIR_HUNTER]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
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
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
			            [COLOR:4:0:0]
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
            
            [CREATURE_CLASS:EXISTENTIAL]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
			            [COLOR:4:0:0]
            [LARGE_PREDATOR][AMBUSHPREDATOR]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            
            [CREATURE_CLASS:DANGEROUS]
            [FREQUENCY:10]
            ]]},
            tags = {"DANGEROUS"},
            weight = 10,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
			            [COLOR:4:0:0]
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            
            [CREATURE_CLASS:HAZARDOUS]
            [FREQUENCY:30]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
			            [COLOR:4:0:0]
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
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
			            [COLOR:4:0:0]
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:30]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Vermin; it is very small but can infest settlements or otherwise inconvenience other organisms. ",
            tok = {[[
			            [COLOR:4:0:0]
            [FISHITEM]
            [CREATURE_CLASS:VERMIN]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:100]
            ]]},
            tags = {"VERMIN"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
			            [COLOR:4:0:0]
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
            enabled = true,
            minimum_number = 1
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as an Avatar; it is a host body of an immense hyperintelligence within the Datasphere. ",
            tok = {[[
            [INTELLIGENT][CANOPENDOORS]
            [CREATURE_CLASS:AVATAR][POWER]            [COLOR:3:0:0]
            
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
            ]]},
            tags = {"AVATAR"},
            weight = 1,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as a Vessel; it is a node of a distributed system or intelligence, bound to the will of its creator. ",
            tok = {[[
            [CAN_LEARN][EQUIPS][CANOPENDOORS]
            
            [CREATURE_CLASS:VESSEL]            [COLOR:3:0:0]

            ]]},
            tags = {"VESSEL"},
            weight = 1,
            enabled = true,
            minimum_number = 1
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
            enabled = false
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
            enabled = false
        },
        {
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"VERMIN", "AMBIENT"},
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
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC",},
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_TILE:'d'][CREATURE_CLASS:SIZE_LESSER]
            
            [POPULATION_NUMBER:250:500]
			[CLUSTER_NUMBER:1:30]
            ]]}, 
            weight = 30, 
            enabled = true
        },
        {
            name_part = "MDM",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 4000,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 13,
            eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT", "VESSEL"},
            size_tags = {"MEDIUM"}, 
            weight = 60, 
            favored_size_multiplier_enabled = true, 
            size_distribution_weights = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=5, [6]=20, [7]=50, [8]=20, [9]=5 },
            tok = {[[
            [CREATURE_TILE:'d'][CREATURE_CLASS:SIZE_MEDIUM]
            
            [POPULATION_NUMBER:50:200]
			[CLUSTER_NUMBER:1:20]
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
            name_part = "MDM",
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 4000,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 13,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "PROBLEMATIC"},
            size_tags = {"MEDIUM"}, 
            weight = 60, 
            tok = {[[
            [CREATURE_TILE:'d'][CREATURE_CLASS:SIZE_MEDIUM]
            
            [POPULATION_NUMBER:50:200]
			[CLUSTER_NUMBER:1:20]
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
            min_raw_size_factor = 4000,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 13,
            eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT", "VESSEL"},
            size_tags = {"LARGE"}, 
            weight = 20, 
            favored_size_multiplier_enabled = true, 
            size_distribution_weights = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 },
            tok = {[[
            [CREATURE_TILE:'D'][CREATURE_CLASS:SIZE_LARGE]
            
            [POPULATION_NUMBER:20:100]
			[CLUSTER_NUMBER:1:10]
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
            name_part = "LRG", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 4000,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 13,
            eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT", "VESSEL"},
            size_tags = {"LARGE"}, 
            weight = 20, 
            favored_size_multiplier_enabled = true, 
            size_distribution_weights = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 },
            tok = {[[
            [CREATURE_TILE:'D'][CREATURE_CLASS:SIZE_LARGE]
            
            [POPULATION_NUMBER:20:100]
			[CLUSTER_NUMBER:1:10]
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
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "VESSEL", "DEVIANT"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:'D'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            [POPULATION_NUMBER:10:50]
			[CLUSTER_NUMBER:1:5]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 10, 
            enabled = false
        },
        {
            name_part = "GNT", 
            desc_part = " _______________________________________________________ __________/APPROX_MASS = %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 10000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"EXISTENTIAL", "AVATAR"},
            size_tags = {"GIANT"}, 
            tok = {[[
            [CREATURE_TILE:'D'][CREATURE_CLASS:SIZE_GIANT]
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
            eligible_rating_tags = {"EXISTENTIAL", "AVATAR"},
            size_tags = {"TITANIC"}, 
            tok = {[[
            [CREATURE_TILE:'D'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = false
        }
    },

    procgen_addon_table_1 = {
        {
            body_token = "HUMANOID_LIMBLESS:2EYESOCKET:2LUNGS:HEART:GUTS:ORGANS:THROAT:NECK:SPINE:BRAIN:SKULL:RIBCAGE:MOUTH:TONGUE:TEETH:",
            desc_part = "A biomechanical organism of cloned muscle and a mechanical endoskeleton, partially covered in armor plating, its face obscured by a metallic stylized skull with empty eye sockets; the most common demimech template. ",
            eligible_rating_tags = {"DEVIANT", "VESSEL", "AVATAR", "HAZARDOUS", "DANGEROUS", "PROBLEMATIC", "EXISTENTIAL", "VERMIN"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
            tok = {[[
			
    [MENT_ATT_RANGE:ANALYTICAL_ABILITY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:CREATIVITY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:EMPATHY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:FOCUS:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:INTUITION:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:KINESTHETIC_SENSE:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:LINGUISTIC_ABILITY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:MEMORY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:MUSICALITY:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:PATIENCE:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:SOCIAL_AWARENESS:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:SPATIAL_SENSE:0:400:600:750:800:900:1100]                   --
    [MENT_ATT_RANGE:WILLPOWER:0:400:600:750:800:900:1100]                   --
				
   
			]]}, 
            weight = 20,
		next_tables = {"procgen_subchart_table_1"}
        },
        {
            body_token = "HUMANOID_LIMBLESS_SPECIAL:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:THROAT_SPECIAL:NECK_SPECIAL:SPINE:BRAIN:SKULL:RIBCAGE:MOUTH:TONGUE:TEETH:",
            desc_part = "An artifical construct with a relatively normal, partly cyberized head and torso, exposed muscle partially covered in loose, ill-fitting skin and irregular armor plating. Metal stables and surgical scars mark its body, and its internals are a mesh of living organs and its mechanical endoskeleton; the result of a demimech that sought a more human form through harvesting the flesh of pan-humans. ",
            eligible_rating_tags = {"HOSTILE"},
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
            tok = {[[
			
    [MENT_ATT_RANGE:ANALYTICAL_ABILITY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:CREATIVITY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:EMPATHY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:FOCUS:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:INTUITION:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:KINESTHETIC_SENSE:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:LINGUISTIC_ABILITY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:MEMORY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:MUSICALITY:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:PATIENCE:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:SOCIAL_AWARENESS:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:SPATIAL_SENSE:0:100:200:300:400:450:500]                       ---
    [MENT_ATT_RANGE:WILLPOWER:0:100:200:300:400:450:500]                       ---
			
			]]}, 
            weight = 5,
		next_tables = {"procgen_subchart_table_2"}
        },
        {
          
            body_token = "HUMANOID_LIMBLESS_SPECIAL:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:THROAT_SPECIAL:NECK_SPECIAL:SPINE:BRAIN:SKULL:RIBCAGE:MOUTH:TONGUE:TEETH:FACIAL_FEATURES:",
            desc_part =  "An artifical construct with a humanoid, partly cyberized head and torso, but with limbs of cloned  muscle partially covered in armor plating. Metal stables and surgical scars mark its body, and its internals are a mesh of living organs and its mechanical endoskeleton; the result of a demimech that sought a more human form through N-matter. ",
            transcendent_desc_part = "A postbiological humanoid consisting of synthetic bone and musculature with a partial integument covering its torso and head, its form doll-like and sexless, all covered in armor plating. ",
            eligible_rating_tags = {"SOPHONT"},
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
            tok = {[[
				
			
    [MENT_ATT_RANGE:ANALYTICAL_ABILITY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:CREATIVITY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:EMPATHY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:FOCUS:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:INTUITION:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:KINESTHETIC_SENSE:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:LINGUISTIC_ABILITY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:MEMORY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:MUSICALITY:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:PATIENCE:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:SOCIAL_AWARENESS:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:SPATIAL_SENSE:150:600:800:900:1000:1100:1500]                 -
    [MENT_ATT_RANGE:WILLPOWER:150:600:800:900:1000:1100:1500]                 -
			
			]]}, 
            weight = 5,
		next_tables = {"procgen_subchart_table_3"}
        }
    },

    procgen_addon_table_2 = {         
			{
                body_token = "BIORIGHTARM:BIOLEFTARM:BIORIGHTLEG:BIOLEFTLEG:5FINGERS:5TOES",
                desc_part = "It has an upright posture, with humanoid arms and legs ending in metallic clawed digits. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT", "VESSEL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:BIORIGHTLEG:BIOLEFTLEG:5FINGERS:5TOES",
                desc_part = "It has a hunched-forward posture, with humanoid arms and powerful backwards-bent legs ending in metallic clawed digits. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "DANGEROUS", "DEVIANT", "VESSEL"},
                eligible_size_tags = {"LARGE", "HUGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:4LEG:5FINGERS:5TOES",
                desc_part = "It has an upright posture, with humanoid arms and a lower body that splits into four splayed legs, all ending in metallic clawed digits. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT", "VESSEL"},
                eligible_size_tags = {"LARGE", "HUGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:4LEG:5FINGERS:5TOES",
                desc_part = "Its form resembles a human torso with long, splayed legs emerging from its thighs and shoulders, its arms hanging from its front. ",
                eligible_rating_tags = {"HOSTILE", "DANGEROUS", "DEVIANT", "VESSEL"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:4LEG:5FINGERS:5TOES",
                desc_part = "Its form resembles a squat, rounded shell with four long, splayed legs ending in simple platforms emerging from its sides, humanoid arms emerging from its front. ",
                eligible_rating_tags = {"HAZARDOUS"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:6LEG:5FINGERS:5TOES",
                desc_part = "Its form resembles a squat, rounded shell with six long, splayed legs ending in simple platforms emerging from its sides, humanoid arms emerging from its front. ",
                eligible_rating_tags = {"HAZARDOUS", "AVATAR"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:BIORIGHTLEG:BIOLEFTLEG:5FINGERS:2WINGS",
                desc_part = "Its form resembles a human torso with long, spindly legs ending in pointed tips, and ornithopter-like wings emerging from its back. ",
                eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM"}, 
				tok = {[[
				[FLIER]
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "BIORIGHTARM:BIOLEFTARM:4LEG:5FINGERS:4WINGS",
                desc_part = "Its form resembles some kind of fleshy insect encased in a narrow metallic ribcage, with four legs ending in pointed tips and a pair of arms hanging in front of them, two pairs of ornithopter-like wings emerging from its back . ",
                eligible_rating_tags = {"DANGEROUS"},
                eligible_size_tags = {"LARGE", "HUGE"}, 
				tok = {[[
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
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:DERMAL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "TAIL",
                desc_part = "Its form resembles an elongated spine and ribcage holding pulsating organs, carried by many thin, long legs. ",
                eligible_rating_tags = {"PROBLEMATIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "TAIL",
                desc_part = "Its form resembles a thick, elongated spine slithering along the ground. ",
                eligible_rating_tags = {"HAZARDOUS"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "TAIL",
                desc_part = "Its form resembles an elongated spine and ribcage holding pulsating organs, carried by many short, thin legs, and protected by thick, arching plates of metal. ",
                eligible_rating_tags = {"HAZARDOUS", "EXISTENTIAL"},
                eligible_size_tags = {"GIANT"}, 
				tok = {[[
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "TAIL",
                desc_part = "Its form resembles an elongated spine and ribcage holding pulsating organs, carried by many thin, long legs. ",
                eligible_rating_tags = {"VERMIN"},
                eligible_size_tags = {"SMALL"}, 
				tok = {[[
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "TAIL",
                desc_part = "Its form resembles a thick, elongated spine slithering along the ground. ",
                eligible_rating_tags = {"VERMIN"},
                eligible_size_tags = {"SMALL"}, 
				tok = {[[
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            }
    },
    
	
    procgen_addon_table_3 = {             
			{
                body_token = "",
                desc_part = "",
                eligible_rating_tags = {"HAZARDOUS", "PROBLEMATIC", "DANGEROUS", "VERMIN", "EXISTENTIAL", "DEVIANT", "VESSEL", "AVATAR"},
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
                weight = 50
            },     
			{
                body_token = "",
                desc_part = "",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD_SPECIAL:BY_CATEGORY:TOOTH]
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
            }
    },
    
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
      procgen_subchart_table_1 = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "HOSTILE", "EXISTENTIAL", "DEVIANT", "VESSEL", "AVATAR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
			
			
				
			
				[SELECT_CASTE:ALL]
                ]]},
                weight = 50
            }
			},
     
   
      procgen_subchart_table_2 = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "HOSTILE", "EXISTENTIAL", "DEVIANT", "VESSEL", "AVATAR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
		
                ]]},
                weight = 50
            }
			},
   
   
      procgen_subchart_table_3 = {
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "HOSTILE", "EXISTENTIAL", "DEVIANT", "VESSEL", "AVATAR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			
      
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "",
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
			
            shared_descriptor_tokens = [[
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
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

			
			]],
            weight = 100,
				eligible_rating_tags = {"DEVIANT", "VESSEL", "AVATAR"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:1]
					]],
                    description_addon = "It has an exterior of cloned skin and a human face, but its many surgical scars and eerily mechanical movement reveal its true nature. Such humanlike specimens are prized for their craftsmanship. "
                },
                {
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:1]
					]],
                    description_addon = "It has an exterior of cloned skin and a human face, but its many surgical scars and eerily mechanical movement reveal its true nature. Such humanlike specimens are prized for their craftsmanship. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:10]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, one androgynous and sexless in the style of Transitional Era aesthetics, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:10]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, one androgynous and sexless in the style of Transitional Era aesthetics, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:100]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:100]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_FEMALE][FEMALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_MALE][MALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
			
            shared_descriptor_tokens = [[
			
			
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
			
			     [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
				 [TL_COLOR_MODIFIER:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			[SELECT_CASTE:CASTE3_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE4_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE4_MALE]
				
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
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:10:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			
			[SELECT_CASTE:CASTE1_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_MALE]
				[BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUE_LAYERS]
				
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
			
			[SELECT_CASTE:CASTE3_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE4_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE4_MALE]
			
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
				
				
			[SELECT_CASTE:ALL]
			
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
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD_SPECIAL]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
				
				
			[SELECT_CASTE:ALL]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"MEDIUM"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:10]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, one androgynous and sexless in the style of Transitional Era aesthetics, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:10]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, one androgynous and sexless in the style of Transitional Era aesthetics, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:100]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:100]
					]],
                    description_addon = "Its head and torso are covered in cloned skin and tissue to grant it a human appearance, but the upper arms and thighs give way to bare mechanical endoskeleton and vat-grown muscle. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_FEMALE][FEMALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_MALE][MALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
			
            shared_descriptor_tokens = [[
			
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
			
			     [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
				 [TL_COLOR_MODIFIER:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			[SELECT_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_MALE]
				
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
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:10:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
			
			[SELECT_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE3_MALE]
			
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
				
				
			[SELECT_CASTE:ALL]
			
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
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD_SPECIAL]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
				
				
			[SELECT_CASTE:ALL]
		
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"LARGE"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:10]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, androgynous and sexless in the style of Transitional Era aesthetics. "
                },
                {
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:10]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, androgynous and sexless in the style of Transitional Era aesthetics. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][SLOW_LEARNER][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:1000]
					]],
                    description_addon = "It has a face of cloned skin stretched over its metallic skull, a crude approximation of identity used by lesser variants. "
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
			
            shared_descriptor_tokens = [[
			
		[USE_MATERIAL_TEMPLATE:HAIR:HAIR_TEMPLATE]
	[USE_TISSUE_TEMPLATE:HAIR:HAIR_TEMPLATE]
			
			     [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
				 [TL_COLOR_MODIFIER:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1:IRIS_EYE_GRAY:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			[SELECT_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
				
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
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:10:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			[SELECT_CASTE:CASTE1_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE1_MALE]
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
			
			[SELECT_CASTE:CASTE2_FEMALE]
			[SELECT_ADDITIONAL_CASTE:CASTE2_MALE]
			
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD_SPECIAL:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:EYEBROW]
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
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD_SPECIAL:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
				
				
			[SELECT_CASTE:ALL]
			
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
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD_SPECIAL]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
				
				
			[SELECT_CASTE:ALL]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"HUGE"}, 
        },
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
			
            shared_descriptor_tokens = [[
			
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
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

			]],
            weight = 200,
            eligible_rating_tags = {"BENIGN", "AMBIENT", "VERMIN", "PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        },
        {
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret mounted to its chassis. "
                },
				{
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
			
            shared_descriptor_tokens = [[
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			]],
            weight = 25,
            eligible_rating_tags = {"HOSTILE", "DANGEROUS"},
            eligible_size_tags = {"MEDIUM"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret mounted to its chassis. "
                },
				{
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret mounted to its chassis. "
                },
				{
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:TURRET:ROTORGUN]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret and rotary gun mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:TURRET:ROTORGUN]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					]],
                    description_addon = "It is armed with a chemgun turret and rotary gun mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:TURRET:MISSILE_POD]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:5]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
								
					]],
                    description_addon = "It is armed with a chemgun turret and micromissile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:TURRET:MISSILE_POD]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:5]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
								
					]],
                    description_addon = "It is armed with a chemgun turret and micromissile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE5_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:TURRET:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
								
					]],
                    description_addon = "It is armed with a chemgun turret and cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE5_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:TURRET:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
								
					]],
                    description_addon = "It is armed with a chemgun turret and cannon mounted to its chassis. "
				}
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
			
            shared_descriptor_tokens = [[
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			]],
            weight = 25,
            eligible_rating_tags = {"HOSTILE", "DANGEROUS"},
            eligible_size_tags = {"LARGE"}, 
        },
		{
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a rotary gun, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a rotary gun, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:MISSILE_POD]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:10]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a rotary gun, and a missile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:MISSILE_POD]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:10]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a rotary gun, and a missile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:25]
					[BODY:2TURRETLR:MISSILE_POD:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:10]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a micromissile pod, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:25]
					[BODY:2TURRETLR:MISSILE_POD:CANNON]
						[NATURAL_SKILL:THROW:1]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:10]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of chemgun turrets, a micromissile pod, and a cannon mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
			
            shared_descriptor_tokens = [[
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			]],
            weight = 25,
            eligible_rating_tags = {"HOSTILE", "DANGEROUS"},
            eligible_size_tags = {"HUGE"}, 
        },
		{
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL2_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG2]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a pair of rotary guns, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE1_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL2_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG2]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a pair of rotary guns, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2MISSILE_POD]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP2]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a pair of micromissile pods, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2MISSILE_POD]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP2]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a pair of micromissile pods, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a micromissile pod, a rotary gun, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:20]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets, a micromissile pod, a rotary gun, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_MALE][MALE][CREATURE_CLASS:DEMIMACHINE_MALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets and a pair of chemical cannons mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4_FEMALE][FEMALE][CREATURE_CLASS:DEMIMACHINE_FEMALE][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four chemgun turrets and a pair of chemical cannons mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
			
            shared_descriptor_tokens = [[
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:MUSCLE]
            [TL_COLOR_MODIFIER:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1:RED:1]
                [TLCM_NOUN:muscle:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
		[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			]],
            weight = 25,
            eligible_rating_tags = {"EXISTENTIAL"},
            eligible_size_tags = {"GIANT"}, 
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