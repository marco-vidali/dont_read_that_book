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
