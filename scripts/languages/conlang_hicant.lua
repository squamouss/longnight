
local is_forbidden = require("filter")

languages.GEN_HICANT = function()

    local words_end_in_vowel_chance = 35 
	
    local common_vowel = { "a", "e", "i" }
    local medium_vowel = { "o", "u" }
    local rare_vowel = {}

    local common_vowel_pair = { "au", "ea" }
    local medium_vowel_pair = { "ai", "ei" }
    local rare_vowel_pair = { "ae", "oe" }

    local common_consonant = { "t", "n", "s", "r", "d", "l", "k", "p", "m" }
    local medium_consonant = { "c", "g", "b", "v", "h", "sh", "th", "ph", "bh", "dh", "gh" }
    local rare_consonant = { "q", "x", "j" }

    local common_first_only = { "pr", "tr", "st", "gr", "dr" }
    local medium_first_only = { "cl", "cr", "pl", "br", "sp" }
    local rare_first_only = { "shr", "sk" }

    local common_middle_only = { "ss", "ll", "nd", "nt", "st" }
    local medium_middle_only = { "ct", "pt", "mb", "rg" }
    local rare_middle_only = {}

    local common_end_only_consonant = {"s", "m", "n", "d", "t"}
    local medium_end_only_consonant = {"r", "l", "th"}
    local rare_end_only_consonant = {"h"} 


    local function table_merge(...)
        local new_tbl = {}
        for i = 1, select('#', ...) do
            local tbl = select(i, ...)
            for _, v in ipairs(tbl) do
                table.insert(new_tbl, v)
            end
        end
        return new_tbl
    end

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

    -- Selects a random vowel or vowel pair.
    local function get_vowel()
        if one_in(5) then
            return pick_from_tiers(common_vowel_pair, medium_vowel_pair, rare_vowel_pair)
        else
            return pick_from_tiers(common_vowel, medium_vowel, rare_vowel)
        end
    end

    -- Selects a consonant for initial, middle, or final positions.
    local function get_consonant(position)
        if position == 'initial' then
            local common_pool = table_merge(common_consonant, common_first_only)
            local medium_pool = table_merge(medium_consonant, medium_first_only)
            local rare_pool = table_merge(rare_consonant, rare_first_only)
            return pick_from_tiers(common_pool, medium_pool, rare_pool)
        elseif position == 'final' then
            -- Final consonants are common.
            local common_pool = table_merge(common_end_only_consonant)
            local medium_pool = table_merge(medium_end_only_consonant)
            local rare_pool = table_merge(rare_end_only_consonant)
            return pick_from_tiers(common_pool, medium_pool, rare_pool)
        elseif position == 'middle_only' then
             return pick_from_tiers(common_middle_only, medium_middle_only, rare_middle_only)
        else -- 'middle'
            return pick_from_tiers(common_consonant, medium_consonant, rare_consonant)
        end
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

    local gen_hicant = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = "" -- Reset string for each attempt
            local ends_in_vowel = (trandom(100) < words_end_in_vowel_chance)
            local has_middle_part = (trandom(2) == 1)

            -- STEP 1: Build the first syllable (V or CV).
            if one_in(5) then -- Start with a vowel
                str = str .. get_vowel()
            else -- Start with a consonant
                str = str .. get_consonant('initial')
                str = str .. get_vowel()
            end

            -- STEP 2: Add the middle part of the word if it's a longer word.
            if has_middle_part then
                if one_in(3) then
                    str = str .. get_consonant('middle_only')
                else
                    str = str .. get_consonant('middle')
                end
                str = str .. get_vowel()
            end

            -- STEP 3: Add the final consonant if the word is not supposed to end in a vowel.
            if not ends_in_vowel then
                str = str .. get_consonant('final')
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_hicant[v.token] = str
    end

    return gen_hicant
end
