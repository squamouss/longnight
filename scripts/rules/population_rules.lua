local log = _G.log or function(...) end
log("POPULATION_RULES: Loading population density rules.")

local M = {}


M.RULES = {

    ["BIOMACHINE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = {
                DEFAULT = "2:5"
            }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },

    ["CYBERMACHINE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },

    ["DEMIMACHINE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },

    ["NANOMACHINE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },

    ["HOLOMACHINE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },
	
    ["CHIMERA"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },
	
    ["PALEOCHIMERA"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },
	
	
    ["PROTOCHIMERA"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },


    ["POLYMERID"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },
	
	
    ["EXCASTE"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    },


    ["MACROCELL"] = {
        MCR = {
            VERMIN = "5000:10000",
            AMBIENT = "5000:10000",
        },
        MNL = {
            VERMIN = "1000:5000",
            AMBIENT = "1000:5000",
        },
        SML = { 
            VERMIN = "500:1000",
            AMBIENT = "500:1000"
        },
        LSR = { -- Lesser
            BENIGN = "50:100",
            PROBLEMATIC = { DEFAULT = "20:40" },
            HAZARDOUS = "20:40",
            DANGEROUS = "10:20"
        },
        MDM = { 
            BENIGN = "20:50",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "10:20",
            DANGEROUS = "5:10",
        },
        LRG = { 
            BENIGN = "10:30",
            PROBLEMATIC = "10:20",
            HAZARDOUS = "5:15",
            DANGEROUS = "3:8",
        },
        HGE = { 
            BENIGN = "5:15",
            PROBLEMATIC = "5:10",
            HAZARDOUS = "3:8",
            DANGEROUS = { DEFAULT = "2:5" }
        },
        GNT = {
            BENIGN = "3:6",
            HAZARDOUS = "2:4",
            DANGEROUS = "1:2",
            PROBLEMATIC = "1:2"
        }
    }
}

return M