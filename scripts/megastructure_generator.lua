-- ============================================================================
-- CONFIGURATION
-- ============================================================================
local ENABLE_GENERATION = true 
local NUM_TO_GENERATE = 400 

-- ============================================================================
-- FUNCTIONS
-- ============================================================================
local function trandom(n)
    if _G.trandom then return _G.trandom(n) end
    return math.random(n) - 1 
end

local function random_in_range(min, max)
    if min >= max then return min end
    return trandom(max - min + 1) + min
end

local RES_ALLOY = "ALLOY"
local RES_ENERGY = "ENERGETIC_COMPOUND"
local RES_COMPUTE = "COMPUTING_SUBSTRATE"
local RES_BIO = "N_MATTER"
local RES_HYPERBIO = "HYPERBIOLOGY"
local RES_HARDLIGHT = "HARDLIGHT" 

-- ============================================================================
-- MAIN MATERIAL CONFIGURATION
-- ============================================================================
local MAIN_MATERIALS = {

    -- =======================================================
    -- HIGH DENSITY / N-MATTER
    -- =======================================================
    {
        name = "N-mass",
        stone_suffix = " node",
        weight = 5, 
        ranges = { ma={91,100}, ec={91,100}, cs={91,100} }, 
        tile = 247, color = "5:8:0",
        placement = {
            mode = "layer",
            tags = [[ 
			[DEEP_SPECIAL]
			]]
        }
    },

    -- =======================================================
    -- COMPUTING
    -- =======================================================
    {
        name = "computing core",
        stone_suffix = " scrap",
        weight = 12, 
        ranges = { ma={0,30}, ec={0,30}, cs={71,100} }, 
        tile = 240, color = "3:8:1",
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:computing bank", type="CLUSTER_ONE", prob=100 },
                { target="GROUP:computing cabling", type="CLUSTER_ONE", prob=50 },
            },
            tags = [[ ]]
        }
    },
    {
        name = "computing bank",
        stone_suffix = " scrap",
        weight = 15,
        ranges = { ma={0,29}, ec={0,29}, cs={40,70} }, 
        caps = { cs = 70 },
        tile = 61, color = "3:8:1",
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:computing cabling", type="CLUSTER_SMALL", prob=50 },
                { target="GROUP:computing filament", type="CLUSTER_ONE", prob=50 },
            },
            tags = [[ ]]
		}
    },
    {
        name = "computing channel",
        stone_suffix = " scrap",
        weight = 16, 
        ranges = { ma={0,19}, ec={0,19}, cs={25,39} },
        caps = { cs = 40 },
        tile = 206, color = "3:8:1",
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:computing filament", type="VEIN", prob=100 },
                { target="GROUP:median structure", type="VEIN", prob=50 },
                { target="GROUP:heavy structure",   type="VEIN", prob=50 },
            },
            tags = [[ ]]
		}
    },
    {
        name = "computing filament",
        stone_suffix = " scrap",
        weight = 16, 
        ranges = { ma={0,14}, ec={0,14}, cs={11,24} },
        caps = { cs = 25 },
        tile = 172, color = "3:8:1", 
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:light structure", type="CLUSTER", prob=25 },
                { target="GROUP:median structure", type="CLUSTER", prob=50 },
                { target="GROUP:heavy structure",   type="CLUSTER", prob=75 },
            },
            tags = [[ ]]
		}
    },

    -- =======================================================
    -- ENERGY
    -- =======================================================
    {
        name = "energy reactor",
        stone_suffix = " scrap",
        weight = 12, 
        ranges = { ma={0,30}, ec={71,100}, cs={0,30} }, 
        tile = 241, color = "6:8:1",
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:energy vault", type="CLUSTER_ONE", prob=100 },
                { target="GROUP:energy cabling", type="VEIN", prob=50 },
            },
            tags = [[ ]]
        }
    },
	
    { 
        name = "energy vault",
        stone_suffix = " scrap",
        weight = 12,
        ranges = { ma={0,29}, ec={40,70}, cs={0,29} }, 
        caps = { ec = 70 },
        tile = 043, color = "6:8:1",
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:energy cabling", type="CLUSTER_SMALL", prob=50 },
                { target="GROUP:energy wiring", type="CLUSTER_SMALL", prob=50 },
            },
            tags = [[ ]]
		}
    },
    {
        name = "energy cabling",
        stone_suffix = " scrap",
        weight = 16, 
        ranges = { ma={0,19}, ec={25,39}, cs={0,19} },
        caps = { ec = 40 },
        tile = 247, color = "6:8:1", 
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:energy wiring", type="VEIN", prob=100 },
                { target="GROUP:median structure", type="VEIN", prob=50 },
                { target="GROUP:heavy structure",   type="VEIN", prob=50 },
            },
            tags = [[ ]]
		}
    },
    {
        name = "energy wiring",
        stone_suffix = " scrap",
        weight = 16,
        ranges = { ma={0,14}, ec={11,24}, cs={0,14} }, 
        caps = { ec = 25 },
        tile = 126, color = "6:8:1", 
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:light structure", type="CLUSTER", prob=25 },
                { target="GROUP:median structure", type="CLUSTER", prob=50 },
                { target="GROUP:heavy structure",   type="CLUSTER", prob=75 },
            },
            tags = [[  ]]
		}
    }, 
    { 
        name = "biomachine locus", 
        stone_suffix = " sample",
        weight = 12, 
        ranges = { ma={0,30}, ec={71,100}, cs={0,30} },
        tile = 005, color = "4:8:0", 
        resource_swaps = { { target = RES_ENERGY, replace_with = RES_HYPERBIO, tag = "HB" } },
        placement = {
            mode = "inclusion",
            specs = { { target="GROUP:heavy structure", type="VEIN", prob=15 } },
            tags = [[ ]]
        }
    },
	
    { 
        name = "biomachinery", 
        stone_suffix = " sample",
        weight = 12, 
        ranges = { ma={0,29}, ec={40,70}, cs={0,29} }, 
        tile = 037, color = "4:8:0", 
        resource_swaps = { { target = RES_ENERGY, replace_with = RES_HYPERBIO, tag = "HB" } },
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:energy cabling", type="CLUSTER_SMALL", prob=50 },
                { target="GROUP:energy wiring", type="CLUSTER_SMALL", prob=50 },
            },
            tags = [[ ]]
        }
    },
	
    { 
        name = "biomachine artery", 
        stone_suffix = " sample",
        weight = 12,
        ranges = { ma={0,19}, ec={25,39}, cs={0,19} },
        caps = { ec = 40 },
        tile = 247, color = "4:8:0", 
        resource_swaps = { { target = RES_ENERGY, replace_with = RES_HYPERBIO, tag = "HB" } },
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:biomachine mass", type="VEIN", prob=100 },
                { target="GROUP:median structure", type="VEIN", prob=50 },
                { target="GROUP:heavy structure",   type="VEIN", prob=50 },
            },
            tags = [[ ]]
        }
    },

    {
        name = "biomass", 
        stone_suffix = " sample",
        weight = 12,
        ranges = { ma={0,14}, ec={11,24}, cs={0,14} },
        caps = { ec = 25 },
        tile = 224, color = "4:8:0", 
        resource_swaps = { { target = RES_ENERGY, replace_with = RES_HYPERBIO, tag = "HB" } },
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:light structure", type="CLUSTER", prob=25 },
                { target="GROUP:median structure", type="CLUSTER", prob=50 },
                { target="GROUP:heavy structure",   type="CLUSTER", prob=75 },
            },
            tags = [[ ]]
        }
    },

    -- =======================================================
    -- STRUCTURE
    -- =======================================================
    {
        name = "heavy structure",
        stone_suffix = " scrap",
        weight = 15, 
        ranges = { ma={71,100}, ec={0,40}, cs={0,40} }, 
        caps = { ec = 40, cs = 40 },
        tile = 206, color = "0:7:1", 
        placement = {
            mode = "layer",
            tags = [[ 
			[REACTION_CLASS:HEAVY_STRUCTURE]
			[IGNEOUS_INTRUSIVE] [SEDIMENTARY_OCEAN_DEEP][DEEP_SURFACE]
			[IS_STONE]
			]]
        }
    },
    {
        name = "median structure",
        stone_suffix = " scrap",
        weight = 15,
        ranges = { ma={41,70}, ec={0,30}, cs={0,30} }, 
        caps = { ec = 30, cs = 30 },
        tile = 216, color = "0:7:1", 
        placement = {
            mode = "layer",
            tags = [[ 
			[REACTION_CLASS:MIDDLE_STRUCTURE]
			[METAMORPHIC] [IGNEOUS_EXTRUSIVE]
			[IS_STONE] 
			]]
        }
    },
    {
        name = "light structure",
        stone_suffix = " scrap",
        weight = 16,
        ranges = { ma={11,40}, ec={0,20}, cs={0,20} }, 
        caps = { ec = 20, cs = 20 }, 
        tile = 197, color = "0:7:1", 
        placement = {
            mode = "layer",
            tags = [[ 
			[REACTION_CLASS:LIGHT_STRUCTURE]
			[SEDIMENTARY] [SEDIMENTARY_OCEAN_SHALLOW]
			[IS_STONE]
			]]
        }
    },
    {
        name = "plastcrete",
        stone_suffix = " chunk",
        weight = 18, 
        ranges = { ma={0,10}, ec={0,10}, cs={0,10} },
        tile = 178, color = "7:6:0", 
        placement = {
            mode = "layer",
            tags = [[ 
			[REACTION_CLASS:PLASTCRETE]
			[IGNEOUS_INTRUSIVE] [SEDIMENTARY] [IGNEOUS_EXTRUSIVE] [METAMORPHIC] 
			[IS_STONE]
			]]
        }
    },
	
    { 
        name = "native stone", 
        stone_suffix = " scrap",
        weight = 14, 
        ranges = { ma={0,10}, ec={0,10}, cs={0,10} },
        tile = 178, color = "6:7:0", 
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_ALLOY, tag = "NS" } },
        placement = {
            tags = [[ [IGNEOUS_INTRUSIVE] [METAMORPHIC] [DEEP_SURFACE] [SPECIAL] ]]
        }
    },
	
    { 
        name = "structural scarring", 
        stone_suffix = " scrap",
        weight = 14, 
        ranges = { ma={0,10}, ec={0,10}, cs={0,10} },
        tile = 178, color = "0:12:1", 
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_ALLOY, tag = "NS" } },
        placement = {
            tags = [[ [METAMORPHIC] [SEDIMENTARY] [SPECIAL] ]]
        }
    },
    { 
        name = "slag", 
        stone_suffix = " scrap",
        weight = 14, 
        ranges = { ma={0,10}, ec={0,10}, cs={0,10} },
        tile = 247, color = "0:6:1", 
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_ALLOY, tag = "SG" } },
        placement = {
            tags = [[ [LAVA][SPECIAL] ]], 
            specs = { { target="GROUP:median structure", type="CLUSTER", prob=100 } }
        }
    },

    -- =======================================================
    -- OTHER
    -- =======================================================
    {
        name = "advanced machinery",
        stone_suffix = " scrap",
        weight = 12, 
        ranges = { ma={0,40}, ec={40,80}, cs={40,80} },
        tile = 15, color = "7:0:1", 
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:basic machinery", type="CLUSTER_SMALL", prob=100 },
            },
            tags = [[ ]]
        }
    },
    {
        name = "basic machinery",
        stone_suffix = " scrap",
        weight = 15,
        ranges = { ma={25,40}, ec={10,40}, cs={10,40} }, 
        caps = { ma = 40, ec = 40, cs = 40 },
        tile = 15, color = "7:0:0", 
        placement = { mode = "layer", tags = [[ [METAMORPHIC][SEDIMENTARY] ]] }
    },
    {
        name = "structural scaffolding",
        stone_suffix = " scrap",
        weight = 15,
        ranges = { ma={15,24}, ec={10,24}, cs={10,24} }, 
        caps = { ma = 25, ec = 25, cs = 25 },
        tile = 035, color = "7:0:0",
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:light structure", type="CLUSTER", prob=50 },
                { target="GROUP:median structure", type="CLUSTER", prob=50 },
                { target="GROUP:heavy structure",   type="CLUSTER", prob=50 },
                { target="GROUP:plastcrete",   type="CLUSTER", prob=100 },
            },
            tags = [[ ]]
		}
    },
    {
        name = "structural foundation",
        stone_suffix = " scrap",
        weight = 16, 
        ranges = { ma={11,14}, ec={11,14}, cs={11,14} }, 
        caps = { ma = 15, ec = 15, cs = 15 },
        tile = 079, color = "7:0:0", 
        placement = { 
            mode = "inclusion",
            specs = {
                { target="GROUP:light structure", type="CLUSTER", prob=100 },
                { target="GROUP:median structure", type="CLUSTER", prob=100 },
                { target="GROUP:heavy structure",   type="CLUSTER", prob=100 },
                { target="GROUP:plastcrete",   type="CLUSTER", prob=100 },
            },
            tags = [[ ]]
		}
    },
	
    {
        name = "meta-mineral",
        stone_suffix = " chunk",
        weight = 10, 
        ranges = { ma={11,24}, ec={11,24}, cs={11,24} }, 
        tile = 177, 
        color = "7:7:1", 
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:plastcrete", type="VEIN", prob=100 },
                { target="GROUP:native stone", type="VEIN", prob=100 },
            },
            tags = [[ ]]
        }
    }, 
    {
        name = "meta-crystal",
        stone_suffix = " chunk",
        weight = 10, 
        ranges = { ma={25,39}, ec={25,39}, cs={25,39} },
        tile = 015, 
        color = "7:7:1", 
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:meta-mineral", type="CLUSTER_SMALL", prob=100 },
                { target="GROUP:plastcrete", type="CLUSTER_ONE", prob=100 },
                { target="GROUP:native stone", type="CLUSTER_ONE", prob=100 },
            },
            tags = [[ ]]
        }
    }
}

