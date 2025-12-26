return {
    -- Mapping for shorthand names as requested for the ID system
    SHORT_NAMES = {
        STRENGTH = "STRONG",
        AGILITY = "AGILE",
        TOUGHNESS = "TOUGH",
        ENDURANCE = "ENDURE",
        RECUPERATION = "RECOVER",
        DISEASE_RESISTANCE = "DIS_RES",
        ANALYTICAL_ABILITY = "ANALYZE",
        FOCUS = "FOCUS",
        WILLPOWER = "WIL_PWR",
        CREATIVITY = "CREATIV",
        INTUITION = "INTUITN",
        PATIENCE = "PATIENC",
        MEMORY = "MEMORY",
        LINGUISTIC_ABILITY = "LNGUIST",
        SPATIAL_SENSE = "SPT_SNS",
        KINESTHETIC_SENSE = "KIN_SNS",
        MUSICALITY = "MUSIC",
        EMPATHY = "EMPATHY",
        SOCIAL_AWARENESS = "SOC_AWR",
        SPEED_PERC = "SPEED"
    },

    -- =========================================================================
    -- PHYSICAL ATTRIBUTES
    -- Generator Type: "PHYSICAL" -> Uses [CE_PHYS_ATT_CHANGE]
    -- =========================================================================
    {
        id = "AGILITY",             -- The DF Attribute Token
        type = "PHYSICAL",          -- Logic Type
        buff_name = "Agility",      -- Display Name
        buff_noun = "agility",      -- "enhances <noun>"
        short_name = "AGILE",
        
        id_prefix = "ENHANCEAGILITY",
        secret_prefix = "ENHANCEAGILITY",
        payload_prefix = "AGILITYENHANCE",
        
        verbs = {
            PRIMARY     = "extrude many small thruster rockets from all over your body:extrudes many small thruster rockets from all over their body:NA",
            SECONDARY   = "extrude multiple small thruster rockets from all over your body:extrudes multiple small thruster rockets from all over their body:NA",
            TERTIARY    = "extrude multiple small thruster rockets from parts of your body:extrudes multiple small thruster rockets from parts of their body:NA",
            QUATERNARY  = "extrude several small thruster rockets from parts of your body:extrudes several small thruster rockets from parts of their body:NA",
            QUINARY     = "extrude several small thruster rockets from the tips of your limbs:extrudes several small thruster rockets from the tips of their limbs:NA",
        }
    },
    {
        id = "ENDURANCE",
        type = "PHYSICAL",
        buff_name = "Endurance",
        buff_noun = "endurance",
        short_name = "ENDURE",
        
        id_prefix = "ENHANCEENDURANCE",
        secret_prefix = "ENHANCEENDURANCE",
        payload_prefix = "ENDURANCEENHANCE",
        
        verbs = {
            PRIMARY     = "emit massive amounts of heat exhaust and glow from your internal reactor:emits massive amounts of heat exhaust and glows from their internal reactor:NA",
            SECONDARY   = "emit large amounts of heat exhaust and a slight glow from your internal reactor:emits large amounts of heat exhaust and a slight glow from their internal reactor:NA",
            TERTIARY    = "emit large amounts of heat exhaust from your internal reactor:emits large amounts of heat exhaust from their internal reactor:NA",
            QUATERNARY  = "emit visible amounts of heat exhaust from your internal reactor:emits visible amounts of heat exhaust from their internal reactor:NA",
            QUINARY     = "emit faint amounts of heat exhaust from your internal reactor:emits faint amounts of heat exhaust from their internal reactor:NA",
        }
    },
    {
        id = "STRENGTH",
        type = "PHYSICAL",
        buff_name = "Strength",
        buff_noun = "strength",
        short_name = "STRONG",
        
        id_prefix = "ENHANCESTRENGTH",
        secret_prefix = "ENHANCESTRENGTH",
        payload_prefix = "STRENGTHENHANCE",
        
        verbs = {
            PRIMARY     = "are enveloped in grotesquely thick bundles of artificial muscle:is enveloped in grotesquely thick bundles of artificial muscle:NA",
            SECONDARY   = "are enveloped in thick bundles of artificial muscle:is enveloped in thick bundles of artificial muscle:NA",
            TERTIARY    = "are covered by a dense exterior of artificial muscle:is covered by a dense exterior of artificial muscle:NA",
            QUATERNARY  = "are covered by a thin exterior of artificial muscle:is covered by a thin exterior of artificial muscle:NA",
            QUINARY     = "are partially covered by a thin exterior of artificial muscle:is partially covered by a thin exterior of artificial muscle:NA",
        }
    },
    {
        id = "TOUGHNESS",
        type = "PHYSICAL",
        buff_name = "Toughness",
        buff_noun = "toughness",
        short_name = "TOUGH",
        
        id_prefix = "ENHANCETOUGHNESS",
        secret_prefix = "ENHANCETOUGHNESS",
        payload_prefix = "TOUGHNESSENHANCE",
        
        verbs = {
            PRIMARY     = "become covered by thick slabs of metal that obscure your original form:becomes covered by thick slabs of metal that obscures their original form:NA",
            SECONDARY   = "become covered by thick slabs of metal adhering to your body:becomes covered by thick slabs of metal adhering to their body:NA",
            TERTIARY    = "become covered by thin plates of metal adhering to your body:becomes covered by thin plates of metal adhering to their body:NA",
            QUATERNARY  = "become partially covered by thin plates of metal adhering to your body:becomes partially covered by thin plates of metal adhering to their body:NA",
            QUINARY     = "become partially covered by thin strips of metal adhering to your body:becomes partially covered by thin strips of metal adhering to their body:NA"
        }
    },

    -- =========================================================================
    -- MENTAL ATTRIBUTES
    -- Generator Type: "MENTAL" -> Uses [CE_MENT_ATT_CHANGE]
    -- =========================================================================
    {
        id = "ANALYTICAL_ABILITY",
        type = "MENTAL",
        buff_name = "Analytical Ability",
        buff_noun = "analytical ability",
        short_name = "ANALYZE",
        
        id_prefix = "ENHANCEANALYTICAL_ABILITY",
        secret_prefix = "ENHANCEANALYTICAL_ABILITY",
        payload_prefix = "ANALYTICAL_ABILITYENHANCE",
        
        verbs = {
            PRIMARY     = "overclock your data processing systems:twitches:NA",
            SECONDARY   = "accelerate your data processing systems:twitches:NA",
            TERTIARY    = "significantly enhance your data processing systems:twitches:NA",
            QUATERNARY  = "enhance your data processing systems:twitches:NA",
            QUINARY     = "slightly enhance your data processing systems:twitches:NA",
        }
    },
    {
        id = "INTUITION",
        type = "MENTAL",
        buff_name = "Intuition",
        buff_noun = "intuition",
        short_name = "INTUITN",
        
        id_prefix = "ENHANCEINTUITION",
        secret_prefix = "ENHANCEINTUITION",
        payload_prefix = "INTUITIONENHANCE",
        verbs = {
            PRIMARY     = "overclock your predictive systems:twitches:NA",
            SECONDARY   = "accelerate your predictive systems:twitches:NA",
            TERTIARY    = "significantly enhance your predictive systems:twitches:NA",
            QUATERNARY  = "enhance your predictive systems:twitches:NA",
            QUINARY     = "slightly enhance your predictive systems:twitches:NA",
        }
    },
    {
        id = "FOCUS",
        type = "MENTAL",
        buff_name = "Focus",
        buff_noun = "focus",
        short_name = "FOCUS",
        
        id_prefix = "ENHANCEFOCUS",
        secret_prefix = "ENHANCEFOCUS",
        payload_prefix = "FOCUSENHANCE",
        
        verbs = {
            PRIMARY     = "overclock your focusing systems:twitches:NA",
            SECONDARY   = "accelerate your focusing systems:twitches:NA",
            TERTIARY    = "significantly enhance your focusing systems:twitches:NA",
            QUATERNARY  = "enhance your focusing systems:twitches:NA",
            QUINARY     = "slightly enhance your focusing systems:twitches:NA",
        }
    },
    {
        id = "SPATIAL_SENSE",
        type = "MENTAL",
        buff_name = "Spatial Sense",
        buff_noun = "spatial sense",
        short_name = "SPT_SNS",
        
        id_prefix = "ENHANCESPATIAL_SENSE",
        secret_prefix = "ENHANCESPATIAL_SENSE",
        payload_prefix = "SPATIAL_SENSEENHANCE",
        verbs = {
            PRIMARY     = "overclock your spatial visualization systems:twitches:NA",
            SECONDARY   = "accelerate your spatial visualization systems:twitches:NA",
            TERTIARY    = "significantly enhance your spatial visualization systems:twitches:NA",
            QUATERNARY  = "enhance your spatial visualization systems:twitches:NA",
            QUINARY     = "slightly enhance your spatial visualization systems:twitches:NA",
        }
    },
    {
        id = "KINESTHETIC_SENSE",
        type = "MENTAL",
        buff_name = "Kinesthetic Sense",
        buff_noun = "kinesthetic sense",
        short_name = "KIN_SNS",
        
        id_prefix = "ENHANCEKINESTHETIC_SENSE",
        secret_prefix = "ENHANCEKINESTHETIC_SENSE",
        payload_prefix = "KINESTHETIC_SENSEENHANCE",
        verbs = {
            PRIMARY     = "overclock your kinetic analysis systems:twitches:NA",
            SECONDARY   = "accelerate your kinetic analysis systems:twitches:NA",
            TERTIARY    = "significantly enhance your kinetic analysis systems:twitches:NA",
            QUATERNARY  = "enhance your kinetic analysis systems:twitches:NA",
            QUINARY     = "slightly enhance your kinetic analysis systems:twitches:NA",
        }
    },

    -- =========================================================================
    -- SPEED
    -- Generator Type: "SPEED" -> Uses [CE_SPEED_CHANGE]
    -- =========================================================================
    {
        id = "SPEED_PERC", 
        type = "SPEED",
        buff_name = "Speed",
        buff_noun = "speed",
        short_name = "SPEED",
        
        id_prefix = "ENHANCESPEED",
        secret_prefix = "ENHANCESPEED",
        payload_prefix = "SPEEDENHANCE",
        
        verbs = {
            PRIMARY     = "extrude multiple large thruster rockets on the back and limbs of your body:extrudes multiple large thruster rockets on the back and limbs of their body:NA",
            SECONDARY   = "extrude several large thruster rockets on the back and limbs of your body:extrudes several large thruster rockets on the back and limbs of their body:NA",
            TERTIARY    = "extrude several large thruster rockets on the back your body:extrudes several large thruster rockets on the back of their body:NA",
            QUATERNARY  = "extrude a large thruster rocket on the back your body:extrudes a large thruster rocket on the back of their body:NA",
            QUINARY     = "extrude a small thruster rocket on the back your body:extrudes a small thruster rocket on the back of their body:NA",
        }
    }
}