local function script_log(...)
    if _G.log then _G.log(...) end
end

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local DEBUG_FREE_REACTIONS = true
local ENABLE_RAW_LOGGING = false

local SPECIFIC_TRANSFORMATION_REAGENTS_BY_SIZE = {
    MDM = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE_MDM:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:50:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    },
    LRG = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE_LRG:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:100:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    },
    HGE = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE_HGE:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:200:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    },
    GNT = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE_GNT:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:400:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    },
    TTN = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE_TTN:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:800:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    },
    DEFAULT = {
        FORTRESS = "[REAGENT:A:1:TOOL:ITEM_TOOL_CORE_INCOMPLETE:INORGANIC:N_MATTER]",
        ADVENTURE = "[REAGENT:A:75:TOOL:ITEM_TOOL_SCRAP:INORGANIC:N_MATTER]"
    }
}


-- ============================================================================
-- Helper Functions
-- ============================================================================

local function parse_syndromes_from_raw_text(raw_text)
    local lines = {}
    for line in raw_text:gmatch("[^\r\n]+") do table.insert(lines, line) end

    local syndromes = {}
    local current_syndrome_lines = nil

    for _, line in ipairs(lines) do
        if line:match("%[SYNDROME%]") then
            if current_syndrome_lines then
                table.insert(syndromes, table.concat(current_syndrome_lines, "\n"))
            end
            current_syndrome_lines = { line }
        elseif current_syndrome_lines then
            table.insert(current_syndrome_lines, line)
        end
    end

    if current_syndrome_lines then
        table.insert(syndromes, table.concat(current_syndrome_lines, "\n"))
    end
    
    return syndromes
end

local function modify_syndrome_for_ingestion(syndrome_block_string)
    local lines = {}
    for line in syndrome_block_string:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    if #lines > 0 and lines[1]:match("%[SYNDROME%]") then
        local indent = "    "
        if lines[2] then
            local lead_whitespace = lines[2]:match("^(%s*)")
            if lead_whitespace then indent = lead_whitespace end
        end

        table.insert(lines, 2, indent .. "[SYN_IMMUNE_CLASS:TRANSCEND]")
        table.insert(lines, 2, indent .. "[SYN_CLASS:TRANSCEND]")
        table.insert(lines, 2, indent .. "[SYN_INGESTED]")
        return table.concat(lines, "\n")
    else
        script_log("ITEM_GEN_LOG: WARNING: Could not modify syndrome block, as it did not start with [SYNDROME]. Block content: " .. syndrome_block_string)
        return syndrome_block_string
    end
end

-- [[ OPTIMIZATION: Updated generate_assets to accept master lists ]] --
local function generate_assets(master_inorganic_list, master_reaction_list, item_id_suffix, item_name, item_tile, reaction_name, category_id, category_name, category_desc, all_syndrome_blocks, is_first_in_category, fortress_reagent_line, adventure_reagent_line)
    local inorganic_id = "TRANSFORM_ITEM_" .. item_id_suffix

    -- Add to master list instead of local list
    table.insert(master_inorganic_list, "[INORGANIC:" .. inorganic_id .. "]")
    _G.add_generated_info(master_inorganic_list)
    table.insert(master_inorganic_list, "[USE_MATERIAL_TEMPLATE:MUSCLE_TABLET_TEMPLATE][MEAT][SPECIAL]")
    table.insert(master_inorganic_list, "[STATE_NAME_ADJ:ALL_SOLID:" .. item_name .. "][DISPLAY_COLOR:7:11:0][TILE:'" .. item_tile .. "']")
    table.insert(master_inorganic_list, "[SOLID_DENSITY:500][GENERATED]")
    table.insert(master_inorganic_list, "[STATE_COLOR:ALL_SOLID:MAUVE]")
    table.insert(master_inorganic_list, "[MEAT_NAME:NONE:" .. item_name .. ":" .. item_name .. "s]")

    for _, syndrome_block in ipairs(all_syndrome_blocks) do
        local reformatted_block = modify_syndrome_for_ingestion(syndrome_block)
        for line in reformatted_block:gmatch("[^\r\n]+") do
            table.insert(master_inorganic_list, line)
        end
    end

    if ENABLE_RAW_LOGGING then
        table.insert(master_inorganic_list, "[LOG_CURRENT_ENTRY]")
    end

    -- Fortress Reaction
    table.insert(master_reaction_list, "[REACTION:FORTRESS_" .. item_id_suffix .. "]")
    table.insert(master_reaction_list, "[NAME:" .. reaction_name .. "]")
    table.insert(master_reaction_list, "[BUILDING:N_MATTER_REFINERY:NONE][FORTRESS_MODE_ENABLED][GENERATED]")
    if not DEBUG_FREE_REACTIONS then
        table.insert(master_reaction_list, fortress_reagent_line)
    end
    table.insert(master_reaction_list, "[PRODUCT:100:1:MEAT:NONE:INORGANIC:" .. inorganic_id .. "]")
    table.insert(master_reaction_list, "[SKILL:EXTRACT_STRAND]")
    table.insert(master_reaction_list, "[CATEGORY:" .. category_id .. "_FORT]")
    if is_first_in_category then
        table.insert(master_reaction_list, "[CATEGORY_NAME:" .. category_name .. "]")
        table.insert(master_reaction_list, "[DESCRIPTION:" .. category_desc .. "]")
    end
    
    if ENABLE_RAW_LOGGING then
        table.insert(master_reaction_list, "[LOG_CURRENT_ENTRY]")
    end

    -- Adventure Reaction
    table.insert(master_reaction_list, "[REACTION:ADVENTURE_" .. item_id_suffix .. "]")
    table.insert(master_reaction_list, "[NAME:" .. reaction_name .. "]")
    table.insert(master_reaction_list, "[ADVENTURE_MODE_ENABLED][GENERATED]")
    if not DEBUG_FREE_REACTIONS then
        table.insert(master_reaction_list, adventure_reagent_line)
        table.insert(master_reaction_list, "[REAGENT:B:1:TOOL:ITEM_TOOL_PORTABLE_SYNTH:NONE:NONE][PRESERVE_REAGENT]")
    end
    table.insert(master_reaction_list, "[PRODUCT:100:1:MEAT:NONE:INORGANIC:" .. inorganic_id .. "]")
    table.insert(master_reaction_list, "[SKILL:EXTRACT_STRAND]")
    table.insert(master_reaction_list, "[CATEGORY:" .. category_id .. "_ADV]")
    if is_first_in_category then
        table.insert(master_reaction_list, "[CATEGORY_NAME:" .. category_name .. "]")
        table.insert(master_reaction_list, "[CATEGORY_DESCRIPTION:" .. category_desc .. "]")
    end

    if ENABLE_RAW_LOGGING then
        table.insert(master_reaction_list, "[LOG_CURRENT_ENTRY]")
    end
