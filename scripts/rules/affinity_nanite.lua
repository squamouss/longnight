local log = _G.log or function(...) end
log("NANO_RULES: Loading nanomachine affinity rules.")

local M = {}

M.ARCHETYPE_BASE = {
    ["LOCASTE"] = 0,
    ["HICASTE"] = 0,
    ["EXCASTE"] = 0,
    ["NUCASTE"] = 0,
    ["CYCASTE"] = 1,
    ["BIOMACHINE"] = 1,
    ["CYBERMACHINE"] = 2,
    ["DEMIMACHINE"] = 1,
    ["NANOMACHINE"] = 3, 
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
    ["LIVESTOCK"] = -1,
    
    ["DEFAULT"] = 0
}

M.SUB_ARCHETYPE_MODIFIERS = {
    ["BLINDSIGHT"] = 0,    
    ["CYBORG"] = 0,    
    ["FULLBODY"] = 1,     
    ["HORROR"] = 1,    
    ["DEVIL"] = 2,     
    ["OGRE"] = 2,     
    ["HUMAN"] = 1,    
    ["ANDROID"] = 1,    
    ["INDUSTRIAL"] = 1,     
    ["DOLL"] = 1,     
    ["SCRAP"] = 0,
    ["WET"] = 1,    
    ["CORRUPT"] = 2,     
    ["PRISTINE"] = 2,   
    ["MECHA"] = 0,    
    ["SWARM"] = 1,     
    ["FRANKENSTEIN"] = 1,   
    ["HYBRID"] = 1,    
    ["GLITCH"] = 0,     
    ["FAIRY"] = 0,   
    ["UNKNOWN"] = 0
}

return M