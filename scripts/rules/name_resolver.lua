local M = {}

---
--- Copies the pluralization logic from your engines to make this module self-contained.
---
local function create_plural_by_id(singular_name)
    local base, rest = singular_name:match("^(.-)( ID.*)$")
    if base and rest then
        return base .. "s" .. rest
    else
        return singular_name .. "s"
    end
end

---
--- Helper to check if any tag from a list exists in the creature's tags
---
local function has_any_tag(creature_tags, tags_to_check)
    if not creature_tags or not tags_to_check then return false end
    for _, creature_tag in ipairs(creature_tags) do
        for _, check_tag in ipairs(tags_to_check) do
            if creature_tag == check_tag then
                return true
            end
        end
    end
    return false
end

---
--- NEW HELPER: Checks if a specific size_key is in a list of required sizes
---
local function check_size(size_key, required_sizes)
    -- If the rule doesn't care about size, it passes
    if not required_sizes then return true end
    
    -- If the rule *does* care about size, but the creature has no size, it fails
    if not size_key then return false end
    
    for _, size in ipairs(required_sizes) do
        if size_key == size then
            return true -- Found a match
        end
    end
    
    return false -- No match found
end

---
--- Defines the naming rules for each archetype.
--- The 'priority_rules' table is an array.
--- We will check it in order, from index 1 onwards.
---
local name_rules = {
    BIOMACHINE = {
        priority_rules = {
            { -- Priority 1: Sophonts
                tags = {"SOPHONT", "DEVIANT", "VESSEL"},
                names = { singular = "bioroid ID", plural = "bioroids ID" }
            },
            { -- Priority 2: Large Weapons (NEW RULE)
                tags = {"WEAPON", "SERVANT", "MILITARY"},
                size_tags = {"HGE", "GNT", "TTN"}, -- This rule now *only* matches these sizes
                names = { singular = "bioframe ID", plural = "bioframes ID" }
            },
            { 
                tags = {
                    "DOMESTIC", "VEHICLE", "CARRIER", "NOMAD", "WEAPON", 
                    "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "COMPANION"
                },
                names = { singular = "biodrone ID", plural = "biodrones ID" }
            },
            { 
                tags = {
                    "AVATAR", "INCURSION"
                },
                names = { singular = "biodeity ID", plural = "biodeities ID" }
            },
            { 
                tags = {
                    "EXISTENTIAL"
                },
                names = { singular = "biocalamity ID", plural = "biocalamities ID" }
            }
        },
        DEFAULT_NAMES = { singular = "biomech ID", plural = "biomechs ID" }
	},
    DEMIMACHINE = {
        priority_rules = {
            {
                tags = {"SOPHONT", "DEVIANT", "VESSEL"},
                names = { singular = "demiroid ID", plural = "demiroids ID" }
            },
            { -- NEW RULE
                tags = {"WEAPON", "SERVANT", "MILITARY"},
                size_tags = {"HGE", "GNT", "TTN"},
                names = { singular = "demiframe ID", plural = "demiframes ID" }
            },
            {
                tags = {
                    "DOMESTIC", "VEHICLE", "CARRIER", "NOMAD", "WEAPON",
                    "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "COMPANION"
                },
                names = { singular = "demidrone ID", plural = "demidrones ID" }
            },
            { 
                tags = {
                    "AVATAR", "INCURSION"
                },
                names = { singular = "demideity ID", plural = "demideities ID" }
            },
            { 
                tags = {
                    "EXISTENTIAL"
                },
                names = { singular = "demicalamity ID", plural = "demicalamities ID" }
            }
        },
        DEFAULT_NAMES = { singular = "demimech ID", plural = "demimechs ID" }
    },
    CYBERMACHINE = {
        priority_rules = {
            {
                tags = {"SOPHONT", "DEVIANT", "VESSEL"},
                names = { singular = "cyberoid ID", plural = "cyberoids ID" }
            },
            { -- NEW RULE
                tags = {"WEAPON", "SERVANT", "MILITARY"},
                size_tags = {"HGE", "GNT", "TTN"},
                names = { singular = "cyberframe ID", plural = "cyberframes ID" }
            },
            {
                tags = {
                    "DOMESTIC", "VEHICLE", "CARRIER", "NOMAD", "WEAPON",
                    "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "COMPANION"
                },
                names = { singular = "cyberdrone ID", plural = "cyberdrones ID" }
            },
            { 
                tags = {
                    "AVATAR", "INCURSION"
                },
                names = { singular = "cyberdeity ID", plural = "cyberdeities ID" }
            },
            { 
                tags = {
                    "EXISTENTIAL"
                },
                names = { singular = "cybercalamity ID", plural = "cybercalamities ID" }
            }
        },
        DEFAULT_NAMES = { singular = "cybermech ID", plural = "cybermechs ID" },
	},
    NANOMACHINE = {
        priority_rules = {
            {
                tags = {"SOPHONT", "DEVIANT", "VESSEL"},
                names = { singular = "nanoroid ID", plural = "nanoroids ID" }
            },
            { -- NEW RULE
                tags = {"WEAPON", "SERVANT", "MILITARY"},
                size_tags = {"HGE", "GNT", "TTN"},
                names = { singular = "nanoframe ID", plural = "nanoframes ID" }
            },
            {
                tags = {
                    "DOMESTIC", "VEHICLE", "CARRIER", "NOMAD", "WEAPON",
                    "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "COMPANION"
                },
                names = { singular = "nanodrone ID", plural = "nanodrones ID" }
            },
            { 
                tags = {
                    "AVATAR", "INCURSION"
                },
                names = { singular = "nanodeity ID", plural = "nanodeities ID" }
            },
            { 
                tags = {
                    "EXISTENTIAL"
                },
                names = { singular = "nanocalamity ID", plural = "nanocalamities ID" }
            }
        },
        DEFAULT_NAMES = { singular = "nanomech ID", plural = "nanomechs ID" }
	},
    DEMIMACHINE = {
        priority_rules = {
            {
                tags = {"SOPHONT", "DEVIANT", "VESSEL"},
                names = { singular = "xenoroid ID", plural = "xenoroids ID" }
            },
            { -- NEW RULE
                tags = {"WEAPON", "SERVANT", "MILITARY"},
                size_tags = {"HGE", "GNT", "TTN"},
                names = { singular = "xenoframe ID", plural = "xenoframes ID" }
            },
            {
                tags = {
                    "DOMESTIC", "VEHICLE", "CARRIER", "NOMAD", "WEAPON",
                    "LABOR", "SERVANT", "HUNTER", "SANITATION", "PRODUCT", "COMPANION"
                },
                names = { singular = "xenodrone ID", plural = "xenodrones ID" }
            },
            { 
                tags = {
                    "AVATAR", "INCURSION"
                },
                names = { singular = "xenodeity ID", plural = "xenodeities ID" }
            },
            { 
                tags = {
                    "EXISTENTIAL"
                },
                names = { singular = "xenocalamity ID", plural = "xenocalamities ID" }
            }
        },
        DEFAULT_NAMES = { singular = "xenomech ID", plural = "xenomechs ID" }
    },
    EXCASTE = {
        priority_rules = {
            {
                tags = {"HOSTILE", "BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "VESSEL"},
                names = { singular = "outcaste ID", plural = "outcastes ID" }
            }
        },
        DEFAULT_NAMES = { singular = "excaste ID", plural = "excastes ID" }
    }
    
    -- You can add rules for other archetypes here in the future
    -- e.g., ALGOMACHINE = { ... }
}

---
--- Gets the base singular and plural names for a creature based on its rules.
--- @param config table The creature's config file
--- @param components table The creature's selected components
--- @return string base_singular, string base_plural
---
function M.get_base_names(config, components)
    local archetype = config.ARCHETYPE_CLASS
    local ruleset = name_rules[archetype]
    
    if not ruleset then
        -- No special rules for this archetype.
        -- Fall back to the default prefix in the config file.
        local singular = config.BASE_CREATURE_NAME_PREFIX
        local plural = create_plural_by_id(singular)
        return singular, plural
    end
    
    -- A ruleset exists. Apply the logic in order of priority.
    if ruleset.priority_rules then
        -- Loop through the rules in order of priority (1, 2, 3...)
        for _, rule in ipairs(ruleset.priority_rules) do
            
            -- Check 1: Do the rating tags match?
            -- If rule.tags is nil, we treat it as "any tag matches"
            local tags_match = (not rule.tags) or has_any_tag(components.creature_tags, rule.tags)
            
            -- Check 2: Do the size tags match?
            -- Get the creature's size key (e.g., "MDM", "HGE")
            local size_key = (components.size_variant and components.size_variant.name_part)
            -- If rule.size_tags is nil, we treat it as "any size matches"
            local size_match = check_size(size_key, rule.size_tags)
            
            -- Check 3: Do *both* conditions pass?
            if tags_match and size_match and rule.names then
                -- Found a match! Return these names and stop.
                return rule.names.singular, rule.names.plural
            end
        end
    end
    
    -- No priority rules matched (or none existed).
    -- Fall back to the archetype's default.
    if ruleset.DEFAULT_NAMES then
         return ruleset.DEFAULT_NAMES.singular, ruleset.DEFAULT_NAMES.plural
    else
        -- This is a safety fallback, though DEFAULT_NAMES should always exist.
        local singular = config.BASE_CREATURE_NAME_PREFIX
        local plural = create_plural_by_id(singular)
        return singular, plural
    end
end

return M