end

-- ============================================================================
-- Main Generation Hook
-- ============================================================================

local function generate_all_transformation_items()
    script_log("ITEM_GEN_LOG: Starting generation (V6.0 Batch Optimization).")

    if not _G.raws or type(_G.raws.get_interactions) ~= "function" then
        script_log("ITEM_GEN_LOG: ERROR: _G.raws.get_interactions() is not available.")
        return
    end

    local all_interactions = _G.raws.get_interactions()
    if not all_interactions or #all_interactions == 0 then
        script_log("ITEM_GEN_LOG: No interactions were captured.")
        return
    end

    script_log("ITEM_GEN_LOG: Parsing " .. #all_interactions .. " interaction blocks.")

    -- [[ 1. INITIALIZE MASTER LISTS ]] --
    local master_inorganic_lines = {}
    local master_reaction_lines = {}

    local specific_generated_count = 0

    for _, interaction_block in ipairs(all_interactions) do
        local interaction_id = interaction_block:match("%[INTERACTION:([^%]]+)%]")
        
        if interaction_id and interaction_id:match("^SECRET_BECOME_") then
            local interaction_name = interaction_block:match("%[IS_NAME:([^%]]+)%]")
            
            -- Regex matches standard secret pattern
            local creature_token, caste_token = interaction_id:match("SECRET_BECOME_([^:]+)::([^:]+)")
            local base_name, caste_name = nil, nil
            
            if interaction_name then
                -- [[ NAME PARSING UPDATE ]]
                -- 1. Try Old Format (Double Colon)
                base_name, caste_name = interaction_name:match("SECRET::(.+)::(.+)")
                
                -- 2. If fail, Try New Format ("secrets of the ...")
                if not caste_name then
                    local cleaned_name = interaction_name:match("secrets of the (.+)")
                    if cleaned_name then
                        base_name = cleaned_name
                        caste_name = cleaned_name
                    end
                end
            end

            if creature_token and caste_token and caste_name then
                -- [[ FIX: Updated Size Extraction ]] --
                local size_category = creature_token:match("_ID_([^_]+)_")
                if not size_category then
                    size_category = creature_token:match("_([A-Z][A-Z][A-Z])_")
                end
                if not size_category then size_category = "DEFAULT" end
                
                local reagent_lines = SPECIFIC_TRANSFORMATION_REAGENTS_BY_SIZE[size_category] or SPECIFIC_TRANSFORMATION_REAGENTS_BY_SIZE.DEFAULT

                local item_id_suffix = "SPECIFIC_" .. creature_token .. "_" .. caste_token
                local item_name = "Induction Core - " .. caste_name
                local reaction_name = "Induction Core - " .. caste_name

                local syndromes = parse_syndromes_from_raw_text(interaction_block)
                
                -- [[ 2. PASS MASTER LISTS TO GENERATOR ]] --
                generate_assets(
                    master_inorganic_lines, master_reaction_lines, -- Pass master lists here
                    item_id_suffix, item_name, "=", reaction_name,
                    "PROGRAM_SPECIFIC_TRANSCENDENCE", "N-core- Inductive", "Create an N-core which grants you a specific body.",
                    syndromes, specific_generated_count == 0,
                    reagent_lines.FORTRESS,
                    reagent_lines.ADVENTURE
                )
                specific_generated_count = specific_generated_count + 1
            else
                -- Only log regex failure if it's actually a SECRET_BECOME interaction we tried to parse
                script_log("ITEM_GEN_LOG: SKIPPED ID: " .. tostring(interaction_id) .. " (Regex Match Fail - Name or Token parsing)")
            end
        end
    end

    -- [[ 3. BATCH REGISTER EVERYTHING AT ONCE ]] --
    if #master_inorganic_lines > 0 then
        script_log("ITEM_GEN_LOG: Batch registering " .. #master_inorganic_lines .. " inorganic lines (for " .. specific_generated_count .. " items)...")
        _G.raws.register_inorganics(master_inorganic_lines)
    end

    if #master_reaction_lines > 0 then
        script_log("ITEM_GEN_LOG: Batch registering " .. #master_reaction_lines .. " reaction lines (for " .. specific_generated_count .. " items)...")
        _G.raws.register_reactions(master_reaction_lines)
    end

    script_log("ITEM_GEN_LOG: Finished generation. Specific Items Created: " .. specific_generated_count .. ".")
end

return {
    postprocess = {
        generate_all_transformation_items = generate_all_transformation_items
    }
}