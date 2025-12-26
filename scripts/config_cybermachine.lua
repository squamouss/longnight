
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CYBERMACHINE",
    MIN_CREATURES = 200,
    MAX_CREATURES = 400,
    BASE_CREATURE_NAME_PREFIX = "cybermech ID",
    OUTPUT_FILENAME = "generated_cybermech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

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
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
            [COLOR:7:0:0]
        [CREATURE_CLASS:CYBERMACHINE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [NO_SLEEP][NOEMOTION][NOPAIN][NOBREATHE]


		
		
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
		
				[SOUND:PEACEFUL_INTERMITTENT:10:100000:VOCALIZATION:whirr:whirrs:whirring]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:clank:clanks:clanking]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:grind:grinds:grinding]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:garble:emits a garbled transmission:a garbled transmission]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:garble:emits a burst of static:a burst of static]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:garble:emits a high-pitched tone:a high-pitched tone]
				[SOUND:PEACEFUL_INTERMITTENT:100:100000:VOCALIZATION:garble:emits a low-pitched tone:a low-pitched tone]
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
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
            [CREATURE_CLASS:SOPHONT]
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
            
            [CREATURE_CLASS:EXISTENTIAL]
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 5,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
            [LARGE_PREDATOR][CRAZED][AMBUSHPREDATOR]
            
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
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS][PRONE_TO_RAGE:20]
            [FREQUENCY:20]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 20,
            enabled = true,
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
            enabled = true,
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
            enabled = true,
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
            enabled = true
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
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Deviant; it is an intelligent being capable of reason and metacognition, but has abandoned or lost human values and psychology in favor of competitiveness within the technosystem. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
            [CREATURE_CLASS:DEVIANT]            [COLOR:3:0:0]

            ]]},
            tags = {"DEVIANT"},
            weight = 5,
            enabled = true
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
        tok = {[[
		[VERMIN_MICRO][VERMIN_SOIL]
		[SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:5000:10000]
		]]},
        weight = 10,
        enabled = true
    },
    {
        name_part = "MNL",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 10,
        base_adult_size_for_random = 10,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"MINIMAL"},
        tok = {[[
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE][VERMIN_SOIL]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:1000:2000]
		]]},
        weight = 10,
        enabled = true
    },
    {
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'m'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = false
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "DANGEROUS"},
        size_tags = {"MEDIUM"},
        weight = 50,
        tok = {[[
		[CREATURE_TILE:'m'][CREATURE_CLASS:SIZE_MEDIUM]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "DEVIANT", "VESSEL", "HOSTILE", "BENIGN", "PROBLEMATIC"},
        size_tags = {"LARGE"},
        weight = 30,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_LARGE]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "DEVIANT", "VESSEL", "HOSTILE"},
        size_tags = {"HUGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"HAZARDOUS"},
        size_tags = {"GIANT"},
        weight = 4,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_GIANT][SAVAGE]
		
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
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"AVATAR"},
        size_tags = {"GIANT"},
        weight = 4,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_GIANT][SAVAGE]
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
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"GIANT"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_GIANT]
		
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
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"TITANIC"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_TITANIC]
		
		[CREATURE_CLASS:TITANICHEAD]
		[CREATURE_CLASS:TITANICARMS]
		[CREATURE_CLASS:TITANICSHOULDERS]
		[CREATURE_CLASS:TITANICHIPS]
		[CREATURE_CLASS:TITANICLEGS]
		[CREATURE_CLASS:TITANICBODY]
		]]},
        enabled = true
    },
    {
        name_part = "TTN",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"AVATAR"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'M'][CREATURE_CLASS:SIZE_TITANIC]
		[CREATURE_CLASS:TITANICHEAD]
		[CREATURE_CLASS:TITANICARMS]
		[CREATURE_CLASS:TITANICSHOULDERS]
		[CREATURE_CLASS:TITANICHIPS]
		[CREATURE_CLASS:TITANICLEGS]
		[CREATURE_CLASS:TITANICBODY]
		]]},
        enabled = true
		}
    },

    procgen_addon_table_1 = {
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine organism existing symbiotically within the Megastructures, endlessly repairing, expanding, and altering their titanic forms. It is slow and bulky, barely distinguishable from a part of the Megastructure itself. Its body is armored in thick slabs of plating capable of warding off most degrees unexpected environmental damage, allowing them to work for centuries with minimal wear, ",
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL"}, 
        tok = {
		[[
		[COLOR:7:0:0]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:1:3]

		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_1_1"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine organism existing symbiotically within the Megastructures, endlessly repairing, expanding, and altering their titanic forms. It is slow and bulky, barely distinguishable from a part of the Megastructure itself. Its body is armored in thick slabs of plating capable of warding off most degrees unexpected environmental damage, allowing them to work for centuries with minimal wear, ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS"},
            eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[COLOR:7:0:0]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:1:3]

		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_1_1"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine organism existing symbiotically among the organic growths of the Megastructures, preserving and perpetuating them to filter toxins from the water and provide breathable air. It has a flexible, segmented body with an organic design combining spindly limbs and a flexible cycaste of dermal plates, ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
		[COLOR:7:0:1]
					[BIOME:MARSH_TEMPERATE_SALTWATER][BIOME:SWAMP_TEMPERATE_SALTWATER]
					[BIOME:MARSH_TROPICAL_SALTWATER][BIOME:SWAMP_TROPICAL_SALTWATER]
					[BIOME:SWAMP_MANGROVE]

		]]
		}, 
        weight = 20,
		next_tables = {"procgen_subchart_table_1_2"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine organism existing by scavenging the ruins of the Megastructures to repair and fuel its body. It is spindly and skeletal, its form optimized for efficiency with minimal dermal plating hiding the hydraulics, wires, and endoskeleton of its interior. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[COLOR:6:0:0]
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]

		]]
		}, 
        weight = 50,
		next_tables = {"procgen_subchart_table_1_3"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine organism from the outer space between the celestial ruins of the Solar System, flitting between abandoned habitats and ruined worlds to scavenge for the rare, valuable parts that sustain its complex body. It has a sleek, featureless exterior with minimalistic dermal plating, joints obscured under overlapping layers of metal. ",
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
        eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[COLOR:0:0:1]
			[BIOME:MOUNTAIN]
			[BIOME:TUNDRA]
			[BIOME:GLACIER]

		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_1_4"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine derived from ancient drones, now grown feral. It has a flat body, with ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC"},
            eligible_size_tags = {"LESSER", "MEDIUM"}, 
        tok = {
		[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:0:3]
		[COLOR:6:0:1]
		[CLUSTER_NUMBER:1:5]
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_roomba"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine derived from ancient drones, now grown feral. It has a tall body, with ",
            eligible_rating_tags = {"BENIGN"},
            eligible_size_tags = {"MEDIUM"}, 
        tok = {
		[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:0:3]
		[COLOR:6:0:1]

		[CLUSTER_NUMBER:1:3]
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_turret"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine derived from ancient drones, now grown feral. It has a squat, bulky body, with ",
            eligible_rating_tags = {"BENIGN", "HAZARDOUS"},
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:0:3]
		[COLOR:6:0:1]
		[CLUSTER_NUMBER:1:5]

		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_drone"}
    },
    {
        body_token = "CHASSIS:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine derived from ancient drones, now grown feral. It has a long, bulky body, with ",
            eligible_rating_tags = {"BENIGN", "HAZARDOUS"},
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
        tok = {
		[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:0:3]

		[COLOR:6:0:1]
		[CLUSTER_NUMBER:1:5]
		]]
		}, 
        weight = 10,
		next_tables = {"procgen_subchart_table_drone"}
    },
    {
        body_token = "CHASSIS_TURRET:AI_CORE:POWER_CORE:SENSORY:",
        desc_part = "An autonomous machine derived from ancient drones, now grown feral. It has a squat, flat body and a bulky turret on top of it, with ",
            eligible_rating_tags = {"DANGEROUS", "EXISTENTIAL"},
            eligible_size_tags = { "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[BIOME:ANY_GRASSLAND]
			[BIOME:ANY_SAVANNA]
			[BIOME:ANY_SHRUBLAND]
			[BIOME:ANY_FOREST]
			[BIOME:MOUNTAIN]
			[BIOME:SUBTERRANEAN_WATER]
			[UNDERGROUND_DEPTH:0:3]

		[COLOR:6:0:1]
		[CLUSTER_NUMBER:1:3]
		]]
		}, 
        weight = 5,
		next_tables = {"procgen_subchart_table_drone"}
	},
	{
        body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:AI_CORE:POWER_CORE:",
        transcendent_body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:CORE:",
        desc_part = "A humanoid machine of hydraulics, tubes, and wires enclosed by an exterior of plastic segments. ",
        eligible_rating_tags = {"SOPHONT"},
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
	
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
				[TLCM_NOUN:exterior:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]

		]]
		}, 
        weight = 5,
		next_tables = {"procgen_subchart_table_humanoid"}
    },
    {
        body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:AI_CORE:POWER_CORE:",
        transcendent_body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:CORE:",
        desc_part = "A humanoid machine of hydraulics, tubes, and wires enclosed by an exterior of metal segments. ",
        eligible_rating_tags = {"SOPHONT", "VESSEL"},
        eligible_size_tags = {"MEDIUM", "LARGE"}, 
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
		next_tables = {"procgen_subchart_table_machine"}
    },
    {
        body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:AI_CORE:POWER_CORE:",
        transcendent_body_token = "MACHINE_LIMBLESS:MACHINE_HEAD_NECK:CORE:",
        desc_part = "A bent-backed humanoid machine of hydraulics, tubes, and wires enclosed by an exterior of metal segments. ",
        transcendent_desc_part = "A bent-backed humanoid machine covered in hypertechnological armor plating, its impossibly advanced components hidden under its segmented exterior. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "VESSEL"},
        eligible_size_tags = {"LARGE", "HUGE"}, 
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
		next_tables = {"procgen_subchart_table_machine"}
    },
    {
        body_token = "CHASSIS:MACHINE_HEAD_NECK:AI_CORE:POWER_CORE:",
        transcendent_body_token = "CHASSIS:MACHINE_HEAD_NECK:CORE:",
        desc_part = "A spindly machine of hydraulics, tubes, and wires enclosed by an exterior of metal segments, its head and limbs emerging from its elongated central mass. ",
        eligible_rating_tags = {"HOSTILE", "VESSEL", "DEVIANT"},
        eligible_size_tags = {"MEDIUM", "LARGE"}, 
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
        weight = 20,
		next_tables = {"procgen_subchart_table_machine"}
    },
    {
        body_token = "CHASSIS:MACHINE_HEAD_NECK:AI_CORE:POWER_CORE:",
        transcendent_body_token = "CHASSIS:MACHINE_HEAD_NECK:CORE:",
        desc_part = "A bulbous machine of hydraulics, tubes, and wires enclosed by an exterior of metal segments, its limbs and head emerging from its misshapen central mass. ",
        eligible_rating_tags = {"VESSEL", "DEVIANT", "HOSTILE", "AVATAR"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
        weight = 20,
		next_tables = {"procgen_subchart_table_machine"}
    }
    },
	
	

	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
	
	
        procgen_subchart_table_humanoid = {
		          {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are proportioned to its body, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			[PHYS_ATT_RANGE:TOUGHNESS:450:950:1150:1250:1350:1550:2250]             +
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are thin and long, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			]]
        }, 
        weight = 5 
    }
    },
    
        procgen_subchart_table_machine = {
		          {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are proportioned to its body, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			[PHYS_ATT_RANGE:TOUGHNESS:450:950:1150:1250:1350:1550:2250]             +
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are thin and long, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER:MACHINERIGHTARM:MACHINELEFTARM:MACHINERIGHTLEG:MACHINELEFTLEG:MACHINEFINGERS",
        desc_part = "Its limbs are short and squat, legs ending in simple metal platforms. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:750:600:439:1900:2900] 20 kph
			[PHYS_ATT_RANGE:TOUGHNESS:700:1200:1400:1500:1600:1800:2500]    ++
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        desc_part = "It has four splayed legs of average proportions ending in simple metal platforms along with two humanoid arms, sacrificing durability for increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[PHYS_ATT_RANGE:TOUGHNESS:150:600:800:900:1000:1100:1500]                -
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        desc_part = "It has six splayed legs of average proportions ending in simple metal platforms along with two humanoid arms, considerably sacrificing toughness for highly increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:400:600:750:800:900:1100]                    --
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_HUGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        desc_part = "It has eight splayed legs of average proportions ending in simple metal platforms along with two humanoid arms, greatly sacrificing toughness for extremely increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:100:200:300:400:450:500]                       ---
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        desc_part = "It has four short and squat splayed legs ending in simple metal platforms along with two humanoid arms, sacrificing durability for increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900] 30 kph
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        desc_part = "It has six short and squat splayed legs ending in simple metal platforms along with two humanoid arms, considerably sacrificing toughness for highly increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[PHYS_ATT_RANGE:TOUGHNESS:150:600:800:900:1000:1100:1500]                -
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_HUGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        desc_part = "It has eight short and squat splayed legs ending in simple metal platforms along with two humanoid arms, greatly sacrificing toughness for extremely increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:400:600:750:800:900:1100]                    --
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE4LEG:MACHINEFINGERS",
        desc_part = "It has four long, thin splayed legs ending in simple metal platforms along with two humanoid arms, sacrificing durability for increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:528:352:176:1900:2900] 50 kph
			[PHYS_ATT_RANGE:TOUGHNESS:150:600:800:900:1000:1100:1500]                -
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_LARGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE6LEG:MACHINEFINGERS",
        desc_part = "It has six long, thin splayed legs ending in simple metal platforms along with two humanoid arms, considerably sacrificing toughness for highly increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:438:292:146:1900:2900] 60 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:400:600:750:800:900:1100]                    --
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        transcendent_body_token = "MACHINE_LIMBLESS_LOWER_HUGE:MACHINERIGHTARM:MACHINELEFTARM:MACHINE8LEG:MACHINEFINGERS",
        desc_part = "It has eight long, thin splayed legs ending in simple metal platforms along with two humanoid arms, greatly sacrificing toughness for extremely increased speed.",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "EXISTENTIAL", "AVATAR"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:375:250:125:1900:2900] 70 kph
			[PHYS_ATT_RANGE:TOUGHNESS:0:100:200:300:400:450:500]                       ---
			]]
        }, 
        weight = 5 
    }
    },
    
    
        procgen_subchart_table_1_1 = {
            {     
                body_token = "", 
                desc_part = "carried slowly by many small legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8900:8825:8775:9500:9900] 1 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8900:8825:8775:9500:9900] 1 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8900:8825:8775:9500:9900] 1 kph
				
                ]]},
                weight = 100,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG:", 
                desc_part = "carried by a pair of short, stubby legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
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
                weight = 50,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:", 
                desc_part = "carried by four short, stubby legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE" }, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:2206:1692:1178:585:3400:4900] 15 kph
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
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE6LEG:", 
                desc_part = "carried by six short, stubby legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
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
                weight = 30,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE8LEG:", 
                desc_part = "carried by eight short, stubby legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC" }, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:730:561:351:1900:2900] 25 kph
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
                weight = 20,
		next_tables = {"procgen_subchart_table_arms"}
            }
			},
     
	 
    
        procgen_subchart_table_1_2 = {
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG:", 
                desc_part = "carried by a pair of long, backwards-bent legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
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
                weight = 50,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:", 
                desc_part = "carried by four long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE6LEG:", 
                desc_part = "carried by six long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE8LEG:", 
                desc_part = "carried by eight long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 20,
		next_tables = {"procgen_subchart_table_arms"}
            }
			},
	 
	 
    
        procgen_subchart_table_1_3 = {
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG:", 
                desc_part = "carried by a pair of long, backwards-bent legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
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
                weight = 50,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG:", 
                desc_part = "carried by a pair of long, backwards-bent legs and a pair of foldable jet-like wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				[FLIER]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
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
                weight = 50,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:2WINGS_ROBOT:", 
                desc_part = "carried by four long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:2WINGS_ROBOT:", 
                desc_part = "carried by four long, sprawling legs and a pair of thin, folding jet wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				[FLIER]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:", 
                desc_part = "carried by four long, sprawling legs and a pair of thin, folding jet wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				[FLIER]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
			{
                body_token = "MACHINE6LEG:", 
                desc_part = "carried by six long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 30
            },
            {     
                body_token = "MACHINE8LEG:", 
                desc_part = "carried by eight long, sprawling legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC" }, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 20,
		next_tables = {"procgen_subchart_table_arms"}
            }
			},
			
			
    
        procgen_subchart_table_1_4 = {
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG:2WINGS_ROBOT:", 
                desc_part = "carried by a pair of long, backwards-bent legs and a pair of foldable jet-like wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				[FLIER]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
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
                weight = 50,
		next_tables = {"procgen_subchart_table_arms"}
            },
            {     
                body_token = "MACHINE4LEG:2WINGS_ROBOT:", 
                desc_part = "carried by four long, sprawling legs and a pair of thin, folding jet wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				[FLIER]
				
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:750:600:439:1900:2900] 20 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_arms"}
            },
			{
                body_token = "MACHINE6LEG:2WINGS_ROBOT:", 
                desc_part = "carried by six long, sprawling legs and a pair of thin, folding jet wings. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				[FLIER]
				[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:438:292:146:1900:2900] 60 kph
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:528:352:176:1900:2900] 50 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:711:521:293:1900:2900] 30 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:711:521:293:1900:2900] 30 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_arms"}
            }
			},
			
		procgen_subchart_table_roomba = {
            {     
                body_token = "MACHINE4LEG:", 
                desc_part = "four stubby legs. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				
                ]]},
                weight = 100,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "MACHINE4WHEEL:", 
                desc_part = "four spherical wheels. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:750:600:439:1900:2900] 20 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				
			
                ]]},
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            }
			},
     
	 
	 
    
        procgen_subchart_table_arms = {
            {  
                body_token = "2SIMPLEMECHARM", 
                desc_part = "A pair of simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM"}, 
                tok = {[[
				
                ]]},
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "MACHINELEFTARM:MACHINERIGHTARM", 
                desc_part = "A pair of large humanoid arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "4SIMPLEMECHARM", 
                desc_part = "Four simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE"}, 
                tok = {[[
				
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "6SIMPLEMECHARM", 
                desc_part = "Six simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE" }, 
                tok = {[[
				
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "8SIMPLEMECHARM", 
                desc_part = "Eight simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"LARGE", "HUGE" }, 
                tok = {[[
				
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "10SIMPLEMECHARM", 
                desc_part = "Ten simple manipulator arms dangle from its front. ",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
				eligible_size_tags = {"HUGE", "GIANT", "TITANIC" }, 
                tok = {[[
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strikes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
                ]]},
                weight = 20,
		next_tables = {"procgen_subchart_table_heads"}
            }
			},
	 
	 
    
        procgen_subchart_table_turret = {
            {     
                body_token = "MACHINELEFTLEG:MACHINERIGHTLEG", 
                desc_part = "a pair of short legs. ",
				eligible_rating_tags = {"HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
                tok = {[[
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:8900:8825:8775:9500:9900] 1 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:8900:8825:8775:9500:9900] 1 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:8900:8825:8775:9500:9900] 1 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:8900:8825:8775:9500:9900] 1 kph
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:slam:slams]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]
			
                ]]},
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {    
                body_token = "MACHINE4LEG", 
                desc_part = "four short legs. ",
				eligible_rating_tags = {"HAZARDOUS"},
				eligible_size_tags = {"LESSER", "MEDIUM"}, 
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
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {      
                body_token = "MACHINE4LEG", 
                desc_part = "a single spherical wheel. ",
				eligible_rating_tags = {"HAZARDOUS"},
				eligible_size_tags = {"MEDIUM"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:3512:2634:1756:878:4900:6900] 10 kph
			
                ]]},
                weight = 40,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "2TREAD", 
                desc_part = "a pair of treads. ",
				eligible_rating_tags = {"HAZARDOUS"},
				eligible_size_tags = {"MEDIUM"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			
                ]]},
                weight = 30,
		next_tables = {"procgen_subchart_table_heads"}
            }
			},
	 
	 
    
        procgen_subchart_table_drone = {
            {     
                body_token = "MACHINE4LEG", 
                desc_part = "four armored legs. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"LESSER", "MEDIUM", "LARGE"}, 
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
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {    
                body_token = "MACHINE6LEG", 
                desc_part = "six armored legs. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
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
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {      
                body_token = "MACHINE8LEG", 
                desc_part = "eight armored legs. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "EXISTENTIAL"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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
                weight = 40,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "MACHINE4WHEEL", 
                desc_part = "four spherical wheels. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
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
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {    
                body_token = "MACHINE6WHEEL", 
                desc_part = "six spherical wheels. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS"},
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
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {      
                body_token = "MACHINE8WHEEL", 
                desc_part = "eight spherical wheels. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "EXISTENTIAL"},
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
                weight = 40,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "2TREAD", 
                desc_part = "a pair of armor-skirted treads. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "EXISTENTIAL"},
            eligible_size_tags = { "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			
                ]]},
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            },
            {     
                body_token = "4TREAD", 
                desc_part = "two pairs of armor-skirted treads. ",
				eligible_rating_tags = {"HAZARDOUS", "DANGEROUS", "EXISTENTIAL"},
            eligible_size_tags = { "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				[CANNOT_CLIMB]	[CANNOT_JUMP]	
				
				[APPLY_CREATURE_VARIATION:STANDARD_WALK_CRAWL_GAITS:900:657:438:219:1900:2900] 40 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			
                ]]},
                weight = 50,
		next_tables = {"procgen_subchart_table_heads"}
            }
			},
     
	 
	
    procgen_subchart_table_heads = {
    {
        body_token = "",
        desc_part = "Its head is a small mess of spindly antennae and small lights half-covered in armor, capable of basic perception of its environment. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[

		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "Its head is a large mess of spindly antennae and small lights half-covered in armor, capable of perceptive comprehension of its environment. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
				[VISION_ARC:50:310]
		]]
		}, 
        weight = 50
    },
    {
        body_token = "",
        desc_part = "Its head is a bulbous mess of spindly antennae and small lights half-covered in armor, with full-area sensory coverage. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[EXTRAVISION]
		]]
		}, 
        weight = 50
    },
    {
        body_token = "",
        desc_part = "Its head is a small mess of spindly antennae and bright lights half-covered in armor, capable of basic perception of its environment and low-light vision. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[LOW_LIGHT_VISION:10000][GLOWTILE:249][GLOWCOLOR:4:0:1]
		]]
		}, 
        weight = 100
    },
    {
        body_token = "",
        desc_part = "Its head is a large mess of spindly antennae and small lights half-covered in armor, capable of perceptive comprehension of its environment and low-light vision. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
				[VISION_ARC:50:310][LOW_LIGHT_VISION:10000][GLOWTILE:249][GLOWCOLOR:4:0:1]
		]]
		}, 
        weight = 50
    },
    {
        body_token = "",
        desc_part = "Its head is a bulbous mess of spindly antennae and small lights half-covered in armor, with full-area sensory coverage and low-light vision. ",
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN", "EXISTENTIAL"},
            eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[EXTRAVISION][LOW_LIGHT_VISION:10000][GLOWTILE:249][GLOWCOLOR:4:0:1]
		]]
		}, 
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CYBERMACHINE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CYBERMACHINE_MALE]
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
					]],
                    description_addon = ""
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 200,
            eligible_rating_tags = {"BENIGN", "AMBIENT", "VERMIN", "PROBLEMATIC"},
            eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a coilgun turret mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HOSTILE", "HAZARDOUS"},
            eligible_size_tags = {"MEDIUM"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
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
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HOSTILE", "HAZARDOUS"},
            eligible_size_tags = {"MEDIUM"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:45]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a ramjet turret mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "DANGEROUS", "HOSTILE", "HAZARDOUS"},
            eligible_size_tags = {"MEDIUM"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a coilgun turret mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of coilgun turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"LARGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
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
					[CASTE:CASTE2][POP_RATIO:50]
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
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"LARGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:2]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a ramjet turret mounted to its chassis. "
                },
				{
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:2]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of ramjet turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"LARGE"}, 
			
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of coilgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:3TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with three coilgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:4TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with four coilgun turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"HUGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:100]
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
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:3TURRET]
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
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with three chemgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:4TURRET]
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
					
					]],
                    description_addon = "It is armed with four chemgun turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"HUGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:2]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of ramjet turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:3TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with three ramjet turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:4TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets mounted to its chassis. "
				}
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"HUGE"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:50]
					[BODY:4TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a four coilgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:6TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with six coilgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:4TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT7]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT8]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with eight coilgun turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"GIANT"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:4TURRET]
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
					
					]],
                    description_addon = "It is armed with a four chemgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:6TURRET]
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
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					
					]],
                    description_addon = "It is armed with six chemgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:8TURRET]
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
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT7]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT8]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with eight chemgun turrets mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"GIANT"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:4TURRET]
						[NATURAL_SKILL:THROW:2]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:6TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with six ramjet turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:10]
					[BODY:8TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT5]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT6]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT7]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT8]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with eight ramjet turrets mounted to its chassis. "
					}
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"PROBLEMATIC", "HAZARDOUS"},
            eligible_size_tags = {"GIANT"}, 
			
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a coilgun turret mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of coilgun turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:25]
					[BODY:TURRET:ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
					]],
                    description_addon = "It is armed with a coilgun turret and a light-gas rotary gun mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4][POP_RATIO:25]
					[BODY:TURRET:MISSILE_POD]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
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
                    description_addon = "It is armed with a coilgun turret and micromissile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE5][POP_RATIO:25]
					[BODY:TURRET:CANNON]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
								
					]],
                    description_addon = "It is armed with a coilgun turret and a railgun cannon mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"LARGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
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
					[CASTE:CASTE2][POP_RATIO:50]
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
					[CASTE:CASTE3][POP_RATIO:25]
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
					[CASTE:CASTE4][POP_RATIO:25]
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
					[CASTE:CASTE5][POP_RATIO:25]
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
            weight = 25,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"LARGE"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:100]
					[BODY:TURRET]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a ramjet turret mounted to its chassis. "
                },
				{
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:2TURRETLR]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					]],
                    description_addon = "It is armed with a pair of ramjet turrets mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4][POP_RATIO:25]
					[BODY:TURRET:MISSILE_POD]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
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
                    description_addon = "It is armed with a ramjet turret and micromissile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE5][POP_RATIO:25]
					[BODY:TURRET:CANNON]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
								
					]],
                    description_addon = "It is armed with a ramjet turret and cannon mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"LARGE"}, 
			
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:CANNON]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of coilgun turrets, a light-gas rotary gun, and a railgun cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:MISSILE_POD]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
                    description_addon = "It is armed with a pair of coilgun turrets, a light-gas rotary gun, and a missile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:25]
					[BODY:2TURRETLR:MISSILE_POD:CANNON]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
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
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of coilgun turrets, a micromissile pod, and a railgun cannon mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"HUGE"}, 
        },
		{
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:25]
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
					[CASTE:CASTE2][POP_RATIO:25]
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
					[CASTE:CASTE3][POP_RATIO:25]
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
            weight = 25,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"HUGE"}, 
        },
		{
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:CANNON]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of ramjet turrets, a light-gas rotary gun, and a cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:25]
					[BODY:2TURRETLR:ROTORGUN:MISSILE_POD]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
                    description_addon = "It is armed with a pair of ramjet turrets, a light-gas rotary gun, and a missile pod mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:25]
					[BODY:2TURRETLR:MISSILE_POD:CANNON]
						[NATURAL_SKILL:THROW:2]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
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
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with a pair of ramjet turrets, a micromissile pod, and a cannon mounted to its chassis. "
					}
				},
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"DANGEROUS"},
            eligible_size_tags = {"HUGE"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS2_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four coilgun turrets, a pair of light-gas rotary guns, and a railgun cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2MISSILE_POD]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
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
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four coilgun turrets, a pair of micromissile pods, and a railgun cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four coilgun turrets, a micromissile pod, a rotary light-gas gun, and a railgun cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four coilgun turrets and a pair of railgun cannons mounted to its chassis. "
                }
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 50,
            eligible_rating_tags = {"DANGEROUS", "HOSTILE", "EXISTENTIAL"},
            eligible_size_tags = {"GIANT"}, 
        },
		{
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:50]
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
					[CASTE:CASTE2][POP_RATIO:50]
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
					[CASTE:CASTE3][POP_RATIO:50]
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
					[CASTE:CASTE4][POP_RATIO:50]
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
            weight = 25,
            eligible_rating_tags = {"DANGEROUS", "HOSTILE", "EXISTENTIAL"},
            eligible_size_tags = {"GIANT"}, 
        },
		{
            castes = {
				{
                    tokens = [[
					[CASTE:CASTE1][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS2_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets, a pair of light-gas rotary guns, and a ramjet cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE2][POP_RATIO:50]
					[BODY:4TURRET:CANNON:2MISSILE_POD]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
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
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets, a pair of micromissile pods, and a ramjet cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE3][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:3]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
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
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets, a micromissile pod, a rotary light-gas gun, and a ramjet cannon mounted to its chassis. "
                },
                {
                    tokens = [[
					[CASTE:CASTE4][POP_RATIO:50]
					[BODY:4TURRET:CANNON:MISSILE_POD:ROTORGUN]
						[NATURAL_SKILL:THROW:5]
					-------------------------------
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					]],
                    description_addon = "It is armed with four ramjet turrets and a pair of ramjet cannons mounted to its chassis. "
					}
            },
			
            shared_tokens = [[
			[SELECT_CASTE:ALL]
			]],
            weight = 25,
            eligible_rating_tags = {"DANGEROUS", "HOSTILE", "EXISTENTIAL"},
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