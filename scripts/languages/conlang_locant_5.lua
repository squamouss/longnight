
local is_forbidden = require("filter")

languages.GEN_LOCANT_5 = function()

    local words_end_in_vowel_chance = 50

    local common_vowel = { "a", "i", "u" }
    local medium_vowel = { "e", "o" }
    local rare_vowel = {}

    local common_vowel_pair = { "ai", "au" }
    local medium_vowel_pair = { "ia", "ua" }
    local rare_vowel_pair = {}

    local common_consonant = { "t", "n", "k", "s", "r", "d", "l", "m", "p", "g", "b", "y", "w" }
    local medium_consonant = { "th", "kh", "bh", "dh", "gh", "ph", "j", "h", "ch" }
    local rare_consonant = {}

    local common_first_only = { "pr", "tr", "kr", "dr", "gr", "br" }
    local medium_first_only = { "sw", "sy", "dw", "dy" }
    local rare_first_only = {}

    local common_middle_only = { "nn", "mm", "ll", "ss", "tt", "kk" }
    local medium_middle_only = { "ng", "nt", "nd", "mp", "mb" }
    local rare_middle_only = {}

    local common_end_only_consonant = {"n", "m", "ng"}
    local medium_end_only_consonant = {"p", "t", "k"}
    local rare_end_only_consonant = {}

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

    local function pick_from_tiers(common_tbl, medium_tbl, rare_tbl)
        local roll = trandom(10) -- 0-9

        if roll < 5 then 
            if #common_tbl > 0 then return pick_random(common_tbl) end
        elseif roll < 8 then 
            if #medium_tbl > 0 then return pick_random(medium_tbl) end
        else 
            if #rare_tbl > 0 then return pick_random(rare_tbl) end
        end

        if #common_tbl > 0 then return pick_random(common_tbl) end
        if #medium_tbl > 0 then return pick_random(medium_tbl) end
        if #rare_tbl > 0 then return pick_random(rare_tbl) end

        return ""
    end

    local function get_vowel()
        if one_in(6) then 
            return pick_from_tiers(common_vowel_pair, medium_vowel_pair, rare_vowel_pair)
        else
            return pick_from_tiers(common_vowel, medium_vowel, rare_vowel)
        end
    end

    local function get_consonant(position)
        if position == 'initial' then
            local common_pool = table_merge(common_consonant, common_first_only)
            local medium_pool = table_merge(medium_consonant, medium_first_only)
            local rare_pool = table_merge(rare_consonant, rare_first_only)
            return pick_from_tiers(common_pool, medium_pool, rare_pool)
        elseif position == 'final' then
            -- Final consonants are STRICTLY from the end_only lists.
            return pick_from_tiers(common_end_only_consonant, medium_end_only_consonant, rare_end_only_consonant)
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

    local gen_locant5 = {}
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

        gen_locant5[v.token] = str
    end

    return gen_locant5
end
