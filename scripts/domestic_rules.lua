local log = _G.log or function(...) end

log("DOMESTIC_RULES: Loading domestic creature configs...")

local config_cybermachine_domestic = require("config_cybermachine_domestic")
local config_demimachine_domestic = require("config_demimachine_domestic")
local config_biomachine = require("config_biomachine")
local config_nanomachine_domestic = require("config_nanomachine")
local config_chimera_domestic = require("config_chimera_domestic")
local config_polymerid_domestic = require("config_polymerid_domestic")
local config_excaste = require("config_excaste")

log("DOMESTIC_RULES: Configs loaded.")

local domestic_rules = {}

domestic_rules.archetype_map = {

    ["LOCASTE"] = {
        { 
            config = config_cybermachine_domestic, 
            weight = 25,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["LABOR"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        },
        { 
            config = config_polymerid_domestic, 
            weight = 25,
            ratings = {
                ["VEHICLE"] = { min = 0, max = 2 },
                ["CARRIER"] = { min = 0, max = 2 },
                ["NOMAD"] = { min = 1, max = 3 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 }
            }
        },
        { 
            config = config_chimera_domestic, 
            weight = 50,
            ratings = {
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 1, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["DOMESTIC"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 5 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        }
    },

    ["HICASTE"] = {
        { 
            config = config_cybermachine_domestic, 
            weight = 100,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["LABOR"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        }
    },
    
    ["EXCASTE"] = {
        { 
            config = config_chimera_domestic, 
            weight = 100,
            ratings = {
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 1, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["DOMESTIC"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 5 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        },
        { 
            config = config_excaste, 
            weight = 100,
            
            required_sub_archetype = "APE", 
            
            forced_sub_archetype = "APE",
            ratings = {
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["DOMESTIC"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 1, max = 3 }
            }
        },
        { 
            config = config_excaste, 
            weight = 100,
            
            required_sub_archetype = "CLONE", 
            
            forced_sub_archetype = "CLONE",
            ratings = {
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["DOMESTIC"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 1, max = 3 }
            }
        },
        { 
            config = config_excaste, 
            weight = 100,
            
            required_sub_archetype = "CANCER", 
            
            forced_sub_archetype = "CANCER",
            ratings = {
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 1, max = 3 }
            }
        },
        { 
            config = config_excaste, 
            weight = 100,
            
            required_sub_archetype = "BLINDSIGHT", 
            
            forced_sub_archetype = "BLINDSIGHT",
            ratings = {
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 1, max = 3 }
            }
        }
    },
	

    ["NUCASTE"] = { 
	
        { 
            config = config_cybermachine_domestic, 
            weight = 10,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["LABOR"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        },
        { 
            config = config_chimera_domestic, 
            weight = 15,
            ratings = {
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 1, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["DOMESTIC"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 5 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        },
        { 
            config = config_polymerid_domestic, 
            weight = 20,
            ratings = {
                ["VEHICLE"] = { min = 0, max = 2 },
                ["CARRIER"] = { min = 0, max = 2 },
                ["NOMAD"] = { min = 1, max = 3 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 }
            }
        },
        { 
            config = config_demimachine_domestic, 
            weight = 15,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        },
        { 
            config = config_biomachine, 
            weight = 5,
            forced_sub_archetype = "OGRE",
            ratings = {
                    ["CARRIER"] = { min = 1, max = 3 },
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["MILITARY"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 0, max = 3 }
            }
        }
    },
	
	
    ["BIOMACHINE"] = { 
        { 
            config = config_biomachine, 
            weight = 100,
            inherit_sub_archetype = true, 
            
            sub_archetype_access = {
                 ["HUMAN"] = {"DEVIL"},
                 ["DEVIL"] = {"DEVIL"},
                 ["OGRE"] = {"OGRE"},
                 ["HORROR"] = {"HORROR"}
            },

            -- Default ratings (fallback)
            ratings = {
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 3 },
                ["WEAPON"] = { min = 0, max = 3 },
                ["DOMESTIC"] = { min = 0, max = 3 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["LABOR"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 3 }
            },

            sub_archetype_ratings = {
                ["DEVIL"] = {
                    ["NOMAD"] = { min = 1, max = 3 },
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["MILITARY"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["DOMESTIC"] = { min = 0, max = 3 }
                },
                ["OGRE"] = {
                    ["CARRIER"] = { min = 1, max = 3 },
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["MILITARY"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["NOMAD"] = { min = 0, max = 3 }
                },
                ["HORROR"] = {
                    ["WEAPON"] = { min = 0, max = 3 },
                    ["MILITARY"] = { min = 0, max = 2 },
                    ["NOMAD"] = { min = 0, max = 3 }
                }
            }
        }
    },
	
	
    ["NANOMACHINE"] = { 
        { 
            config = config_nanomachine, 
            weight = 100,
            inherit_sub_archetype = true, 
            
            sub_archetype_access = {
                 ["CORRUPT"] = {"CORRUPT"},
                 ["PRISTINE"] = {"CORRUPT"},
                 ["WET"] = {"WET"}
            },

            ratings = {
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 3 },
                ["WEAPON"] = { min = 0, max = 3 },
                ["DOMESTIC"] = { min = 0, max = 3 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["LABOR"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 3 }
            },

            sub_archetype_ratings = {
                ["CORRUPT"] = {
                    ["NOMAD"] = { min = 1, max = 3 },
                    ["HUNTER"] = { min = 0, max = 3 },
                    ["WEAPON"] = { min = 0, max = 2 },
                    ["MILITARY"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["DOMESTIC"] = { min = 0, max = 3 }
                },
                ["WET"] = {
                    ["NOMAD"] = { min = 1, max = 3 },
                    ["HUNTER"] = { min = 0, max = 3 },
                    ["WEAPON"] = { min = 0, max = 2 },
                    ["SERVANT"] = { min = 0, max = 3 },
                    ["DOMESTIC"] = { min = 0, max = 3 }
                }
            }
        }
    },
	
    ["CYBERMACHINE"] = { 
	
        { 
            config = config_cybermachine_domestic, 
            weight = 100,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["LABOR"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        }
    },
   
	
   
    ["DEMIMACHINE"] = { 
	
        { 
            config = config_demimachine_domestic, 
            weight = 100,
            ratings = {
                ["VEHICLE"] = { min = 1, max = 3 },
                ["CARRIER"] = { min = 1, max = 3 },
                ["NOMAD"] = { min = 0, max = 2 },
                ["WEAPON"] = { min = 0, max = 2 },
                ["HUNTER"] = { min = 0, max = 2 },
                ["SANITATION"] = { min = 0, max = 2 },
                ["PRODUCT"] = { min = 0, max = 3 },
                ["SERVANT"] = { min = 0, max = 2 }
            }
        }
    },
}

return domestic_rules