-- ============================================================================
-- GEM MATERIAL CONFIGURATION
-- ============================================================================
local GEM_MATERIALS = {
    {
        name = "holomachinery",
        stone_suffix = "", 
        weight = 15,
        ranges = { ma={0,30}, ec={0,30}, cs={71,100} },
        tile = 042, 
        color = "7:8:1", 
        is_gem = true,
        gem_name = "holomachine",
        gem_plural = "holomachines",
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_HARDLIGHT, tag = "HL" } }, 
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:computing bank", type="CLUSTER_SMALL", prob=100 },
                { target="GROUP:computing terminal", type="CLUSTER_SMALL", prob=100 }
            },
            tags = [[  ]]
        }
    },
    {
        name = "holoscreen",
        stone_suffix = "",
        weight = 20,
        ranges = { ma={0,30}, ec={0,30}, cs={50,69} },
        tile = 248,
        color = "7:8:1", 
        is_gem = true,
        gem_name = "holoscreen",
        gem_plural = "holoscreens",
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_HARDLIGHT, tag = "HL" } },
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:computing cabling", type="CLUSTER_SMALL", prob=100 },
                { target="GROUP:computing filament", type="CLUSTER_SMALL", prob=100 }
            },
            tags = [[  ]]
        }
    },
    {
        name = "holocrystal",
        stone_suffix = "",
        weight = 10, 
        ranges = { ma={0,30}, ec={0,30}, cs={81,100} },
        tile = 009, 
        color = "7:8:1", 
        is_gem = true,
        gem_name = "holocrystal",
        gem_plural = "holocrystals",
        resource_swaps = { { target = RES_COMPUTE, replace_with = RES_HARDLIGHT, tag = "HL" } },
        placement = {
            mode = "inclusion",
            specs = {
                { target="GROUP:computing bank", type="CLUSTER_ONE", prob=50 } 
            },
            tags = [[  ]]
        }
    }
}

