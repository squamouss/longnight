return {
    THEME_CONFLICTS = {
        ["CHEM"]   = { "RAIL", "RAMJET" },
        ["RAIL"]   = { "CHEM", "RAMJET" },
        ["RAMJET"] = { "CHEM", "RAIL"   },
        ["TECHARM"] = { "SIMPLEARM", "FREAKARM" },
        ["SIMPLEARM"] = { "TECHARM", "FREAKARM" },
        ["FREAKARM"] = { "TECHARM", "SIMPLEARM"   }
    },

    WEAPON_THEME_MAP = {
        ["CHEMGUN"] = "CHEM",
        ["RAILGUN"] = "RAIL",  
        ["RAMJET"]  = "RAMJET"
    },

    WEAPONS = {
	
	
        EWAR_TRANSFORM = {
			priority = 3,
            description = "!EWAR_SYSTEM!",
            body = "",
            interaction = [[
				[CAN_DO_INTERACTION:DIGI_WARFARE_NPC_UNLOCK_UNIVERSAL]
                        [CDI:ADV_NAME:Unlock]
                        [CDI:USAGE_HINT:DEFEND]
                        [CDI:TARGET:A:SELF_ONLY]
                        [CDI:WAIT_PERIOD:120000]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "HOLOMACHINE", "DEMIMACHINE", "NUCASTE", "EXCASTE", "CYCASTE"},
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "HYBRID", "GLITCH", "FAIRY", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eigible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "EXISTENTIAL"},
            exclusion_group =  "DIGITAL_SKILL", 
            pop_ratio_multiplier = 0.8
        },
	
	
        ABILITY_TRANSFORM = {
			priority = 4,
            description = "!INNATE_ATTRIBUTE_TRANSMUTATION!",
            body = "",
            interaction = [[
				[CAN_DO_INTERACTION:GEN_ATTR_PHYS_SPEED_UNLOCK]
                        [CDI:ADV_NAME:Unlock]
                        [CDI:USAGE_HINT:DEFEND]
                        [CDI:TARGET:A:SELF_ONLY]
                        [CDI:WAIT_PERIOD:120000]
            ]],
            eligible_archetypes = {"NANOMACHINE", "BIOMACHINE"},
			eligible_sub_archetypes = {"CORRUPT", "PRISTINE", "WET", "DEVIL", "HORROR", "OGRE", "HUMAN" },
            eigible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "EXISTENTIAL"},
            exclusion_group =  "SECOND_SKILL", 
            pop_ratio_multiplier = 0.8
        },
	
	
        WEAPON_TRANSFORM_1 = {
			priority = 5,
            description = "!INNATE_WEAPON_TRANSMUTATION!",
            body = "",
            interaction = [[
				[CAN_DO_INTERACTION:ALL_GUNS_UNLOCK_TIER_1]
                        [CDI:ADV_NAME:Unlock]
                        [CDI:USAGE_HINT:DEFEND]
                        [CDI:TARGET:A:SELF_ONLY]
                        [CDI:WAIT_PERIOD:120000]
            ]],
            eligible_archetypes = {"NANOMACHINE"},
			eligible_sub_archetypes = {"CORRUPT", "PRISTINE"},
            eigible_size_tags = {"MEDIUM"},
            eligible_rating_tags = { "HOSTILE", "DANGEROUS"},
            exclusion_group =  "MAIN_SKILL", 
            pop_ratio_multiplier = 0.8
        },
	
	
        WEAPON_TRANSFORM_2 = {
			priority = 5,
            description = "!!INNATE_WEAPON_TRANSMUTATION!!",
            body = "",
            interaction = [[
				[CAN_DO_INTERACTION:ALL_GUNS_UNLOCK_TIER_2]
                        [CDI:ADV_NAME:Unlock]
                        [CDI:USAGE_HINT:DEFEND]
                        [CDI:TARGET:A:SELF_ONLY]
                        [CDI:WAIT_PERIOD:120000]
            ]],
            eligible_archetypes = {"NANOMACHINE"},
			eligible_sub_archetypes = {"WET", "CORRUPT", "PRISTINE"},
            eigible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS"},
            exclusion_group =  "MAIN_SKILL", 
            pop_ratio_multiplier = 0.8
        },
	
	
	
        WEAPON_TRANSFORM_3 = {
			priority = 5,
            description = "!!!INNATE_WEAPON_TRANSMUTATION!!!",
            body = "",
            interaction = [[
				[CAN_DO_INTERACTION:ALL_GUNS_UNLOCK_TIER_3]
                        [CDI:ADV_NAME:Unlock]
                        [CDI:USAGE_HINT:DEFEND]
                        [CDI:TARGET:A:SELF_ONLY]
                        [CDI:WAIT_PERIOD:120000]
            ]],
            eligible_archetypes = {"NANOMACHINE"},
			eligible_sub_archetypes = {"WET", "CORRUPT", "PRISTINE"},
            eigible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "PROBLEMATIC", "EXISTENTIAL"},
            exclusion_group =  "MAIN_SKILL", 
            pop_ratio_multiplier = 0.8
        },
	
	
	
	
	
	
	
	
	
        CHEMGUN_TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:15]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "1COILGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "EXCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "BLINDSIGHT" },
            eligible_size_tags = {"MEDIUM"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJETGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
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
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_2TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "2CHEMGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_2TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "2COILGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_2TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "2RAMJETGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
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
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_4TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "4CHEMGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_4TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "4COILGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
			
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_4TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "4RAMJETGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
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
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_6TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "6CHEMGUN_TURRET",
            body = "[BODY:6TURRET]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_6TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "6COILGUN_TURRET",
            body = "[BODY:6TURRET]",
            interaction = [[
			
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_6TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "6RAMJETGUN_TURRET",
            body = "[BODY:6TURRET]",
            interaction = [[
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
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_8TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "8CHEMGUN_TURRET",
            body = "[BODY:8TURRET]",
            interaction = [[
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"GIANT"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_8TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "8COILGUN_TURRET",
            body = "[BODY:8TURRET]",
            interaction = [[
			
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
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"GIANT"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_8TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "8RAMJETGUN_TURRET",
            body = "[BODY:8TURRET]",
            interaction = [[
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
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_10TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "10CHEMGUN_TURRET",
            body = "[BODY:10TURRET]",
            interaction = [[
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
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT9]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT10]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_10TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "10COILGUN_TURRET",
            body = "[BODY:10TURRET]",
            interaction = [[
			
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
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT9]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT10]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_10TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "10RAMJETGUN_TURRET",
            body = "[BODY:10TURRET]",
            interaction = [[
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
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT9]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT10]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
        RIGHTARM_NOTHING = {
			priority = 20,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 1.0
        },
        LEFTARM_NOTHING = {
			priority = 30,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 1.0
        },
			
			
        RIGHTARM_NOTHING2 = {
			priority = 40,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 1.0
        },
        LEFTARM_NOTHING2 = {
			priority = 50,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 1.0
        },
		
			
			
			
			
			
			
			
        RIGHTARM_CHEMGUN = {
			priority = 20,
            theme = "CHEM", 
            description = "CHEMGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CHEMGUN = {
			priority = 30,
            theme = "CHEM", 
            description = "CHEMGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_CHEMGUN2 = {
			priority = 40,
            theme = "CHEM", 
            description = "CHEMGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CHEMGUN2 = {
			priority = 50,
            theme = "CHEM", 
            description = "CHEMGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
			
			
			
        RIGHTARM_RAILGUN = {
			priority = 20,
            theme = "RAIL", 
            description = "COILGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAILGUN = {
			priority = 30,
            theme = "RAIL", 
            description = "COILGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_RAILGUN2 = {
			priority = 40,
            theme = "RAIL", 
            description = "COILGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAILGUN2 = {
			priority = 50,
            theme = "RAIL", 
            description = "COILGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
			
			
	
        RIGHTARM_RAMJETGUN = {
			priority = 20,
            theme = "RAMJET", 
            description = "RAMJETGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAMJETGUN = {
			priority = 30,
            theme = "RAMJET", 
            description = "RAMJETGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_RAMJETGUN2 = {
			priority = 40,
            theme = "RAMJET", 
            description = "RAMJETGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAMJETGUN2 = {
			priority = 50,
            theme = "RAMJET", 
            description = "RAMJETGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
				
			
        RIGHTARM_BLADE = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "BLADE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTBLADE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_BLADE = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "BLADE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTBLADE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_BLADE2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "BLADE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTBLADE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_BLADE2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "BLADE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTBLADE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
        RIGHTARM_MAUL = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "MAUL_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTMAUL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RMAUL]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_MAUL = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "MAUL_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTMAUL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LMAUL]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_MAUL2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "MAUL_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTMAUL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RMAUL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_MAUL2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "MAUL_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTMAUL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LMAUL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
		
		
		
			
        RIGHTARM_SCYTHE = {
			priority = 20,
            theme = "FREAKARM", 
            description = "SCYTHE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTSCYTHE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DOLL", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SCYTHE = {
			priority = 30,
            theme = "FREAKARM", 
            description = "SCYTHE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTSCYTHE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DOLL", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_SCYTHE2 = {
			priority = 40,
            theme = "FREAKARM", 
            description = "SCYTHE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTSCYTHE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DOLL", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SCYTHE2 = {
			priority = 50,
            theme = "FREAKARM", 
            description = "SCYTHE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTSCYTHE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DOLL", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
			
        RIGHTARM_PILEBUNKER = {
			priority = 20,
            theme = "TECHARM", 
            description = "PILEBUNKER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTPILEBUNKER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPILEBUNKER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PILEBUNKER = {
			priority = 30,
            theme = "TECHARM", 
            description = "PILEBUNKER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTPILEBUNKER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPILEBUNKER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_PILEBUNKER2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "PILEBUNKER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTPILEBUNKER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPILEBUNKER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PILEBUNKER2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "PILEBUNKER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTPILEBUNKER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPILEBUNKER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
			
			
			
        RIGHTARM_FORCEEMITTER = {
			priority = 20,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTFORCEEMITTER]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKR]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:RFORCE]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_FORCEEMITTER = {
			priority = 30,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTFORCEEMITTER]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKL]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:LFORCE]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
		
        RIGHTARM_FORCEEMITTER2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTFORCEEMITTER2]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKR2]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:RFORCE2]
		[CDI:INTERACTION:SHOCK_UNLOCKR2]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_FORCEEMITTER2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTFORCEEMITTER2]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKL2]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:LFORCE2]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITAN"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
		
		
        }
    }
}