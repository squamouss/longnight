
local is_forbidden = require("filter")

languages.GEN_UNCANT_3 = function()

    local common_vowel = { "i", "e" }
    local medium_vowel = { "a" }
    local rare_vowel = {}

    local common_consonant = { "s", "z" }
    local medium_consonant = { "t", "p", "h" }
    local rare_consonant = { "k" }

    local common_first_only = {}
    local medium_first_only = {}
    local rare_first_only = {}

    local common_middle_only = {}
    local medium_middle_only = {}
    local rare_middle_only = {}

    local common_end_only_consonant = {}
    local medium_end_only_consonant = {}
    local rare_end_only_consonant = {}

    local function pick_from_tiers(common_tbl, medium_tbl, rare_tbl)
        local roll = trandom(10) -- 0-9

        if roll < 5 then -- Try common first (50% chance)
            if #common_tbl > 0 then return pick_random(common_tbl) end
        elseif roll < 8 then -- Try medium next (30% chance)
            if #medium_tbl > 0 then return pick_random(medium_tbl) end
        else -- Try rare last (20% chance)
            if #rare_tbl > 0 then return pick_random(rare_tbl) end
        end

        -- Fallback if the chosen tier was empty.
        if #common_tbl > 0 then return pick_random(common_tbl) end
        if #medium_tbl > 0 then return pick_random(medium_tbl) end
        if #rare_tbl > 0 then return pick_random(rare_tbl) end

        return ""
    end
	
	-- Checks if a word has more than one set of doubled characters.
local function has_valid_doubles(word)
    local double_count = 0
    for i = 1, string.len(word) - 1 do
        if word:sub(i, i) == word:sub(i + 1, i + 1) then
            double_count = double_count + 1
        end
    end
    return double_count <= 1
end

    -- Selects a random vowel.
    local function get_vowel()
        return pick_from_tiers(common_vowel, medium_vowel, rare_vowel)
    end

    -- Selects a consonant.
    local function get_consonant()
        return pick_from_tiers(common_consonant, medium_consonant, rare_consonant)
    end

    local gen_uncant3 = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = "" -- Reset string for each attempt
            local has_middle_part = (trandom(2) == 1)

            -- STEP 1: Build the first syllable (V or CV).
            local first_syllable = ""
            if one_in(5) then -- 20% chance to start with a vowel
                first_syllable = get_vowel()
            else
                first_syllable = get_consonant() .. get_vowel()
            end
            str = first_syllable

            -- STEP 2: Add a second syllable if it's a longer word.
            if has_middle_part then
                -- 25% chance to repeat the first syllable (reduplication)
                if one_in(4) then
                    str = str .. first_syllable
                else
                    -- Otherwise, add a new CV syllable.
                    str = str .. get_consonant() .. get_vowel()
                end
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_uncant3[v.token] = str
    end

    return gen_uncant3
end