-- ============================================================================
-- GENERATOR LOGIC
-- ============================================================================

if not do_once_early then do_once_early = {} end

local function run_megastructure_gen()
    -- TOGGLE CHECK: Exit early if system is disabled
    if not ENABLE_GENERATION then
        if _G.log then _G.log("MEGASTRUCT_LOG: Generation skipped (System Disabled).") end
        return 
    end

    if not random_object_parameters.pre_gen_randoms then return end

    if _G.log then _G.log("MEGASTRUCT_LOG: Starting generation (Hierarchical Registration)...") end

    local GENERATION_POOL = {}
    for _, v in ipairs(MAIN_MATERIALS) do table.insert(GENERATION_POOL, v) end
    for _, v in ipairs(GEM_MATERIALS) do table.insert(GENERATION_POOL, v) end

    local generated_objects = {} 
    local generated_groups = {}  
    local generated_types = {}   
    local generated_counts = {}  
    local generated_signatures = {} 

    local function pick_weighted_definition(source_table)
        local total_weight = 0
        for _, def in ipairs(source_table) do
            total_weight = total_weight + (def.weight or 1)
        end
        local roll = trandom(total_weight)
        local current = 0
        for _, def in ipairs(source_table) do
            current = current + (def.weight or 1)
            if roll < current then return def end
        end
        return source_table[#source_table] 
    end

    local function create_raw_object(def, resource_list, nm)
        local entry = {}
        local id_parts = {}
        local total_yield = 0
        for _, res in ipairs(resource_list) do 
            table.insert(id_parts, res.tag .. res.val) 
            total_yield = total_yield + res.val
        end
        if nm and nm > 0 then 
            total_yield = total_yield + nm 
            table.insert(id_parts, "NM" .. nm)
        end
        
        local id_string = "ID-" .. table.concat(id_parts, "-")
        local full_name = def.name .. " " .. id_string
        local new_token = string.upper(full_name:gsub("[ %-]", "_"))

        table.insert(entry, "[INORGANIC:" .. new_token .. "]")
        
        if _G.add_generated_info then
            _G.add_generated_info(entry)
        else
            table.insert(entry, "[GENERATED]")
        end

        table.insert(entry, "[USE_MATERIAL_TEMPLATE:STONE_TEMPLATE]")
        
        if def.is_gem then
            local gem_plural = def.gem_plural or "STP"
            table.insert(entry, "[IS_GEM:" .. def.gem_name .. ":" .. gem_plural .. ":OVERWRITE_SOLID]")
            local mat_value = math.max(1, total_yield)
            table.insert(entry, "[MATERIAL_VALUE:" .. mat_value .. "]")
        else
            local stone_suffix = def.stone_suffix or " scrap"
            table.insert(entry, "[STONE_NAME:" .. def.name .. stone_suffix .. " " .. id_string .. "]")
            table.insert(entry, "[STATE_NAME_ADJ:ALL_SOLID:" .. full_name .. "]")
            local mat_value = math.max(1, math.floor(total_yield / 3))
            table.insert(entry, "[MATERIAL_VALUE:" .. mat_value .. "]") 
        end
        
        table.insert(entry, "[DISPLAY_COLOR:" .. def.color .. "]")
        table.insert(entry, "[TILE:" .. def.tile .. "]")

        -- Density calculation: Alloy (MT) * 100 + 100
        local density_val = 0
        for _, res in ipairs(resource_list) do
             if res.tag == "MT" then
                 density_val = res.val
                 break
             end
        end
        -- Fallback for N-mass or High Density items which suppress normal resources but have nm value
        if density_val == 0 and nm > 0 then 
            density_val = nm 
        end
        
        local calculated_density = (density_val * 100) + 100
        table.insert(entry, "[SOLID_DENSITY:" .. calculated_density .. "]")

        table.insert(entry, "[MELTING_POINT:11485]")

        for _, res in ipairs(resource_list) do
            if res.val > 0 then table.insert(entry, "[METAL_ORE:" .. res.id .. ":" .. res.val .. "]") end
        end
        if nm > 0 then table.insert(entry, "[METAL_ORE:" .. RES_BIO .. ":" .. nm .. "]") end
        
        local placement_rule = def.placement
        if placement_rule and placement_rule.tags then
            if type(placement_rule.tags) == "string" then
                for line in placement_rule.tags:gmatch("[^\r\n]+") do
                    local clean = line:match("^%s*(.-)%s*$")
                    if clean and #clean > 0 then table.insert(entry, clean) end
                end
            elseif type(placement_rule.tags) == "table" then
                for _, tag in ipairs(placement_rule.tags) do
                    if string.find(tag, "%[") then
                        table.insert(entry, tag)
                    else
                        table.insert(entry, "[" .. tag .. "]")
                    end
                end
            end
        end

        if not generated_groups[def.name] then generated_groups[def.name] = {} end
        table.insert(generated_groups[def.name], new_token)
        generated_types[def.name] = true

        return { 
            token = new_token, 
            name = def.name, 
            lines = entry, 
            placement = placement_rule
        }
    end

    local function generate_cycle(force_def_name, source_table)
        local def
        local table_to_use = source_table or GENERATION_POOL
        local max_retries = 100
        local retries = 0
        local success = false
        
        -- Temporary state to hold stats during roll verification
        local final_ma, final_ec, final_cs, final_nm, final_resources

        while retries < max_retries do
            if force_def_name then
                for _, d in ipairs(table_to_use) do
                    if d.name == force_def_name then def = d; break end
                end
                if not def then break end 
            else
                def = pick_weighted_definition(table_to_use)
            end

            if not def then break end

            local r = def.ranges or {ma={0,0}, ec={0,0}, cs={0,0}}
            local pct_ma = random_in_range(r.ma[1], r.ma[2])
            local pct_ec = random_in_range(r.ec[1], r.ec[2])
            local pct_cs = random_in_range(r.cs[1], r.cs[2])

            if def.caps then
                if def.caps.ec then pct_ec = math.min(pct_ec, def.caps.ec) end
                if def.caps.cs then pct_cs = math.min(pct_cs, def.caps.cs) end
                if def.caps.ma then pct_ma = math.min(pct_ma, def.caps.ma) end
            end
            
            -- Step 1: Pre-calculate the result of transformation logic
            local resources = {}
            local pct_nm = 0
            
            if pct_ma > 90 and pct_ec > 90 and pct_cs > 90 then
                pct_nm = math.max(pct_ma, pct_ec, pct_cs)
                resources = {} -- Suppress primary stats for N-mass
            else
                pct_nm = (trandom(100) < 5) and (trandom(10) + 1) or 0
                resources = {
                    { id = RES_ALLOY, val = pct_ma, tag = "MT" },
                    { id = RES_ENERGY, val = pct_ec, tag = "EC" },
                    { id = RES_COMPUTE, val = pct_cs, tag = "CS" }
                }
            end

            -- Step 2: Apply swaps before signature check so specific variants are unique
            if def.resource_swaps then
                for _, swap in ipairs(def.resource_swaps) do
                    for _, res in ipairs(resources) do
                        if res.id == swap.target then
                            res.id = swap.replace_with
                            res.tag = swap.tag
                        end
                    end
                end
            end

            -- Step 3: Generate the identity signature based on the final ID parts
            local sig_parts = {}
            for _, res in ipairs(resources) do table.insert(sig_parts, res.tag .. res.val) end
            if pct_nm > 0 then table.insert(sig_parts, "NM" .. pct_nm) end
            
            local signature = def.name .. "_" .. table.concat(sig_parts, "_")
            
            if not generated_signatures[signature] then
                generated_signatures[signature] = true
                final_nm = pct_nm
                final_resources = resources
                success = true
                break 
            else
                retries = retries + 1
            end
        end
        
        if success then
            generated_counts[def.name] = (generated_counts[def.name] or 0) + 1
            table.insert(generated_objects, create_raw_object(def, final_resources, final_nm))
        end
    end

    -- Initial generation
    for i = 1, NUM_TO_GENERATE do generate_cycle(nil, GENERATION_POOL) end
    
    -- Guarantee Pass for base types
    local extra_idx = NUM_TO_GENERATE + 1
    for _, def in ipairs(MAIN_MATERIALS) do
        if not generated_types[def.name] then generate_cycle(def.name, MAIN_MATERIALS); extra_idx = extra_idx + 1 end
    end
    for _, def in ipairs(GEM_MATERIALS) do
        if not generated_types[def.name] then generate_cycle(def.name, GEM_MATERIALS); extra_idx = extra_idx + 1 end
    end

    -- ========================================================================
    -- HIERARCHICAL REGISTRATION PASS
    -- ========================================================================
    local layer_lines = {}
    local inclusion_lines = {}

    local layers = {}
    local inclusions = {}
    
    for _, obj in ipairs(generated_objects) do
        if obj.placement and obj.placement.specs then
            table.insert(inclusions, obj)
        else
            table.insert(layers, obj)
        end
    end

    for _, obj in ipairs(layers) do
        if not obj.placement or (not obj.placement.tags and not obj.placement.specs) then
            table.insert(obj.lines, "[ENVIRONMENT:ALL_STONE:CLUSTER:100]")
            table.insert(obj.lines, "[ENVIRONMENT:ALL_STONE:VEIN:100]")
        end
        for _, l in ipairs(obj.lines) do table.insert(layer_lines, l) end
    end

    for _, obj in ipairs(inclusions) do
        local rule = obj.placement
        if rule and rule.mode == "inclusion" and rule.specs then
            for _, spec in ipairs(rule.specs) do
                local group_prefix = "GROUP:"
                if string.sub(spec.target, 1, #group_prefix) == group_prefix then
                    local group_name = string.sub(spec.target, #group_prefix + 1)
                    local target_ids = generated_groups[group_name]
                    if target_ids then
                        for _, target_id in ipairs(target_ids) do
                            table.insert(obj.lines, string.format("[ENVIRONMENT_SPEC:%s:%s:%d]", target_id, spec.type, spec.prob))
                        end
                    end
                else
                    table.insert(obj.lines, string.format("[ENVIRONMENT_SPEC:%s:%s:%d]", spec.target, spec.type, spec.prob))
                end
            end
        end
        for _, l in ipairs(obj.lines) do table.insert(inclusion_lines, l) end
    end

    if _G.raws and _G.raws.register_inorganics then
        if #layer_lines > 0 then
            _G.raws.register_inorganics(layer_lines)
            if _G.log then _G.log("MEGASTRUCT_LOG: Registered Layers.") end
        end
        if #inclusion_lines > 0 then
            _G.raws.register_inorganics(inclusion_lines)
            if _G.log then _G.log("MEGASTRUCT_LOG: Registered Inclusions.") end
        end
    end
end

do_once_early.megastructure_gen = run_megastructure_gen

-- #region Standalone Execution
if arg and arg[0] then
    math.randomseed(os.time())
    _G.log = function(...) print("LOG:", ...) end
    _G.add_generated_info = function(tbl) table.insert(tbl, "[GENERATED]") end
    _G.trandom = function(n) return math.random(0, n - 1) end
    _G.random_object_parameters = { pre_gen_randoms = true }
    _G.raws = {
        register_inorganics = function(lines)
            local filename = "generated_megastructure.txt"
            local f = io.open(filename, "a")
            if f then
                f:write("\n\n-- NEW REGISTRATION BATCH --\n\n[OBJECT:INORGANIC]\n\n")
                for _, line in ipairs(lines) do f:write(line .. "\n") end
                f:close()
                print("SUCCESS: Appended " .. #lines .. " lines to " .. filename)
            end
        end
    }
    local f = io.open("generated_megastructure.txt", "w")
    if f then f:write("megastructure_inorganics\n"); f:close() end
    if do_once_early.megastructure_gen then do_once_early.megastructure_gen() end
end