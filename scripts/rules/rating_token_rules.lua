local M = {}

local function split_to_lines_internal(raw_block)
    local lines = {}
    if not raw_block or type(raw_block) ~= 'string' then
        return lines
    end
    
    for line in raw_block:gmatch("[^\r\n]+") do
        if line:match("%S") then 
            table.insert(lines, line)
        end
    end
    return lines
end


local SOURCE_MAP = {

    {
        ratings = {"SOPHONT", "DEVIANT", "VESSEL", "AVATAR", "LABOR", "SERVANT", "INCURSION"},
        tokens = [[
		
				[PROFESSION_NAME:SPINNER:textile processor:textile processors]
	[PROFESSION_NAME:WEAVER:textile worker:textile workers]
	[PROFESSION_NAME:LEATHERWORKER:mat processor:mat processor]
	[PROFESSION_NAME:CLOTHIER:textile artist:textile artists]
	
	[PROFESSION_NAME:PLANTER:field worker:field workers]
	
	[PROFESSION_NAME:RANGER:fauna expert:fauna experts]
	[PROFESSION_NAME:ANIMAL_CARETAKER:fauna manager:fauna managers]
	[PROFESSION_NAME:ANIMAL_TRAINER:fauna programmer:fauna programmers]
	[PROFESSION_NAME:MILKER:fauna extractor:fauna extractors]
	[PROFESSION_NAME:TRAPPER:fauna controller:fauna controllers]
	
	[PROFESSION_NAME:FARMER:processing worker:processing workers]
	[PROFESSION_NAME:BUTCHER:meat processor:meat processors]
	[PROFESSION_NAME:ANIMAL_DISSECTOR:sample processor:sample processors]
	[PROFESSION_NAME:TANNER:dermal processor:dermal processors]
	[PROFESSION_NAME:BONE_CARVER:frame processor:frame processors]
	[PROFESSION_NAME:MILLER:mill processor:mill processors]
	[PROFESSION_NAME:THRESHER:plant processor:plant processors]
	[PROFESSION_NAME:SHEARER:growth processor:growth processors]
	[PROFESSION_NAME:BREWER:brew processor:brew processors]
	[PROFESSION_NAME:DYER:pigment processor:pigment processors]
	[PROFESSION_NAME:POTASH_MAKER:fertilizer processor:fertilizer processors]
	[PROFESSION_NAME:SOAP_MAKER:oil processor:oil processors]
	[PROFESSION_NAME:LYE_MAKER:chemical processor:chemical processors]
	[PROFESSION_NAME:WAX_WORKER:acid processor:acid processors]
	[PROFESSION_NAME:CHEESE_MAKER:extract processor:extract processors]
	[PROFESSION_NAME:BEEKEEPER:hive processor:hive processors]
	[PROFESSION_NAME:PRESSER:compression processor:compression processors]
	
	[PROFESSION_NAME:CLERK:civil functionary:civil functionaries]
	[PROFESSION_NAME:ADMINISTRATOR:civil manager:civil managers]
	
	[PROFESSION_NAME:POTTER:plastician:plasticians]
	
	[PROFESSION_NAME:GLAZER:glass worker:glass workers]
	[PROFESSION_NAME:GLASSMAKER:glass artist:glass artists]
	
	[PROFESSION_NAME:ENGINEER:general engineer:general engineers]
	[PROFESSION_NAME:MECHANIC:mechanical engineer:mechanical engineers]
	[PROFESSION_NAME:SIEGE_ENGINEER:military engineer:military engineers]
	[PROFESSION_NAME:PUMP_OPERATOR:fluid engineer:fluid engineers]
	
	[PROFESSION_NAME:STRAND_EXTRACTOR:N-matter manufacturer:N-matter manufacturers]
	[PROFESSION_NAME:METALSMITH:general manufacturer:general manufacturers]
	[PROFESSION_NAME:METALCRAFTER:tech worker:tech workers]
	[PROFESSION_NAME:BLACKSMITH:tech manufacturer:tech manufacturers]
	[PROFESSION_NAME:ARMORER:armor manufacturer:armor manufacturers]
	[PROFESSION_NAME:WEAPONSMITH:weapon manufacturer:weapon manufacturers]
	[PROFESSION_NAME:FURNACE_OPERATOR:recycling manufacturer:recycling manufacturers]
	
	[PROFESSION_NAME:JEWELER:light worker:light workers]
	[PROFESSION_NAME:GEM_CUTTER:light cutter:light cutters]
	[PROFESSION_NAME:GEM_SETTER:light artist:light artists]
	
	[PROFESSION_NAME:CRAFTSMAN:general worker:general workers]
	[PROFESSION_NAME:DRUNK:derelict:derelicts]
	[PROFESSION_NAME:STANDARD:civilian:civilians]
	[PROFESSION_NAME:MESSENGER:courier:courier]
	[PROFESSION_NAME:CRIMINAL:outlaw:outlaws]
	[PROFESSION_NAME:THIEF:agent:agents]
	[PROFESSION_NAME:MASTER_THIEF:elite agent:elite agents]
	[PROFESSION_NAME:RECRUIT:conscript:conscripts]
	PROFESSION_NAME:SLAVE:indenture:indentures
	[PROFESSION_NAME:SNATCHER:indenturer:indenturers]
	[PROFESSION_NAME:HERBALIST:forager:foragers]
	
	[PROFESSION_NAME:DOCTOR:general biotechnician:general biotechnicians]
	[PROFESSION_NAME:DIAGNOSER:diagnostic biotechnician:diagnostic biotechnicians]
	[PROFESSION_NAME:BONE_SETTER:structural biotechnician:structural biotechnicians]
	[PROFESSION_NAME:GELDER:eugenical biotechnician:eugenical biotechnicians]
	[PROFESSION_NAME:SUTURER:reparative biotechnician:reparative biotechnicians]
	[PROFESSION_NAME:SURGEON:surgical biotechnician:surgical biotechnicians]
	
	[PROFESSION_NAME:FISHERY_WORKER:stock worker:stock workers]
	[PROFESSION_NAME:FISHERMAN:stock gatherer:stock gatherers]
	[PROFESSION_NAME:FISH_DISSECTOR:stock processor:stock processors]
	[PROFESSION_NAME:FISH_CLEANER:stock cleaner:stock cleaners]
	
	[PROFESSION_NAME:COOK:culinary artist:culinary artists]
	[PROFESSION_NAME:TAVERN_KEEPER:service artist:service artists]
	[PROFESSION_NAME:PERFORMER:general artist:general artists]
	[PROFESSION_NAME:POET:lyrical artist:lyrical artists]
	[PROFESSION_NAME:BARD:celebrity artist:celebrity artists]
	[PROFESSION_NAME:DANCER:physical artist:physical artists]
	
	[PROFESSION_NAME:PAPERMAKER:sheet processor:sheet processors]
	[PROFESSION_NAME:BOOKBINDER:data worker:data workers]
	
	[PROFESSION_NAME:MONK:datasphere cultist:datasphere cultists]
	[PROFESSION_NAME:PILGRIM:datasphere seeker:datasphere seekers]
	[PROFESSION_NAME:PROPHET:datasphere conduit:datasphere conduits]
	
	[PROFESSION_NAME:STONEWORKER:structurist:structurists]
	[PROFESSION_NAME:MINER:structure excavator:structure excavators]
	[PROFESSION_NAME:MASON:structure constructor:structure constructors]
	[PROFESSION_NAME:ENGRAVER:structure artist:structure artists]
	[PROFESSION_NAME:STONECRAFTER:structure worker:structure workers][PROFESSION_NAME:STONECUTTER:structure modder:structure modders][PROFESSION_NAME:STONECUTTER:structure constructor:structure constructors]
	
	[PROFESSION_NAME:WOODWORKER:scrapper:scrappers]
	[PROFESSION_NAME:WOODCUTTER:scrap harvester:scrap harvesters]
	[PROFESSION_NAME:WOODCRAFTER:scrap worker:scrap workers]
	[PROFESSION_NAME:CARPENTER:scrap constructor:scrap constructors]
	[PROFESSION_NAME:WOOD_BURNER:scrap recycler:scrap recyclers]
	[PROFESSION_NAME:BOWYER:scrap dealer:scrap dealers]
	
	[PROFESSION_NAME:PEDDLER:unlicensed vendor:unlicensed vendors]
	[PROFESSION_NAME:MERCHANT:licensed vendor:licensed vendors]
	[PROFESSION_NAME:TRADER:economic executive:economic executives]
	
	
	PROFESSION_NAME:ALCHEMIST:N-matter analyst:N-matter analysts
	[PROFESSION_NAME:SCHOLAR:general analyst:general analysts]
	[PROFESSION_NAME:SAGE:expert analyst:expert analysts]
	[PROFESSION_NAME:SCRIBE:copy analyst:copy analysts]
	[PROFESSION_NAME:PHILOSOPHER:psychological analyst:psychological analysts]
	[PROFESSION_NAME:MATHEMATICIAN:logical analyst:logical analysts]
	[PROFESSION_NAME:HISTORIAN:narrative analyst:narrative analysts]
	[PROFESSION_NAME:ASTRONOMER:orbital analyst:orbital analysts]
	[PROFESSION_NAME:NATURALIST:biological analyst:biological analysts]
	[PROFESSION_NAME:CHEMIST:chemical analyst:chemical analysts]
	[PROFESSION_NAME:GEOGRAPHER:terrain analyst:terrain analysts]
	PROFESSION_NAME:ARCHITECT:architectural analyst:architectural analysts

	[PROFESSION_NAME:HUNTER:hunter unit:hunter units]
	[PROFESSION_NAME:SCOUT:scout unit:scout units]
	[PROFESSION_NAME:BEAST_HUNTER:extermination unit:extermination units]
	[PROFESSION_NAME:MONSTER_SLAYER:delver unit:delver units]
	[PROFESSION_NAME:MERCENARY:provisional unit:provisional units]
	[PROFESSION_NAME:SIEGE_OPERATOR:siege unit:siege units]
	[PROFESSION_NAME:CROSSBOWMAN:assault unit:assault units]
	[PROFESSION_NAME:MASTER_CROSSBOWMAN:elite assault unit:elite assault units]
	[PROFESSION_NAME:BOWMAN:support unit:support units]
	[PROFESSION_NAME:MASTER_BOWMAN:elite support unit:elite support units]
	[PROFESSION_NAME:BLOWGUNMAN:skirmish unit:skirmish units]
	[PROFESSION_NAME:MASTER_BLOWGUNMAN:elite skirmish unit:elite skirmish units]
	[PROFESSION_NAME:AXEMAN:duelist unit:duelist units]
	[PROFESSION_NAME:MASTER_AXEMAN:elite duelist unit:elite duelist units]
	[PROFESSION_NAME:MACEMAN:vanguard unit:vanguard units]
	[PROFESSION_NAME:MASTER_MACEMAN:elite vanguard unit:elite vanguard units]
	[PROFESSION_NAME:SPEARMAN:control unit:control units]
	[PROFESSION_NAME:MASTER_SPEARMAN:elite control unit:elite control units]
	[PROFESSION_NAME:WRESTLER:martial artist:martial artists]
	[PROFESSION_NAME:MASTER_WRESTLER:elite martial artist:elite martial artists]
		
]]
    },

    -- Example: Add specific tokens ONLY to SOPHONT
    {
        ratings = {"HOSTILE"},
        tokens = [[		
		[PROFESSION_NAME:SPINNER:textile processor:textile processors]
	[PROFESSION_NAME:WEAVER:textile worker:textile workers]
	[PROFESSION_NAME:LEATHERWORKER:mat processor:mat processor]
	[PROFESSION_NAME:CLOTHIER:textile artist:textile artists]
	
	[PROFESSION_NAME:PLANTER:field worker:field workers]
	
	[PROFESSION_NAME:RANGER:fauna expert:fauna experts]
	[PROFESSION_NAME:ANIMAL_CARETAKER:fauna manager:fauna managers]
	[PROFESSION_NAME:ANIMAL_TRAINER:fauna programmer:fauna programmers]
	[PROFESSION_NAME:MILKER:fauna extractor:fauna extractors]
	[PROFESSION_NAME:TRAPPER:fauna controller:fauna controllers]
	
	[PROFESSION_NAME:FARMER:processing worker:processing workers]
	[PROFESSION_NAME:BUTCHER:meat processor:meat processors]
	[PROFESSION_NAME:ANIMAL_DISSECTOR:sample processor:sample processors]
	[PROFESSION_NAME:TANNER:dermal processor:dermal processors]
	[PROFESSION_NAME:BONE_CARVER:frame processor:frame processors]
	[PROFESSION_NAME:MILLER:mill processor:mill processors]
	[PROFESSION_NAME:THRESHER:plant processor:plant processors]
	[PROFESSION_NAME:SHEARER:growth processor:growth processors]
	[PROFESSION_NAME:BREWER:brew processor:brew processors]
	[PROFESSION_NAME:DYER:pigment processor:pigment processors]
	[PROFESSION_NAME:POTASH_MAKER:fertilizer processor:fertilizer processors]
	[PROFESSION_NAME:SOAP_MAKER:oil processor:oil processors]
	[PROFESSION_NAME:LYE_MAKER:chemical processor:chemical processors]
	[PROFESSION_NAME:WAX_WORKER:acid processor:acid processors]
	[PROFESSION_NAME:CHEESE_MAKER:extract processor:extract processors]
	[PROFESSION_NAME:BEEKEEPER:hive processor:hive processors]
	[PROFESSION_NAME:PRESSER:compression processor:compression processors]
	
	[PROFESSION_NAME:CLERK:civil functionary:civil functionaries]
	[PROFESSION_NAME:ADMINISTRATOR:civil manager:civil managers]
	
	[PROFESSION_NAME:POTTER:plastician:plasticians]
	
	[PROFESSION_NAME:GLAZER:glass worker:glass workers]
	[PROFESSION_NAME:GLASSMAKER:glass artist:glass artists]
	
	[PROFESSION_NAME:ENGINEER:general engineer:general engineers]
	[PROFESSION_NAME:MECHANIC:mechanical engineer:mechanical engineers]
	[PROFESSION_NAME:SIEGE_ENGINEER:military engineer:military engineers]
	[PROFESSION_NAME:PUMP_OPERATOR:fluid engineer:fluid engineers]
	
	[PROFESSION_NAME:STRAND_EXTRACTOR:N-matter manufacturer:N-matter manufacturers]
	[PROFESSION_NAME:METALSMITH:general manufacturer:general manufacturers]
	[PROFESSION_NAME:METALCRAFTER:tech worker:tech workers]
	[PROFESSION_NAME:BLACKSMITH:tech manufacturer:tech manufacturers]
	[PROFESSION_NAME:ARMORER:armor manufacturer:armor manufacturers]
	[PROFESSION_NAME:WEAPONSMITH:weapon manufacturer:weapon manufacturers]
	[PROFESSION_NAME:FURNACE_OPERATOR:recycling manufacturer:recycling manufacturers]
	
	[PROFESSION_NAME:JEWELER:light worker:light workers]
	[PROFESSION_NAME:GEM_CUTTER:light cutter:light cutters]
	[PROFESSION_NAME:GEM_SETTER:light artist:light artists]
	
	[PROFESSION_NAME:CRAFTSMAN:general worker:general workers]
	[PROFESSION_NAME:DRUNK:derelict:derelicts]
	[PROFESSION_NAME:STANDARD:civilian:civilians]
	[PROFESSION_NAME:MESSENGER:courier:courier]
	[PROFESSION_NAME:CRIMINAL:outlaw:outlaws]
	[PROFESSION_NAME:THIEF:agent:agents]
	[PROFESSION_NAME:MASTER_THIEF:elite agent:elite agents]
	[PROFESSION_NAME:RECRUIT:conscript:conscripts]
	PROFESSION_NAME:SLAVE:indenture:indentures
	[PROFESSION_NAME:SNATCHER:indenturer:indenturers]
	[PROFESSION_NAME:HERBALIST:forager:foragers]
	
	[PROFESSION_NAME:DOCTOR:general biotechnician:general biotechnicians]
	[PROFESSION_NAME:DIAGNOSER:diagnostic biotechnician:diagnostic biotechnicians]
	[PROFESSION_NAME:BONE_SETTER:structural biotechnician:structural biotechnicians]
	[PROFESSION_NAME:GELDER:eugenical biotechnician:eugenical biotechnicians]
	[PROFESSION_NAME:SUTURER:reparative biotechnician:reparative biotechnicians]
	[PROFESSION_NAME:SURGEON:surgical biotechnician:surgical biotechnicians]
	
	[PROFESSION_NAME:FISHERY_WORKER:stock worker:stock workers]
	[PROFESSION_NAME:FISHERMAN:stock gatherer:stock gatherers]
	[PROFESSION_NAME:FISH_DISSECTOR:stock processor:stock processors]
	[PROFESSION_NAME:FISH_CLEANER:stock cleaner:stock cleaners]
	
	[PROFESSION_NAME:COOK:culinary artist:culinary artists]
	[PROFESSION_NAME:TAVERN_KEEPER:service artist:service artists]
	[PROFESSION_NAME:PERFORMER:general artist:general artists]
	[PROFESSION_NAME:POET:lyrical artist:lyrical artists]
	[PROFESSION_NAME:BARD:celebrity artist:celebrity artists]
	[PROFESSION_NAME:DANCER:physical artist:physical artists]
	
	[PROFESSION_NAME:PAPERMAKER:sheet processor:sheet processors]
	[PROFESSION_NAME:BOOKBINDER:data worker:data workers]
	
	[PROFESSION_NAME:MONK:datasphere cultist:datasphere cultists]
	[PROFESSION_NAME:PILGRIM:datasphere seeker:datasphere seekers]
	[PROFESSION_NAME:PROPHET:datasphere conduit:datasphere conduits]
	
	[PROFESSION_NAME:STONEWORKER:structurist:structurists]
	[PROFESSION_NAME:MINER:structure excavator:structure excavators]
	[PROFESSION_NAME:MASON:structure constructor:structure constructors]
	[PROFESSION_NAME:ENGRAVER:structure artist:structure artists]
	[PROFESSION_NAME:STONECRAFTER:structure worker:structure workers][PROFESSION_NAME:STONECUTTER:structure modder:structure modders][PROFESSION_NAME:STONECUTTER:structure constructor:structure constructors]
	
	[PROFESSION_NAME:WOODWORKER:scrapper:scrappers]
	[PROFESSION_NAME:WOODCUTTER:scrap harvester:scrap harvesters]
	[PROFESSION_NAME:WOODCRAFTER:scrap worker:scrap workers]
	[PROFESSION_NAME:CARPENTER:scrap constructor:scrap constructors]
	[PROFESSION_NAME:WOOD_BURNER:scrap recycler:scrap recyclers]
	[PROFESSION_NAME:BOWYER:scrap dealer:scrap dealers]
	
	[PROFESSION_NAME:PEDDLER:unlicensed vendor:unlicensed vendors]
	[PROFESSION_NAME:MERCHANT:licensed vendor:licensed vendors]
	[PROFESSION_NAME:TRADER:economic executive:economic executives]
	
	
	PROFESSION_NAME:ALCHEMIST:N-matter analyst:N-matter analysts
	[PROFESSION_NAME:SCHOLAR:general analyst:general analysts]
	[PROFESSION_NAME:SAGE:expert analyst:expert analysts]
	[PROFESSION_NAME:SCRIBE:copy analyst:copy analysts]
	[PROFESSION_NAME:PHILOSOPHER:psychological analyst:psychological analysts]
	[PROFESSION_NAME:MATHEMATICIAN:logical analyst:logical analysts]
	[PROFESSION_NAME:HISTORIAN:narrative analyst:narrative analysts]
	[PROFESSION_NAME:ASTRONOMER:orbital analyst:orbital analysts]
	[PROFESSION_NAME:NATURALIST:biological analyst:biological analysts]
	[PROFESSION_NAME:CHEMIST:chemical analyst:chemical analysts]
	[PROFESSION_NAME:GEOGRAPHER:terrain analyst:terrain analysts]
	PROFESSION_NAME:ARCHITECT:architectural analyst:architectural analysts

	[PROFESSION_NAME:HUNTER:hunter unit:hunter units]
	[PROFESSION_NAME:SCOUT:scout unit:scout units]
	[PROFESSION_NAME:BEAST_HUNTER:extermination unit:extermination units]
	[PROFESSION_NAME:MONSTER_SLAYER:delver unit:delver units]
	[PROFESSION_NAME:MERCENARY:provisional unit:provisional units]
	[PROFESSION_NAME:SIEGE_OPERATOR:siege unit:siege units]
	[PROFESSION_NAME:CROSSBOWMAN:assault unit:assault units]
	[PROFESSION_NAME:MASTER_CROSSBOWMAN:elite assault unit:elite assault units]
	[PROFESSION_NAME:BOWMAN:support unit:support units]
	[PROFESSION_NAME:MASTER_BOWMAN:elite support unit:elite support units]
	[PROFESSION_NAME:BLOWGUNMAN:skirmish unit:skirmish units]
	[PROFESSION_NAME:MASTER_BLOWGUNMAN:elite skirmish unit:elite skirmish units]
	[PROFESSION_NAME:AXEMAN:duelist unit:duelist units]
	[PROFESSION_NAME:MASTER_AXEMAN:elite duelist unit:elite duelist units]
	[PROFESSION_NAME:MACEMAN:vanguard unit:vanguard units]
	[PROFESSION_NAME:MASTER_MACEMAN:elite vanguard unit:elite vanguard units]
	[PROFESSION_NAME:SPEARMAN:control unit:control units]
	[PROFESSION_NAME:MASTER_SPEARMAN:elite control unit:elite control units]
	[PROFESSION_NAME:WRESTLER:martial artist:martial artists]
	[PROFESSION_NAME:MASTER_WRESTLER:elite martial artist:elite martial artists]
]]
    },
    {
        ratings = {"SERVANT", "LABOR"},
        tokens = [[
			[PERSONALITY:ACTIVITY_LEVEL:0:0:0]
			[PERSONALITY:EXCITEMENT_SEEKING:0:0:0]
			[PERSONALITY:GREGARIOUSNESS:0:0:0]
			[PERSONALITY:IMMODERATION:0:0:0]
			[PERSONALITY:GREED:0:0:0]
			[PERSONALITY:IMMODESTY:0:0:0]
			[PERSONALITY:CURIOUS:0:0:0]
			[PERSONALITY:ABSTRACT_INCLINED:0:0:0]
			[PERSONALITY:ART_INCLINED:0:0:0]
			[PERSONALITY:IMAGINATION:0:0:0]
			[PERSONALITY:DISCORD:0:0:0]
			[PERSONALITY:FRIENDLINESS:100:100:100]
			[PERSONALITY:VIOLENT:0:0:0]
			[PERSONALITY:VENGEFUL:0:0:0]
			[PERSONALITY:ALTRUISM:0:0:0]
			[PERSONALITY:DUTIFULNESS:0:0:0]
			[PERSONALITY:LOVE_PROPENSITY:0:0:0]
			[PERSONALITY:LUST_PROPENSITY:0:0:0]
			[PERSONALITY:HUMOR:0:0:0]
			[PERSONALITY:PRIVACY:0:0:0]
			[PERSONALITY:PERFECTIONIST:0:0:0]
			[PERSONALITY:AMBITION:0:0:0]
			[PERSONALITY:STRESS_VULNERABILITY:0:0:0]
			[PERSONALITY:DEPRESSION_PROPENSITY:0:0:0]
			[PERSONALITY:ANXIETY_PROPENSITY:0:0:0]
			[PERSONALITY:ANGER_PROPENSITY:0:0:0]
			[PERSONALITY:TOLERANT:100:100:100]
			[PERSONALITY:SWAYED_BY_EMOTIONS:0:0:0]
			[PERSONALITY:EMOTIONALLY_OBSESSIVE:0:0:0]
]]
    },
    {
        ratings = {"BENIGN", "HAZARDOUS", "PROBLEMATIC", "EXISTENTIAL", "DANGEROUS", "WEAPON", "MILITARY"},
        tokens = [[
	[PROFESSION_NAME:RECRUIT::]
	[PROFESSION_NAME:WRESTLER::]
	[PROFESSION_NAME:MASTER_WRESTLER::]
]]
    },

}

