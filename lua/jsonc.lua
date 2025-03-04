local jsonc = {}

local function strip_comments(json_str)
    local in_string = false
    local in_comment = false
    local in_multiline_comment = false
    local result = ""
    local i = 1

    while i <= #json_str do
        local char = json_str:sub(i, i)
        local next_char = json_str:sub(i + 1, i + 1)

        if not in_string and not in_comment and not in_multiline_comment then
            if char == '"' then
                in_string = true
                result = result .. char
            elseif char == '/' and next_char == '/' then
                in_comment = true
                i = i + 1
            elseif char == '/' and next_char == '*' then
                in_multiline_comment = true
                i = i + 1
            else
                result = result .. char
            end
        elseif in_string then
            result = result .. char
            if char == '"' and json_str:sub(i - 1, i - 1) ~= '\\' then
                in_string = false
            end
        elseif in_comment then
            if char == '\n' then
                in_comment = false
                result = result .. char
            end
        elseif in_multiline_comment then
            if char == '*' and next_char == '/' then
                in_multiline_comment = false
                i = i + 1
            end
        end

        i = i + 1
    end

    return result
end

local function remove_trailing_commas(json_str)
    local in_string = false
    local result = ""
    local i = 1

    while i <= #json_str do
        local char = json_str:sub(i, i)
        local next_char = json_str:sub(i + 1, i + 1)

        if char == '"' and json_str:sub(i - 1, i - 1) ~= '\\' then
            in_string = not in_string
        end

        if not in_string and char == ',' then
            local j = i + 1
            while j <= #json_str and json_str:sub(j, j):match("%s") do
                j = j + 1
            end
            if json_str:sub(j, j) == '}' or json_str:sub(j, j) == ']' then
                i = j - 1
            else
                result = result .. char
            end
        else
            result = result .. char
        end

        i = i + 1
    end

    return result
end

function jsonc.decode(jsonc_str, opts)
    local text = strip_comments(jsonc_str)
    text = remove_trailing_commas(text)
    return vim.json.decode(text, opts)
end

return jsonc
