function init_clock()
    start_timer = time()
    hours = "08"
    minutes = "00"
end

function update_clock()
    -- update hours
    if (time() - start_timer) % 5 == 0 then
        if hours == "08" then
            hours = "09"
        elseif hours == "09" then
            hours = "10"
        elseif hours == "10" then
            hours = "11"
        elseif hours == "11" then
            hours = "12"
        elseif hours == "12" then
            hours = "13"
        elseif hours == "13" then
            hours = "14"
        elseif hours == "14" then
            hours = "15"
        elseif hours == "15" then
            hours = "16"
        end
    end

    -- update minutes
    if (time() - start_timer) % 5 < 2.5 then
        minutes = "00"
    else
        minutes = "30"
    end
end

function check_day_ended()
    -- day has ended
    if hours == "16" and minutes == "00" then
        for i = 1, books_to_check do
            local j = flr(rnd(2))

            if j == 0 then
                awareness += 5
            else
                happiness += 2
            end
        end

        next_day()
    end
end

function draw_clock()
    print(hours .. ":" .. minutes, 106, 3, 0)
end