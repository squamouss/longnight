local is_forbidden = require("filter")

languages.GEN_POSTCANT_3 = function()

    local words_end_in_vowel_chance = 15 -- Low chance, favors buzzing/hissing endings

    -- VOWELS: Focused on 'e' (sharp/buzzing) and 'u' (menacing/low)
    local common_vowel = { "e", "i" }
    local medium_vowel = { "u", "ae" }
    local rare_vowel = { "ee", "ie" } 

    -- VOWEL PAIRS: Alien diphthongs
    local common_vowel_pair = { "ei", "eu" }
    local medium_vowel_pair = { "ue", "ia" }
    local rare_vowel_pair = { "oe", "eo" }

    -- CONSONANTS (General): Focused on j, v, h, z (The "Buzz" group)
    local common_consonant = { "j", "v", "h", "z" }
    local medium_consonant = { "x", "sh", "zh" } -- Harsh fricatives
    local rare_consonant = { "k", "g", "th" }    -- Hard stops used sparingly

    -- INITIAL CLUSTERS: Breathy starts
    local common_first_only = { "vh", "jh", "hv", "zh" }
    local medium_first_only = { "zv", "xh", "sv" }
    local rare_first_only = { "kh", "gh" }

    -- MIDDLE CLUSTERS: Sustained buzzing (doubles allowed here)
    local common_middle_only = { "zz", "vv", "jj", "hzh" }
    local medium_middle_only = { "vj", "jz", "xth", "shv" }
    local rare_middle_only = { "kk", "gg", "zzh" }

    -- FINAL CONSONANTS: Fading breath or abrupt buzz
    local common_end_only_consonant = { "z", "v", "h", "sh" }
    local medium_end_only_consonant = { "th", "x", "s" }
    local rare_end_only_consonant = { "j", "zh" }


    -- Utility: Merge tables
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
        if one_in(6) then
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

    local gen_postcant3 = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = "" -- Reset string for each attempt
            local ends_in_vowel = (trandom(100) < words_end_in_vowel_chance)
            local has_middle_part = (trandom(2) == 1) -- 50% chance for 2nd syllable
            local is_long_word = (trandom(100) < 30) -- 30% chance for 3rd syllable

            -- STEP 1: Build the first syllable (CV).
            str = str .. get_consonant('initial')
            str = str .. get_vowel()

            -- STEP 2: Add the middle part of the word if it's a longer word.
            if has_middle_part or is_long_word then
                if one_in(3) then -- High chance of a special middle cluster
                    str = str .. get_consonant('middle_only')
                else
                    str = str .. get_consonant('middle')
                end
                str = str .. get_vowel()
            end
            
             -- STEP 3: Extra length for complexity
            if is_long_word then
                 str = str .. get_consonant('middle')
                 str = str .. get_vowel()
            end

            -- STEP 4: Add the final consonant if the word is not supposed to end in a vowel.
            if not ends_in_vowel then
                str = str .. get_consonant('final')
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_postcant3[v.token] = str
    end

    return gen_postcant3
end