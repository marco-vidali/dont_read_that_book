function wrap_text(text, max_pixel_width)
    local char_width = 4
    local max_chars = flr(max_pixel_width / char_width)
    local wrapped = ""
    local line = ""

    for word in all(split(text, " ")) do
        if #line + #word + (#line > 0 and 1 or 0) > max_chars then
            wrapped = wrapped .. line .. "\n"
            line = word
        else
            if line == "" then
                line = word
            else
                line = line.." "..word
            end
        end
    end

    wrapped = wrapped .. line
    return wrapped
end

function print_centered(text, y, color)
    local char_width = 4
    local line_height = 6
    local screen_width = 128

    for i, line in ipairs(split(text, "\n")) do
        local line_pixel_width = #line * char_width
        local x = flr((screen_width - line_pixel_width) / 2)
        print(line, x, y + (i-1)*line_height, color)
    end
end

function split_words(str)
    local words = {}

    for w in all(split(str," ")) do
        add(words,w)
    end

    return words
end

function sub_words(words, w_start, w_end)
    local s = ""

    for i=w_start,w_end do
        s ..= words[i]
        if i < w_end then s ..= " " end
    end

    return s
end