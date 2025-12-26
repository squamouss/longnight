local is_forbidden = require("filter")

languages.GEN_POSTCANT_2 = function()

    local words_end_in_vowel_chance = 40 

    local common_vowel = { "a", "u" }
    local medium_vowel = { "o" }
    local rare_vowel = { "e", "i" } 

    local common_vowel_pair = { "au", "ua" }
    local medium_vowel_pair = { "ou", "uo" }
    local rare_vowel_pair = { "oa", "ao" }

    local common_consonant = { "w", "l", "n", "d" }
    local medium_consonant = { "m", "h", "g" } 
    local rare_consonant = { "v", "b" }

    local common_first_only = { "dw", "nw", "lw" }
    local medium_first_only = { "gw", "mw" }
    local rare_first_only = { "dl", "gl" }

    local common_middle_only = { "nd", "ld", "nn", "ll" }
    local medium_middle_only = { "wn", "wl", "dd", "ng" }
    local rare_middle_only = { "nw", "lm", "dm" }

    local common_end_only_consonant = { "n", "l" }
    local medium_end_only_consonant = { "d", "nd", "ld" }
    local rare_end_only_consonant = { "ng", "wn" }


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
        local roll = trandom(10) 

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
            return pick_from_tiers(common_end_only_consonant, medium_end_only_consonant, rare_end_only_consonant)
        elseif position == 'middle_only' then
             return pick_from_tiers(common_middle_only, medium_middle_only, rare_middle_only)
        else 
            return pick_from_tiers(common_consonant, medium_consonant, rare_consonant)
        end
    end
	
    local function has_valid_doubles(word)
        local double_count = 0
        for i = 1, string.len(word) - 1 do
            if word:sub(i, i) == word:sub(i + 1, i + 1) then
                double_count = double_count + 1
            end
        end
        return double_count <= 1
    end

    local gen_postcant2 = {}
    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = ""
            local ends_in_vowel = (trandom(100) < words_end_in_vowel_chance)
            local has_middle_part = (trandom(2) == 1) 
            local is_long_word = (trandom(100) < 30) 

            str = str .. get_consonant('initial')
            str = str .. get_vowel()

            if has_middle_part or is_long_word then
                if one_in(3) then 
                    str = str .. get_consonant('middle_only')
                else
                    str = str .. get_consonant('middle')
                end
                str = str .. get_vowel()
            end
            
            if is_long_word then
                 str = str .. get_consonant('middle')
                 str = str .. get_vowel()
            end

            if not ends_in_vowel then
                str = str .. get_consonant('final')
            end

        until not is_forbidden(str) and string.len(str) > 2 and has_valid_doubles(str)

        gen_postcant2[v.token] = str
    end

    return gen_postcant2
end