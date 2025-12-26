local log = _G.log or function(...) end
log("CLUSTER_RULES: Loading cluster size distribution rules.")

local M = {}


local DEFAULT_RULES = {
    MCR = { 
        COLONY = { min = 1000, max_cap = 2000, decay = 0.90 }, 
        FISH = { min = 5, max_cap = 100, decay = 0.80 }
    },
    MNL = { 
        COLONY = { min = 1000, max_cap = 2000, decay = 0.90 },
        FISH = { min = 5, max_cap = 50, decay = 0.80 }
    },
    SML = { 
        COLONY = { min = 100, max_cap = 200, decay = 0.90 },
        FISH = { min = 1, max_cap = 20, decay = 0.80 }
    },
        LSR = {
            DANGEROUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            },
            BENIGN = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }  
            },
        },
        MDM = {
            DANGEROUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            },
            BENIGN = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }  
            },
        },
        LRG = {
            DANGEROUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            },
            BENIGN = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }  
            },
        },
        HGE = {
            DANGEROUS = {
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 3, decay = 0.50, weight = 2 }, 
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            },
            BENIGN = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }  
            },
        },
        GNT = {
            BENIGN = {
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 3, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 3, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 }  
            },
        },
    TTN = { 
        DEFAULT = { min = 1, max_cap = 1, decay = 0.0 }  
    }
}

M.RULES = { 
    ["BIOMACHINE"] = {
	
    MCR = { 
        COLONY = { min = 1000, max_cap = 2000, decay = 0.90 }, 
        FISH = { min = 5, max_cap = 100, decay = 0.80 }
    },
    MNL = { 
        COLONY = { min = 1000, max_cap = 2000, decay = 0.90 },
        FISH = { min = 5, max_cap = 50, decay = 0.80 }
    },
    SML = { 
        COLONY = { min = 100, max_cap = 200, decay = 0.90 },
        FISH = { min = 1, max_cap = 20, decay = 0.80 }
    },
        LSR = {
            DANGEROUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            },
            BENIGN = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }  
            },
        },
        MDM = {
            DANGEROUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            },
            BENIGN = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 20, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 1 }  
            },
        },
        LRG = {
            DANGEROUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 }, 
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            },
            BENIGN = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }  
            },
        },
        HGE = {
            DANGEROUS = {
                { min = 1, max_cap = 5, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 3, decay = 0.50, weight = 2 }, 
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 } 
            },
            PROBLEMATIC = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            },
            BENIGN = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 2, decay = 0.50, weight = 3 }  
            },
        },
        GNT = {
            BENIGN = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 },
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 }   
            }, 
            HAZARDOUS = {
                { min = 1, max_cap = 10, decay = 0.50, weight = 1 }, 
                { min = 1, max_cap = 5, decay = 0.50, weight = 2 },  
                { min = 1, max_cap = 1, decay = 0.50, weight = 3 }  
            },
        },
    TTN = { 
        DEFAULT = { min = 1, max_cap = 1, decay = 0.0 }     
		}
	},
    
    ["CYBERMACHINE"] = DEFAULT_RULES,
    ["DEMIMACHINE"] = DEFAULT_RULES,
    ["NANOMACHINE"] = DEFAULT_RULES,
    ["HOLOMACHINE"] = DEFAULT_RULES,
    ["XENOMACHINE"] = DEFAULT_RULES,
    ["LOCASTE"] = DEFAULT_RULES,
    ["HICASTE"] = DEFAULT_RULES,
    ["NUCASTE"] = DEFAULT_RULES,
    ["EXCASTE"] = DEFAULT_RULES,
    ["CYCASTE"] = DEFAULT_RULES,
    ["CHIMERA"] = DEFAULT_RULES,
    ["PROTOCHIMERA"] = DEFAULT_RULES,
    ["MACROCELL"] = DEFAULT_RULES,
    ["POLYMERID"] = DEFAULT_RULES,
}

return M