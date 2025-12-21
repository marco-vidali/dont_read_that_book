function print_wrapped(text, x, y, color, max_pixel_width)
    local char_width = 4
    local max_chars = flr(max_pixel_width / char_width)
    
    local line = ""
    local lines = {}
    
    for word in all(split(text, " ")) do
        if #line + #word + 1 > max_chars then
            add(lines, line)
            line = word
        else
            if line == "" then
                line = word
            else
                line = line.." "..word
            end
        end
    end
    add(lines, line)
    
    for i, l in ipairs(lines) do
        print(l, x, y + (i-1)*6, color)
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