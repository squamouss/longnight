return {
    -- =========================================================================
    -- CONFIG: AUTOGUN
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "AUTOGUN",
        SECRET_PREFIX = "CONSTRUCTAUTOGUN",
        PAYLOAD_PREFIX = "AUTOGUN_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Autogun",
        SECRET_NAME = "Construct Autogun",
        TABLET_NAME = "Autogun Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Autogun",
        CONSTRUCT_VERB = "construct an autogun from ambient N-matter:constructs an autogun from ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 100, 

        -- Actual Attack
        PAYLOAD_VERB = "fire your autogun:fire your autogun:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ENERGETIC_COMPOUND",
        PAYLOAD_PROJECTILE_TYPE = "SOLID_GLOB",
        PAYLOAD_RANGE = 100,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 1, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 6,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 30, 
            LARGE = 20,  
            HUGE = 10,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 15,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: BLADE
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "BLADE",
        SECRET_PREFIX = "CONSTRUCTBLADE",
        PAYLOAD_PREFIX = "BLADE_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Blade",
        SECRET_NAME = "Construct Blade",
        TABLET_NAME = "Blade Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Blade",
        CONSTRUCT_VERB = "construct a disposable blade from ambient N-matter:constructs a disposable blade from ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 100, 

        -- Actual Attack
        PAYLOAD_VERB = "slash with your blade:slashes with their blade:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ALLOY",
        PAYLOAD_PROJECTILE_TYPE = "SHARP_ROCK",
        PAYLOAD_RANGE = 50,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "TOUCHABLE",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 1, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 2,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 30, 
            LARGE = 20,  
            HUGE = 10,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 15,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: CANNON
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "CANNON",
        SECRET_PREFIX = "CONSTRUCTCANNON",
        PAYLOAD_PREFIX = "CANNON_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Cannon",
        SECRET_NAME = "Construct Cannon",
        TABLET_NAME = "Cannon Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Cannon",
        CONSTRUCT_VERB = "construct a cannon from ambient N-matter:constructs a cannon from ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 200, 

        -- Actual Attack
        PAYLOAD_VERB = "fire your cannon:fire your cannon:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ENERGETIC_COMPOUND",
        PAYLOAD_PROJECTILE_TYPE = "SHARP_ROCK",
        PAYLOAD_RANGE = 200,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 2, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 9,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 90, 
            LARGE = 60,  
            HUGE = 30,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 25,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: CLOUD
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "CLOUD",
        SECRET_PREFIX = "CONSTRUCTCLOUD",
        PAYLOAD_PREFIX = "CLOUD_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Nanomachine Cloud",
        SECRET_NAME = "Construct Nanomachine Cloud",
        TABLET_NAME = "Nanomachine Cloud Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Nanomachine Cloud",
        CONSTRUCT_VERB = "concentrate ambient N-matter:concentrates ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 200, 

        -- Actual Attack
        PAYLOAD_VERB = "emit a cloud of nanomachines:emit a cloud of nanomachines:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ALLOY",
        PAYLOAD_PROJECTILE_TYPE = "UNDIRECTED_DUST",
        PAYLOAD_RANGE = 200,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "TOUCHABLE",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 3, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 9,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 90, 
            LARGE = 60,  
            HUGE = 30,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 25,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: JET
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "NANOJET",
        SECRET_PREFIX = "CONSTRUCTNANOJET",
        PAYLOAD_PREFIX = "NANOJET_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Nanomachine Jet",
        SECRET_NAME = "Construct Nanomachine Jet",
        TABLET_NAME = "Nanomachine Jet Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Nanomachine Jet",
        CONSTRUCT_VERB = "concentrate ambient N-matter:concentrates ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 100, 

        -- Actual Attack
        PAYLOAD_VERB = "emit a jet of nanomachines:emit a jet of nanomachines:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ALLOY",
        PAYLOAD_PROJECTILE_TYPE = "TRAILING_DUST_FLOW",
        PAYLOAD_RANGE = 100,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 2, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 6,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 30, 
            LARGE = 20,  
            HUGE = 10,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 20,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: ROTORGUN
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "ROTORGUN",
        SECRET_PREFIX = "CONSTRUCTROTORGUN",
        PAYLOAD_PREFIX = "ROTORGUN_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Rotorgun",
        SECRET_NAME = "Construct Rotorgun",
        TABLET_NAME = "Rotorgun Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Rotorgun",
        CONSTRUCT_VERB = "construct a rotorgun from ambient N-matter:constructs a rotorgun from ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 200, 

        -- Actual Attack
        PAYLOAD_VERB = "fire your rotorgun:fire your rotorgun:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ENERGETIC_COMPOUND",
        PAYLOAD_PROJECTILE_TYPE = "SOLID_GLOB",
        PAYLOAD_RANGE = 100,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 2, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 3,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 3, 
            LARGE = 2,  
            HUGE = 1,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 20,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    },

    -- =========================================================================
    -- CONFIG: WEB
    -- =========================================================================
    {
        -- ### Base Identifiers ###
        ID_PREFIX = "NANOWEB",
        SECRET_PREFIX = "CONSTRUCTNANOWEB",
        PAYLOAD_PREFIX = "NANOWEB_PAYLOAD",

        -- ### General Naming ###
        WEAPON_NAME = "Nanomachine Webbing",
        SECRET_NAME = "Construct Nanomachine Webbing",
        TABLET_NAME = "Nanomachine Webbing Implant",
        
        -- Weapon Construction
        CONSTRUCT_ADV_NAME = "Construct Nanomachine Webbing",
        CONSTRUCT_VERB = "spin strands from ambient N-matter:spin strands from ambient N-matter:NA",
        CONSTRUCT_WAIT_PERIOD = 200, 

        -- Actual Attack
        PAYLOAD_VERB = "emit tendrils of webbing:emits tendrils of webbing:NA",
        PAYLOAD_PROJECTILE_MAT = "INORGANIC:ENERGETIC_COMPOUND",
        PAYLOAD_PROJECTILE_TYPE = "WEB_SPRAY",
        PAYLOAD_RANGE = 1,
        
        -- Targeting Type
        PAYLOAD_TARGET_TYPE = "TOUCHABLE",
        
        -- Charge Time
        PAYLOAD_TELEGRAPH_TICKS = 2, 
        
        -- Firing Window
        PAYLOAD_WINDOW_DURATION = 9,
        
        -- DWF_STRETCH 
        PAYLOAD_DWF_STRETCH = 10,
        
        -- Shot Cooldowns
        PAYLOAD_COOLDOWNS = {
            NORMAL = 90, 
            LARGE = 60,  
            HUGE = 30,   
        },

        -- Max Targets
        PAYLOAD_MAX_TARGETS = {
            NORMAL = 1,
            LARGE = 1,
            HUGE = 1,
        },

        -- Edible Tablet
        TABLET_TILE = "'#'",
        TABLET_COLOR = "7:11:0",

        -- Crafting Reactions
        FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
        FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        FORT_BUILDING = "N_MATTER_REFINERY",
        
        ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
        ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
        ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
        ADV_SCRAP_COST = 25,

        -- Fortress Mode crafting
        FORT_CATEGORY_ID = "COMBAT_PROGRAMS",
        FORT_CATEGORY_NAME = "Combat Programs",
        FORT_CATEGORY_DESC = "Install combat programs",
        
        -- Adventure Mode crafting
        ADV_CATEGORY_ID = "COMBAT_PROGRAMS_ADV",
        ADV_CATEGORY_NAME = "Combat Programs",
        ADV_CATEGORY_DESC = "Construct innate weapons",
    }
}