-- ============================================================================
-- BUILD 
-- ============================================================================

M.RATING_TOKEN_MAP = {}

for _, group in ipairs(SOURCE_MAP) do
    local token_block = group.tokens
    if token_block and group.ratings then
        for _, rating_tag in ipairs(group.ratings) do
            if not M.RATING_TOKEN_MAP[rating_tag] then
                -- First time seeing this rating, create a new block
                M.RATING_TOKEN_MAP[rating_tag] = token_block
            else
                -- This rating already has tokens, append new ones
                M.RATING_TOKEN_MAP[rating_tag] = M.RATING_TOKEN_MAP[rating_tag] .. "\n" .. token_block
            end
        end
    end
end

function M.get_rating_tokens(config, components)
    if not components or not components.rating or not components.rating.tags or #components.rating.tags == 0 then
        return nil -- Not enough info
    end

    -- Get the primary rating tag (e.g., "SOPHONT", "HOSTILE")
    local rating_tag = components.rating.tags[1]

    -- Find the corresponding token block in map
    local raw_token_block = M.RATING_TOKEN_MAP[rating_tag]

    if raw_token_block then
        -- Use the internal helper to split the string into a table of lines
        return split_to_lines_internal(raw_token_block)
    end

    -- No rule found for this rating
    return nil
end

return M