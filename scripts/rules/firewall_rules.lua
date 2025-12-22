local log = _G.log or function(...) end
log("FIREWALL_RULES: Loading firewall calculation rules.")

local M = {}

M.ARCHETYPE_BASE = {
    ["LOCASTE"] = 0,
    ["HICASTE"] = 0,
    ["EXCASTE"] = 0,
    ["NUCASTE"] = 1,
    ["CYCASTE"] = 1,
    ["BIOMACHINE"] = 1,
    ["CYBERMACHINE"] = 2,
    ["DEMIMACHINE"] = 1,
    ["NANOMACHINE"] = 1,
    ["HOLOMACHINE"] = 2,
    ["CHIMERA"] = 0,
    ["PROTOCHIMERA"] = 0,
    ["PALEOCHIMERA"] = 0,
    ["POLYMERID"] = 0,
    ["SILICID"] = 0,
    ["ELASTOMERID"] = 0,
    ["MACROCELL"] = 0,
    ["DEFAULT"] = 1
}


M.RATING_MODIFIERS = {

    ["INCURSION"] = 1,
    ["EXISTENTIAL"] = 1,
    ["AVATAR"] = 1,
    ["HOSTILE"] = 1,
	
    ["VESSEL"] = 0,
    ["DEVIANT"] = 0,
    ["SOPHONT"] = 0,
    
    ["DANGEROUS"] = 1,
    ["HAZARDOUS"] = 1,
    ["PROBLEMATIC"] = 0,
    ["BENIGN"] = -1,
    
    ["VERMIN"] = -3,
    ["AMBIENT"] = -3,
    
    ["DOMESTIC"] = -1,
    ["COMPANION"] = -1,
    ["SANITATION"] = -1,
    ["HUNTER"] = -1,
    ["MILITARY"] = 1,
    ["WEAPON"] = 1,
    ["VEHICLE"] = 1,
    ["NOMAD"] = 1,
    ["CARRIER"] = 0,
    ["SERVANT"] = 0,
    ["LABOR"] = -1,
    ["PRODUCT"] = -1
}

M.SUB_ARCHETYPE_MODIFIERS = {
    ["BLINDSIGHT"] = 1,    
    ["CYBORG"] = 0,    
    ["FULLBODY"] = 1,     
    ["HORROR"] = 0,    
    ["DEVIL"] = 1,     
    ["OGRE"] = 0,     
    ["HUMAN"] = 1,    
    ["ANDROID"] = 2,    
    ["INDUSTRIAL"] = 1,     
    ["DOLL"] = 1,     
    ["SCRAP"] = 0,
    ["WET"] = 0,    
    ["CORRUPT"] = 0,     
    ["PRISTINE"] = 1,   
    ["MECHA"] = 1,    
    ["SWARM"] = 0,     
    ["FRANKENSTEIN"] = 0,   
    ["HYBRID"] = 2,    
    ["GLITCH"] = 2,     
    ["FAIRY"] = 2,   
    ["UNKNOWN"] = 0
}

return M