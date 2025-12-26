day = 1

function next_day()
    day += 1
    show_office()
end

function draw_day()
    print("dAY " .. day, 3, 3, 0)
end