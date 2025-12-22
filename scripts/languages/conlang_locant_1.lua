
local is_forbidden = require("filter")

languages.GEN_LOCANT_1 = function()

    local words_end_in_vowel_chance = 10

    local common_vowel = { "a", "e", "i", "o" }
    local medium_vowel = { "u" }
    local rare_vowel = {}


    local common_vowel_pair = { "ou", "ea", "ai", "ee", "oo" }
    local medium_vowel_pair = { "oi", "ie", "ay" }
    local rare_vowel_pair = {}


    local common_first_only_vowel_pair = {}
    local medium_first_only_vowel_pair = {}
    local rare_first_only_vowel_pair = {}

    local common_middle_only_vowel_pair = {}
    local medium_middle_only_vowel_pair = {}
    local rare_middle_only_vowel_pair = {}

    local common_end_only_vowel_pair = { "y" } 
    local medium_end_only_vowel_pair = {}
    local rare_end_only_vowel_pair = {}


    local common_consonant = { "t", "n", "s", "h", "r", "d", "l" }
    local medium_consonant = { "m", "w", "f", "g", "p", "b" }
    local rare_consonant = { "v", "k", "j" }


    local common_first_only = { "th", "sh", "ch", "wh" }
    local medium_first_only = { "pr", "br", "tr", "dr", "gr", "cr" }
    local rare_first_only = { "pl", "bl", "cl", "gl", "sp", "st", "sm", "sn", "sw" }

 
    local common_middle_only = { "ll", "ss", "tt", "ff", "mm", "nn", "pp", "rr" }
    local medium_middle_only = { "st", "sp", "sk", "nd", "nt", "mp" }
    local rare_middle_only = {}

 
    local common_end_only_consonant = {"s", "d", "t", "n", "r", "l", "y"}
    local medium_end_only_consonant = {"th", "sh", "ch", "ng", "nd", "nt", "ck"}
    local rare_end_only_consonant = {"m", "p"}



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

    -- Selects a random item from three tiers with an 80/15/5 probability split.
    local function pick_from_tiers(common_tbl, medium_tbl, rare_tbl)
        local roll = trandom(20) -- 0-19

        if roll < 16 then -- Try common first (80% chance)
            if #common_tbl > 0 then return pick_random(common_tbl) end
        elseif roll < 19 then -- Try medium next (15% chance)
            if #medium_tbl > 0 then return pick_random(medium_tbl) end
        else -- Try rare last (5% chance)
            if #rare_tbl > 0 then return pick_random(rare_tbl) end
        end

        -- Fallback if the chosen tier was empty.
        if #common_tbl > 0 then return pick_random(common_tbl) end
        if #medium_tbl > 0 then return pick_random(medium_tbl) end
        if #rare_tbl > 0 then return pick_random(rare_tbl) end

        return ""
    end

    -- Selects a random vowel or vowel pair, respecting positional rules.
    local function get_vowel(position)
        if one_in(5) then -- Lowered chance of vowel pairs for more consistency
            if position == 'initial' then
                local common_pool = table_merge(common_vowel_pair, common_first_only_vowel_pair)
                local medium_pool = table_merge(medium_vowel_pair, medium_first_only_vowel_pair)
                local rare_pool = table_merge(rare_vowel_pair, rare_first_only_vowel_pair)
                return pick_from_tiers(common_pool, medium_pool, rare_pool)
            elseif position == 'middle' then
                local common_pool = table_merge(common_vowel_pair, common_middle_only_vowel_pair)
                local medium_pool = table_merge(medium_vowel_pair, medium_middle_only_vowel_pair)
                local rare_pool = table_merge(rare_vowel_pair, rare_middle_only_vowel_pair)
                return pick_from_tiers(common_pool, medium_pool, rare_pool)
            else -- 'final' position
                local common_pool = table_merge(common_vowel_pair, common_end_only_vowel_pair)
                local medium_pool = table_merge(medium_vowel_pair, medium_end_only_vowel_pair)
                local rare_pool = table_merge(rare_vowel_pair, rare_end_only_vowel_pair)
                return pick_from_tiers(common_pool, medium_pool, rare_pool)
            end
        else
            -- Default to a single vowel.
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
            -- **REFINED**: Final consonants are now ONLY from the end_only lists for stricter control.
            return pick_from_tiers(common_end_only_consonant, medium_end_only_consonant, rare_end_only_consonant)
        else -- 'middle' position
            return pick_from_tiers(common_consonant, medium_consonant, rare_consonant)
        end
    end

    -- Selects a middle-only consonant using the three-tiered system.
    local function get_middle_only_consonant()
        return pick_from_tiers(common_middle_only, medium_middle_only, rare_middle_only)
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

    local gen_locant1 = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = "" -- Reset string for each attempt
            local ends_in_vowel = (trandom(100) < words_end_in_vowel_chance)
            local has_middle_part = (trandom(2) == 1)

            -- STEP 1: Build the first syllable (V or CV).
            if trandom(2) ~= 0 then
                str = str .. get_consonant('initial')
                if not has_middle_part and ends_in_vowel then
                    str = str .. get_vowel('final')
                else
                    str = str .. get_vowel('initial')
                end
            else -- Starts with V
                if not has_middle_part and ends_in_vowel then
                    str = str .. get_vowel('final')
                else
                    str = str .. get_vowel('initial')
                end
            end

            -- STEP 2: Add the middle part of the word if it's a longer word.
            if has_middle_part then
                if one_in(3) and (#common_middle_only > 0 or #medium_middle_only > 0 or #rare_middle_only > 0) then
                    str = str .. get_middle_only_consonant()
                else
                    str = str .. get_consonant('middle')
                end
                if ends_in_vowel then
                    str = str .. get_vowel('final')
                else
                    str = str .. get_vowel('middle')
                end
            end

            -- STEP 3: Add the final consonant if the word is not supposed to end in a vowel.
            if not ends_in_vowel then
                str = str .. get_consonant('final')
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_locant1[v.token] = str
    end

    return gen_locant1
end
