local M = {}

-- 1. BASE RULES
-- This is the default behavior for all creatures.
-- The calculator checks this table if no Archetype Exception is found.
-- Structure: [SIZE_KEY][RATING_KEY] = DESTROYER_LEVEL
M.BASE_RULES = {
    LRG = {
        DANGEROUS = 2,
        EXISTENTIAL = 2,
        HOSTILE = 2,
        WEAPON = 1,
        MILITARY = 1,
        SERVANT = 1,
    },
    HGE = {
        DANGEROUS = 2,
        EXISTENTIAL = 2,
        HOSTILE = 2,
        WEAPON = 1,
        MILITARY = 1,
        SERVANT = 1,
    },
    GNT = {
        DANGEROUS = 2,
        EXISTENTIAL = 2,
        HOSTILE = 2,
        WEAPON = 1,
        MILITARY = 1,
        SERVANT = 1,
    },
    TTN = {
        DANGEROUS = 2,
        EXISTENTIAL = 2,
        HOSTILE = 2,
        WEAPON = 1,
        MILITARY = 1,
        SERVANT = 1,
    }
}

M.ARCHETYPE_EXCEPTIONS = {


    BIOMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },
	
    XENOMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },
	
    DEMIMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },
	
    CYBERMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },
	
    HOLOMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },

    NANOMACHINE = {
        LRG = {
            HAZARDOUS = 2 
        },
        HGE = {
            HAZARDOUS = 2 
        }
    },

}

return M