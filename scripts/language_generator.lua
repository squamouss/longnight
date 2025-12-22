
local is_forbidden = require("filter")

local function has_valid_doubles(word)
    local double_count = 0
    for i = 1, string.len(word) - 1 do
        if word:sub(i, i) == word:sub(i + 1, i + 1) then
            double_count = double_count + 1
        end
    end
    return double_count <= 1
end

local generator = {}

function generator.create_language(lang_def)
    local generated_words = {}

    for k, v in ipairs(world.language.word) do
        local str
        repeat
            str = lang_def:build_word()

        until not is_forbidden(str) and string.len(str) > 1 and has_valid_doubles(str)

        generated_words[v.token] = str
    end
    return generated_words
end

return generator
