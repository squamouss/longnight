local log = _G.log or function(...) end
log("FREQUENCY_RULES: Loading frequency distribution rules.")

local M = {}

M.DEFAULT_FREQUENCY = 50 

M.RULES = {

    ["LOCASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["HICASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["NUCASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["EXCASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["CYCASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["BIOMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["NANOMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["CYBERMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["DEMIMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["HOLOMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["XENOMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DEFAULT = 20
        },
        MDM = { 
            BENIGN = 25,
            PROBLEMATIC = 20,
            HAZARDOUS = 20,
            DANGEROUS = 5,
            DEFAULT = 15
        },
        LRG = { 
            BENIGN = 20,
            PROBLEMATIC = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 10,
            HAZARDOUS = 10,
            DANGEROUS = 5,
            DEFAULT = 10
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },

    ["CHIMERA"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },
	
	
    ["EXCASTE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },
	
   ["POLYMERID"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        TTN = {
            DEFAULT = 1 
        }
    },
	
   ["SILICID"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        TTN = {
            DEFAULT = 1 
        }
    },
	
   ["ELASTOMERID"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        TTN = {
            DEFAULT = 1 
        }
    },
		
		
		
	
    ["PROTOCHIMERA"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
        }
    },
		
	
    ["MACROCELL"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15, 
            DEFAULT = 30
        },
        MDM = { 
            BENIGN = 40,
            PROBLEMATIC = 30,
            HAZARDOUS = 20,
            DANGEROUS = 10, 
            DEFAULT = 20
        },
        LRG = { 
            BENIGN = 30,
            PROBLEMATIC = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 10
        },
        HGE = { 
            BENIGN = 20,
            HAZARDOUS = 10,
            DANGEROUS = 5, 
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 
        },
        TTN = {
            DEFAULT = 1 
		}
	}
}

return M