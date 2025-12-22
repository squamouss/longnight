
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "EXCASTE",
    MIN_CREATURES = 100,
    MAX_CREATURES = 200,
    BASE_CREATURE_NAME_PREFIX = "excaste ID",
    OUTPUT_FILENAME = "generated_excaste_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "excaste",
    TRANSCENDENT_NAME_ROOT_PLURAL = "excastes",

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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
        [COLOR:3:0:0]
        [CREATURE_CLASS:EXCASTE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
	
	[PERSONALITY:CURIOUS:0:25:50]
	[PERSONALITY:BASHFUL:0:25:50]
	[PERSONALITY:PRIVACY:0:25:50]
	[PERSONALITY:THOUGHTLESSNESS:25:75:100]
	[PERSONALITY:ORDERLINESS:0:25:50]
	[PERSONALITY:IMAGINATION:0:25:50]
	[PERSONALITY:ABSTRACT_INCLINED:0:25:50]



        
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

    [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]\
		
        [USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
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
        [BABY:1]
		
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
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
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
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
		
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = Excaste are human-derived peoples and fauna descended from those victimized by the hypertechnological afflictions of the solar system's final golden age. Rogue cloning systems, desperate bioengineering experiments, retroviral plagues, and worse. Often completely removed from the culture and legacy of caste-born sophonts, they know know as much of the present as the earliest humans did of their own world, save those welcomed back into the fold by pan-humanity. The rest are consigned to short lives of desperation, ignorance, and terror. _______________________________________________________ __________",
    },

   interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER][BIOME:ANY_RIVER]
            
            [CREATURE_CLASS:SOPHONT]            [COLOR:3:0:0]

			[BIOME:ANY_LAND]
					
            ]]},
            tags = {"SOPHONT"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
			            [COLOR:5:0:0]
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
			[SPOUSE_CONVERTER]
			[CONVERTED_SPOUSE]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
			
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
			
            
			[LARGE_PREDATOR][CRAZED]
            [CREATURE_CLASS:EXISTENTIAL]
			[BIOME:ANY_LAND]	
            [LAIR:SIMPLE_BURROW:50]
            [LAIR:SIMPLE_MOUND:50]
            [LAIR:LABYRINTH:25]
            [LAIR:SHRINE:25]
            [HABIT:COLLECT_TROPHIES:50]
            [HABIT:COLLECT_WEALTH:50]
			
				
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = false
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
			
				
            ]]},
            tags = {"INCURSION"},
            weight = 1,
            enabled = false
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
			            [COLOR:5:0:0]
            [LARGE_PREDATOR][CRAZED][AMBUSHPREDATOR]
            
            [CREATURE_CLASS:DANGEROUS]
			
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
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
			            [COLOR:5:0:0]
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"BENIGN"},
            weight = 20,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
			            [COLOR:5:0:0]
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 20,
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
            weight = 5,
            enabled = true
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
            weight = 5,
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
            enabled = false
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
            
            [CREATURE_CLASS:VESSEL][NO_EAT][NO_DRINK]            [COLOR:3:0:0]
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
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MICRO"}, 
            tok = {[[
            [VERMIN_MICRO]
            [SMALL_REMAINS][VERMIN_HATEABLE]
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
            body_size_index_and_child_count = 0, 
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
            body_size_index_and_child_count = 0,
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
            min_raw_size_factor = 10,
            base_adult_size_for_random = 1000,
            body_size_index_and_child_count = 1,
			eligible_rating_tags = {"PROBLEMATIC", "DOMESTIC", "HUNTER", "PRODUCT", "SANITATION", "COMPANION" },
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_TILE:'e'][CREATURE_CLASS:SIZE_LESSER]
            
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
			eligible_rating_tags = {"DEVIANT", "VESSEL", "HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS", "CARRIER", "HUNTER", "WEAPON", "LABOR", "SERVANT", "SANITATION", "PRODUCT"},
            size_tags = {"MEDIUM"}, 
            weight = 70, 
            favored_size_multiplier_enabled = true, 
            rating_specific_weights = { 
            ["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
            ["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
            ["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
            ["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
			},
            tok = {[[
           
        [CREATURE_TILE:'e']
        [CREATURE_SOLDIER_TILE:137]CREATURE_CLASS:SIZE_MEDIUM]
            
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
			eligible_rating_tags = {"DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "PROBLEMATIC", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "LABOR", "SERVANT", "PRODUCT"},
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
            [CREATURE_TILE:'E'][CREATURE_CLASS:SIZE_LARGE]
            
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
			eligible_rating_tags = {"DEVIANT", "VESSEL", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "NOMAD", "VEHICLE", "CARRIER", "LABOR", "SERVANT", "PRODUCT", "MILITARY"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:'E'][CREATURE_CLASS:SIZE_HUGE]
            
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
			eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "AVATAR"},
            size_tags = {"GIANT"}, 
            tok = {[[
            [CREATURE_TILE:'E'][CREATURE_CLASS:SIZE_GIANT]
            
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 2,
            enabled = false
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
            [CREATURE_TILE:'E'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = false
        }
    },
	
	
	
	
	
    procgen_table_sub_archetype = {
    {
        body_token = "HUMANOID_NECK:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = A once-human subjected to so sufficient degredation it can no longer be identified as sophont, existing completely outside of the genetic caste system. The product of retroviral engineering to escape the proprietary DNA of the Geno-Archons, it has toughened, leathery skin and animalistic features. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
		sub_archetype = {"APE"},
        tok = {
		[[
		[CREATURE_CLASS:EXCASTE_APE]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
		
		[PERSONALITY:ANGER_PROPENSITY:50:90:100]
		[PERSONALITY:VIOLENT:50:95:100]
		[PERSONALITY:ANXIETY_PROPENSITY:0:25:50]
		[PERSONALITY:STRESS_VULNERABILITY:0:25:50]
		[PERSONALITY:THOUGHTLESSNESS:0:10:40]
		[PERSONALITY:IMMODERATION:40:60:80]
		[PERSONALITY:DISCORD:50:90:100]
		[PERSONALITY:CRUELTY:50:90:100]
		[PERSONALITY:TOLERANT:0:10:40]
		[PERSONALITY:FRIENDLINESS:0:10:40]
		[PERSONALITY:POLITENESS:0:10:40]
		[PERSONALITY:DISDAIN_ADVICE:50:90:100]
		[PERSONALITY:CLOSEMINDED:25:50:75]
		[PERSONALITY:ABSTRACT_INCLINED:0:10:40]
		[PERSONALITY:IMAGINATION:0:10:40]
		[PERSONALITY:GREED:60:90:100]
		[PERSONALITY:TRUST:0:15:40]
		
					[BIOME:MARSH_TEMPERATE_SALTWATER][BIOME:SWAMP_TEMPERATE_SALTWATER]
					[BIOME:MARSH_TROPICAL_SALTWATER][BIOME:SWAMP_TROPICAL_SALTWATER]
					[BIOME:SWAMP_MANGROVE]
			[BIOME:MARSH_TEMPERATE_FRESHWATER][BIOME:SWAMP_TEMPERATE_FRESHWATER]
					[BIOME:MARSH_TROPICAL_FRESHWATER][BIOME:SWAMP_TROPICAL_FRESHWATER]
					
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
			[TL_COLOR_MODIFIER:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
					
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eyes:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
        weight = 40,
		next_tables = {
		"procgen_subchart_table_ape_body"
		}
    },
    {
        body_token = "HUMANOID_NECK:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = A once-human subjected to so sufficient degredation it can no longer be identified as sophont, existing completely outside of the genetic caste system. The product of cloning systems co-opted by the megastructures long ago, it has a neotenic appearance with a rounded head and hairless skin that seems perpetually slick with fluids. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
		sub_archetype = {"CLONE"},
        tok = {
		[[
		[CREATURE_CLASS:EXCASTE_CLONE]
			
			[BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:1:3]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:eyes:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			
		]]
		}, 
        weight = 30,
		next_tables = {
		"procgen_subchart_table_clone_body"
		}
    },
    {
        body_token = "HUMANOID_NECK:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = A once-human subjected to so sufficient degredation it can no longer be identified as sophont, existing completely outside of the genetic caste system. The product of retroviral genetic weapons and toxic contamination, its body is knobbed and distended with cancerous mass, mind addled by its rebellious flesh. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "NOMAD", "WEAPON", "PRODUCT"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
		sub_archetype = {"CANCER"},
        tok = {
		[[
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
		
		[PERSONALITY:ANGER_PROPENSITY:50:95:100]
		[PERSONALITY:VIOLENT:50:95:100]
		[PERSONALITY:ANXIETY_PROPENSITY:50:90:100]
		[PERSONALITY:STRESS_VULNERABILITY:50:90:100]
		[PERSONALITY:THOUGHTLESSNESS:50:95:100]
		[PERSONALITY:IMMODERATION:50:95:100]
		[PERSONALITY:DISCORD:50:90:100]
		[PERSONALITY:CRUELTY:40:80:100]
		[PERSONALITY:TOLERANT:0:10:50]
		[PERSONALITY:FRIENDLINESS:0:10:50]
		[PERSONALITY:POLITENESS:0:10:50]
		[PERSONALITY:DISDAIN_ADVICE:50:95:100]
		[PERSONALITY:CLOSEMINDED:50:95:100]
		
		[CREATURE_CLASS:EXCASTE_CANCER]
		
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1:PINK:1:DARK_PINK:1:PALE_PINK:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
			
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyes:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
		]]
		}, 
        weight = 20,
		next_tables = {
		"procgen_subchart_table_cancer_body"
		}
    },
    {
        body_token = "TORSO_MODULAR:2LUNGS:HEART:GUTS:ORGANS:SPINE:AI_CORE:RIBCAGE",
        desc_part = "_______________________________________________________ __________/TYPE = A once-human subjected to so sufficient degredation it can no longer be identified as sophont, existing completely outside of the genetic caste system. Inhabited by the refuse of the digital ecosystem, its weathered skin and clumsy gait, coupled with many surgical scars, mark it as a refuge for lowly Datasphere entities or even mere self-perpetuating algorithms. An electronic brain hums within, clasped to what remains of the brainstem to puppet its host. _______________________________________________________ __________/DESC = ",
		eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
		sub_archetype = {"BLINDSIGHT"},
        tok = {
		[[
		[CREATURE_CLASS:EXCASTE_BLINDSIGHT]
		
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:40:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
		
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:ANY_DESERT]
			[BIOME:MOUNTAIN]
			
		
		]]
		}, 
        weight = 10,
		next_tables = {
		"procgen_subchart_table_blindsight_body"
		}
    }
    },
	
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
    
        procgen_subchart_table_ape_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_ape_head",
		"procgen_subchart_table_ape_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a squat, simian body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_ape_head",
		"procgen_subchart_table_ape_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a slim, sinewy, simian body, with ",
				eligible_rating_tags = {"DANGEROUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_ape_head",
		"procgen_subchart_table_ape_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a doubled-over, near-quadrupedal body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_ape_head",
		"procgen_subchart_table_ape_limbs"
		}
            }
			},
			
			
	
        procgen_subchart_table_ape_head = {
            {    
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is mostly humanoid, aside from its protruding jaw and sloped forehead, with ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_ape_eyes",
		"procgen_subchart_table_ape_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is uncannily bestial, resembling some pre-human ancestor of pan-humanity with its near-absent forehead and protruding jaw, older even than baseline civilization, with ",
		eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
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
		"procgen_subchart_table_ape_eyes",
		"procgen_subchart_table_ape_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is wholly bestial, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_ape_snout",
		"procgen_subchart_table_ape_eyes",
		"procgen_subchart_table_ape_hair"
		}
            }
            },
	
	
        procgen_subchart_table_ape_snout = {
            {    
                body_token = "", 
                desc_part = "a long, narrow snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

				
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a short, broad snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a large, broad snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a small, narrow snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_teeth"
		}
            }
            },
			
	
        procgen_subchart_table_ape_teeth = {
            {    
                body_token = "", 
                desc_part = "with uncannily human teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
                desc_part = "with large, blocky teeth, and ",
				eligible_rating_tags = {"DEVIANT", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with narrow, needle-like teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "SERVANT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:50]
            [ATTACK_PENETRATION_PERC:150]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with tangled, conical teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HUNTER", "WEAPON"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            }
            },
	
        procgen_subchart_table_ape_eyes = {
            {    
                body_token = "", 
                desc_part = "very human eyes aside from a lack of whites. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "small, wide-spaced eyes, lacking whites. ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "large, round eyes, lacking whites. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [NOCTURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            }
            },
	
			
	
        procgen_subchart_table_ape_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "HOSTILE"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
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
                desc_part = "It has hair on its head and running down its neck like a mane. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
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
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It has hair on its head and circling down its cheeks and neck like a mane. ",
				eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
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
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
			
			
			
			
			
			
	    
        procgen_subchart_table_ape_limbs = {
            {    
                body_token = "", 
                desc_part = "It has normal humanoid arms and bent legs, with ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid limbs and perpetually-bent legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:675:450:225:1900:2900] 39 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {
                body_token = "", 
                desc_part = "It has normal humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {          
                body_token = "", 
                desc_part = "It has limbs like the extinct primates of the homeworld, capable of effortlessly scaling sheer surfaces, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "DOMESTIC", "HUNTER", "WEAPON", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {      
                body_token = "", 
                desc_part = "It has limbs like the extinct primates of the homeworld, capable of effortlessly scaling sheer surfaces, with ",
				eligible_rating_tags = {"VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            },
            {        
                body_token = "", 
                desc_part = "It has limbs like the extinct primates of the homeworld but inhumanly elongated, capable of effortlessly scaling sheer surfaces, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "DOMESTIC"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:675:450:225:1900:2900] 39 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:675:450:225:1900:2900] 39 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_ape_digits",
		"procgen_subchart_table_tail"
		}
            }
			},
			
			
			
			
	    
        procgen_subchart_table_ape_digits = {
            {    
                body_token = ":5FINGERS:5TOES", 
                desc_part = "clawed digits and ",
		eligible_rating_tags = {"DEVIANT", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:10]
            [ATTACK_PENETRATION_PERC:20]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":5FINGERS:5TOES", 
                desc_part = "elongated clawed digits and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:20]
            [ATTACK_PENETRATION_PERC:50]
            [ATTACK_FLAG_EDGE]
            [ATTACK_FLAG_CANLATCH]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:20]
            [ATTACK_PENETRATION_PERC:50]
            [ATTACK_FLAG_EDGE] 
            [ATTACK_FLAG_CANLATCH]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
	
                ]]},
                weight = 25
            }
			},
			
		
        procgen_subchart_table_tail = {
            {    
                body_token = "", 
                desc_part = "no tail between its legs. ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a short, tapering tail. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a long, snaking tail. ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
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

			
    
        procgen_subchart_table_clone_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_clone_head",
		"procgen_subchart_table_clone_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT", "DANGEROUS"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_clone_head",
		"procgen_subchart_table_clone_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a flexible, elongated upright body, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_clone_head",
		"procgen_subchart_table_clone_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a doubled-over, near-quadrupedal body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_clone_head",
		"procgen_subchart_table_clone_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a flattened, horizontally-aligned body, with ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "HUNTER", "WEAPON", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_clone_head",
		"procgen_subchart_table_clone_limbs"
		}
            }
			},
			
	
	
			
	
        procgen_subchart_table_clone_head = {
            {    
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is mostly humanoid though its features are half-grown and vestigial, ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_clone_teeth",
		"procgen_subchart_table_clone_eyes",
		"procgen_subchart_table_clone_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is neotenic like that of a fetus, with only holes for its ears and nose, ",
		eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_clone_teeth",
		"procgen_subchart_table_clone_eyes",
		"procgen_subchart_table_clone_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is neotenic with an elongated skull, with only holes for its ears and nose, ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_clone_teeth",
		"procgen_subchart_table_clone_eyes",
		"procgen_subchart_table_clone_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARHOLE:2NOSEHOLE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is neotenic with an enlarged, rounded skull skull, only holes for its ears and nose, ",
				eligible_rating_tags = { "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_clone_teeth",
		"procgen_subchart_table_clone_eyes",
		"procgen_subchart_table_clone_hair"
		}
            }
            },
	
	
        procgen_subchart_table_clone_teeth = {
            {    
                body_token = "", 
                desc_part = "with uncannily human teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
                desc_part = "with large, blocky teeth, and ",
				eligible_rating_tags = { "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with narrow, needle-like teeth, and ",
				eligible_rating_tags = { "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "SERVANT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:50]
            [ATTACK_PENETRATION_PERC:150]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with tangled, conical teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:200]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            }
            },
	
        procgen_subchart_table_clone_eyes = {
            {    
                body_token = "", 
                desc_part = "large, almost alien all-black eyes. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "small, wide-spaced all-black eyes. ",
				eligible_rating_tags = { "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "huge, round all-black eyes. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [NOCTURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            }
            },
	
			
	
        procgen_subchart_table_clone_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"DEVIANT"},
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
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:190:195:200:205:210:215:220]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:1:2:3:4:5:6]
                [APP_MOD_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
				
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "It is completely hairless. ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },

					
	    
        procgen_subchart_table_clone_limbs = {
            {    
                body_token = "", 
                desc_part = "It has normal humanoid arms and legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid limbs and legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:675:450:225:1900:2900] 39 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            },
            {
                body_token = "", 
                desc_part = "It has normal humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            },
            {          
                body_token = "", 
                desc_part = "It has has short, muscular limbs that let it crawl as fast as it walks, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:675:450:225:1900:2900] 39 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:675:450:225:1900:2900] 39 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            },
            {      
                body_token = "", 
                desc_part = "It has humanoid arms and short, muscular legs that let it crawl as fast as it walks, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[STANCE_CLIMBER][NATURAL_SKILL:CLIMBING:15]

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_clone_digits",
		"procgen_subchart_table_tail"
		}
            }
			},
			
			
			
			
	    
        procgen_subchart_table_clone_digits = {
            {    
                body_token = ":5FINGERS:5TOES", 
                desc_part = "soft, flexible digits without nails, and ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	
                ]]},
                weight = 25
            },
            {     
                body_token = ":5FINGERS:5TOES", 
                desc_part = "tough, jointed digits without nails, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":5FINGERS:5TOES", 
                desc_part = "tough, many-jointed digits without nails, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	
                ]]},
                weight = 25
            }
			},
			
		
        procgen_subchart_table_tail = {
            {    
                body_token = "", 
                desc_part = "no tail between its legs. ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a short, tapering tail. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a long, snaking tail. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph

	
                ]]},
                weight = 25
            },
            {     
                body_token = ":TAIL", 
                desc_part = "a thick, finned tail. ",
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				[AMPHIBIOUS]
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:900:675:450:225:1900:2900] 39 kph
	
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

			
				
			
        procgen_subchart_table_cancer_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "SOPHONT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_cancer_head",
		"procgen_subchart_table_cancer_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunchbacked humanoid body, with ",
		eligible_rating_tags = {"DEVIANT", "HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "NOMAD", "WEAPON", "PRODUCT", "VERMIN"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_cancer_head",
		"procgen_subchart_table_cancer_limbs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a doubled-over, near-quadrupedal body, with ",
		eligible_rating_tags = {"HOSTILE", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "NOMAD", "WEAPON", "PRODUCT", "VERMIN"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_cancer_head",
		"procgen_subchart_table_cancer_limbs"
		}
            }
			},
			

	
	
	
        procgen_subchart_table_cancer_head = {
            {    
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is remarkably preserved, with relatively untouched facial features, and ",
				eligible_rating_tags = {"DEVIANT"},
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
		"procgen_subchart_table_cancer_eyes",
		"procgen_subchart_table_cancer_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is a grotesque mess of tumorous flesh with features half-obscured, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "EXISTENTIAL", "DANGEROUS", "PROBLEMATIC", "WEAPON", "MILITARY", "SERVANT", "NOMAD", "DOMESTIC"},
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
		"procgen_subchart_table_cancer_eyes",
		"procgen_subchart_table_cancer_hair"
		}
            },
            {     
                body_token = ":2EYES:2EARS:NOSE:MOUTH:TONGUE:FACIAL_FEATURES:TEETH", 
                desc_part = "Its head is deformed into a monstrous animalistic visage, possessing ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
		"procgen_subchart_table_cancer_snout",
		"procgen_subchart_table_cancer_eyes",
		"procgen_subchart_table_cancer_hair"
		}
            }
            },
	
	
        procgen_subchart_table_cancer_snout = {
            {    
                body_token = "", 
                desc_part = "a long, narrow snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

				
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a short, broad snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a large, broad snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_teeth"
		}
            },
            {     
                body_token = "", 
                desc_part = "a small, narrow snout ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_teeth"
		}
            }
            },
			
	
        procgen_subchart_table_cancer_teeth = {
            {    
                body_token = "", 
                desc_part = "with uncannily human teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
                desc_part = "with large, blocky teeth, and ",
				eligible_rating_tags = {"DEVIANT", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with narrow, needle-like teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "SERVANT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:50]
            [ATTACK_PENETRATION_PERC:150]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            },
            {     
                body_token = "", 
                desc_part = "with tangled, conical teeth, and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HUNTER", "WEAPON"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:200]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
                ]]},
                weight = 75
            }
            },
	
        procgen_subchart_table_cancer_eyes = {
            {    
                body_token = "", 
                desc_part = "very human eyes aside from a lack of whites. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "small, wide-spaced eyes, lacking whites. ",
				eligible_rating_tags = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [DIURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                ]]},
                weight = 25
            },
            {     
                body_token = "", 
                desc_part = "large, round eyes, lacking whites. ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [NOCTURNAL]
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 25
            }
            },
	
			
	
        procgen_subchart_table_cancer_hair = {
            {    
                body_token = "", 
                desc_part = "It has hair on its head, like a human's. ",
				eligible_rating_tags = {"DEVIANT", "VESSEL", "HOSTILE"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:GRAY:1:LIGHT_GRAY:1:DARK_GRAY:1:GRAY:1:DARK_GRAY:1:DARK_GRAY:1]
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
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:0:1:2:3:4:5:6]
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
				eligible_rating_tags = {"DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25
            }
            },
			
			
			
			
			
			
	    
        procgen_subchart_table_cancer_limbs = {
            {    
                body_token = "", 
                desc_part = "It has normal humanoid arms and bent legs, with ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_digits"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid limbs and perpetually-bent legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:675:450:225:1900:2900] 39 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_digits"
		}
            },
            {
                body_token = "", 
                desc_part = "It has normal humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_digits"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has elongated humanoid arms and muscular digitigrade legs, with ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "PROBLEMATIC", "WEAPON", "SERVANT" },
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
	[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
	[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
	
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_cancer_digits"
		}
            }
			},
			
			
			
			
	    
        procgen_subchart_table_cancer_digits = {
            {    
                body_token = ":5FINGERS:5TOES", 
                desc_part = "human digits and ",
		eligible_rating_tags = {"DEVIANT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

	
                ]]},
                weight = 50
            },
            {     
                body_token = ":5FINGERS:5TOES", 
                desc_part = "clawed digits and ",
		eligible_rating_tags = {"DEVIANT", "BENIGN", "HAZARDOUS", "DOMESTIC", "NOMAD", "SERVANT", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:10]
            [ATTACK_PENETRATION_PERC:20]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
	
                ]]},
                weight = 25
            },
            {     
                body_token = ":5FINGERS:5TOES", 
                desc_part = "elongated clawed digits and ",
				eligible_rating_tags = {"DEVIANT", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "NOMAD", "HUNTER", "WEAPON", "SERVANT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:20]
            [ATTACK_PENETRATION_PERC:50]
            [ATTACK_FLAG_EDGE]
            [ATTACK_FLAG_CANLATCH]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:STANCE:BY_CATEGORY:TOE:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:20]
            [ATTACK_PENETRATION_PERC:50]
            [ATTACK_FLAG_EDGE] 
            [ATTACK_FLAG_CANLATCH]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
	
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

			
			
    
        procgen_subchart_table_blindsight_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT"},
				eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = { 
		"procgen_subchart_table_dermal2",
		"procgen_subchart_table_blindsight_head",
		"procgen_subchart_table_blindsight_arms",
		"procgen_subchart_table_blindsight_legs"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a hunchbacked, humanoid body, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "NOMAD"},
				eligible_size_tags = {"LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = { 
		"procgen_subchart_table_dermal2",
		"procgen_subchart_table_blindsight_head",
		"procgen_subchart_table_blindsight_arms",
		"procgen_subchart_table_blindsight_legs"
		}
            }
			},
			
	
			
	
        procgen_subchart_table_blindsight_head = {
            {    
                body_token = ":HEADNECK_MODULAR:2EARS:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid, unmarked save the circular scar on its cranium where the brain was extracted and replaced with an AI core. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE"},
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
		"procgen_subchart_table_blindsight_eyes",
		"procgen_subchart_table_blindsight_mouth",
		"procgen_subchart_table_blindsight_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:THROAT:NECK:SKULL", 
                desc_part = "Its head is humanoid, but the top and back are carved away to exposed the armored AI core that has replaced the brain. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
		"procgen_subchart_table_blindsight_eyes",
		"procgen_subchart_table_blindsight_mouth",
		"procgen_subchart_table_blindsight_hair"
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is is obscured by a metal faceplate melded to its visage, leaving only room for eye, nose, and earholes, the AI core that has replaced its brain visible behind it. ",
				eligible_rating_tags = { "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
    
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
		"procgen_subchart_table_blindsight_eyes",
		"procgen_subchart_table_blindsight_mouth",
		"procgen_subchart_table_blindsight_hair"
		}
            }
            },
	
	
        procgen_subchart_table_blindsight_eyes = {
            {    
                body_token = ":2EYES:EYELIDS", 
                desc_part = "clouded, dead eyes, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyes:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYES:EYELIDS", 
                desc_part = "cybernetic eyes, and ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eyelights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
				
				
                ]]},
                weight = 25
            },
            {     
                body_token = ":2EYESOCKET", 
                desc_part = "eye sockets with camera-like mechanical lenses embedded in them, and ",
				eligible_rating_tags = {"HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

     [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eye sockets:PLURAL]
				
                    [LOW_LIGHT_VISION:10000]
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:lenses:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 40
            },
            {     
                body_token = "", 
                desc_part = "eyes obscured by a mass of sensory bulbs and antennae, and ",
				eligible_rating_tags = {"HOSTILE"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

				[EXTRAVISION]
                    [LOW_LIGHT_VISION:10000]
				
                ]]},
                weight = 10

            }
            },
	
			
			
	
        procgen_subchart_table_blindsight_mouth = {
            {    
                body_token = ":NOSE:MOUTH:TONGUE:TEETH:CHEEKS:LIPS", 
                desc_part = "a normal human face otherwise. ",
				eligible_rating_tags = {"DEVIANT", "SERVANT"},
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
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
				
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
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
                desc_part = "a lower face replaced by a metallic, skeletal jaw. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
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
                body_token = "", 
                desc_part = "a lower face replaced by a rebreather system built into its nose and jaw. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
        [CREATURE_CLASS:NOGAS]
			
                ]]},
                weight = 50

            }
            },
				
	
	
	
        procgen_subchart_table_blindsight_hair = {
            {    
                body_token = "", 
                desc_part = "It is completely hairless, surgical scars visible on all its biological tissue. ",
				eligible_rating_tags = {"HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
            [TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
                [TLCM_NOUN:dermal plating:SINGULAR]
			[TL_COLOR_MODIFIER:BLUE:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
                ]]},
                weight = 25
            }
            },
	
	
	
        procgen_subchart_table_blindsight_arms = {
            {     
                body_token = ":BIORIGHTARM:BIOLEFTARM:5FINGERS", 
                desc_part = "Its two biological humanoid arms.",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
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
		"procgen_subchart_table_blindsight_fingers"
		}
            },
            {     
                body_token = ":MACHINERIGHTARM:MACHINELEFTARM", 
                desc_part = "It has two cybernetic humanoid arms, ending in ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
		"procgen_subchart_table_blindsight_fingers"
		}
            },
            {     
                body_token = ":MACHINERIGHTARM:MACHINELEFTARM", 
                desc_part = "It has two elongated cybernetic arms, ending in ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
		"procgen_subchart_table_blindsight_fingers"
		}
            },
            {     
                body_token = ":MACHINERIGHTARM:MACHINELEFTARM", 
                desc_part = "It has two powerful cybernetic arms, ending in  ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
                weight = 50
            },
            {     
                body_token = ":MACHINE4ARM", 
                desc_part = "It has four cybernetic arms, ending in  ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
                weight = 50
            }
            },
			
			
	
        procgen_subchart_table_blindsight_fingers = {
            {     
                body_token = "", 
                desc_part = "simple mechanical graspers. ",
				eligible_rating_tags = {"SERVANT", "NOMAD", "VESSEL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":MACHINEFINGERS", 
                desc_part = "humanoid fingers. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

                ]]},
                weight = 50
            },
            {     
                body_token = ":MACHINEFINGERS", 
                desc_part = "clawed fingers. ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[

        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER_ROBOT:EXTERIOR]
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
	
			
	
        procgen_subchart_table_blindsight_legs = {
            {     
                body_token = ":BIORIGHTLEG:BIOLEFTLEG:5TOES", 
                desc_part = "It has a pair of humanoid legs.",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
			
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph	
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 50
            },
            {     
                body_token = ":MACHINERIGHTLEG:MACHINELEFTLEG", 
                desc_part = "It has a pair of cybernetic legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
		
				[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph, NO DATA
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900] 7 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:2990:2257:1525:731:4300:6100] 12 kph, NO DATA
                ]]},
                weight = 25
            },
            {     
                body_token = ":MACHINERIGHTLEG:MACHINELEFTLEG", 
                desc_part = "It has a pair of backwards-bent cybernetic legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
                weight = 25
            },
            { 
                body_token = ":MACHINERIGHTLEG:MACHINELEFTLEG", 
                desc_part = "It has a pair of digitigrade cybernetic legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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
                weight = 25
            },
            {         
                body_token = ":MACHINE4LEG", 
                desc_part = "It has four cybernetic legs, with ",
				eligible_rating_tags = {"DEVIANT", "HOSTILE", "VESSEL", "SERVANT", "NOMAD"},
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


        procgen_subchart_table_dermal2 = {
            {     
                body_token = "", 
                desc_part = "no armor or cybernetics on its body. ",
			eligible_rating_tags = { "BENIGN", "PROBLEMATIC", "DOMESTIC", "HUNTER", "LABOR", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
                ]]},
                weight = 100
            },
            { 
                body_token = "", 
                desc_part = "form-fitting meta-alloy dermal plating grows melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = { "DEVIANT", "VESSEL", "SOPHONT", "AVATAR", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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

        procgen_subchart_table_dermal = {
            {     
                body_token = "", 
                desc_part = "no armor or cybernetics on its body. ",
			eligible_rating_tags = { "BENIGN", "PROBLEMATIC", "DOMESTIC", "HUNTER", "LABOR", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT", "DANGEROUS", "HAZARDOUS"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
                ]]},
                weight = 100
            },
            { 
                body_token = "", 
                desc_part = " a set of mechanical ports along its spine that can interface with vehicles or cybernetic enhancements. ",
			eligible_rating_tags = {"DEVIANT", "VESSEL", "SOPHONT"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
                ]]},
                weight = 100
            },
            {       
                body_token = "", 
                desc_part = "form-fitting meta-alloy dermal plating grows melded to its body, growing denser at the extremities. ",
			eligible_rating_tags = { "AVATAR", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "HAZARDOUS"},
                eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:EXCASTE_FEMALE][POP_RATIO:10000]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:EXCASTE_MALE[POP_RATIO:10000]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
			eligible_rating_tags = {"SOPHONT", "DEVIANT", "AVATAR", "VESSEL", "HOSTILE", "INCURSION", "EXISTENTIAL", "DANGEROUS", "BENIGN", "HAZARDOUS", "PROBLEMATIC", "DOMESTIC", "COMPANION", "NOMAD", "VEHICLE", "CARRIER", "HUNTER", "WEAPON", "MILITARY", "LABOR", "SERVANT", "SANITATION", "PRODUCT", "VERMIN", "AMBIENT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
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