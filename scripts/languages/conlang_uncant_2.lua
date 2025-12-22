
local is_forbidden = require("filter")

languages.GEN_UNCANT_2 = function()

    local words_end_in_vowel_chance = 20

    local common_vowel = { "u", "a" }
    local medium_vowel = { "o" }
    local rare_vowel = { "i" }

    local common_consonant = { "k", "g", "r" }
    local medium_consonant = { "kh", "gh", "t", "d" }
    local rare_consonant = { "b", "s" }

    local common_end_only_consonant = {"k", "g"}
    local medium_end_only_consonant = {"t", "d"}
    local rare_end_only_consonant = {"r"}


    -- Selects a random item from three tiers based on a 50/30/20 probability split.
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

    -- Selects a random vowel.
    local function get_vowel()
        return pick_from_tiers(common_vowel, medium_vowel, rare_vowel)
    end

    -- Selects a consonant.
    local function get_consonant()
        return pick_from_tiers(common_consonant, medium_consonant, rare_consonant)
    end

    -- Selects a final consonant.
    local function get_final_consonant()
        return pick_from_tiers(common_end_only_consonant, medium_end_only_consonant, rare_end_only_consonant)
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

    local gen_uncant2 = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = "" -- Reset string for each attempt
            local ends_in_vowel = (trandom(100) < words_end_in_vowel_chance)
            local has_middle_part = (trandom(2) == 1)

            -- STEP 1: Build the first syllable (always CV).
            str = str .. get_consonant() .. get_vowel()

            -- STEP 2: Add a second syllable if it's a longer word.
            if has_middle_part then
                str = str .. get_consonant() .. get_vowel()
            end

            -- STEP 3: Add a final consonant if needed.
            if not ends_in_vowel then
                str = str .. get_final_consonant()
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_uncant2[v.token] = str
    end

    return gen_uncant2
end
