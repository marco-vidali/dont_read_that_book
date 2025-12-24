palt(0, false)

day = 1

awareness = 50
happiness = 50

function _init()
    hours = "08"
    minutes = "00"
    start_timer = time()

    books_num = flr(rnd(day ^ 1.2)) + 1

    book = rnd(books)
    choice = 1
end

function _update()
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

    -- day has ended
    if hours == "16" and minutes == "00" then
        for i = 1, books_num do
            local j = flr(rnd(2))

            if j == 0 then
                awareness += 5
            else
                happiness += 2
            end
        end

        next_day()
    end

    -- change choice selection
    if btnp(0) and choice > 1 then
        choice -= 1
    end

    if btnp(1) and choice < 2 then
        choice += 1
    end

    -- handle confirm button press
    if btnp(4) then
        if book.censored then
            -- censored book
            if choice == 1 then
                awareness += 5
            else
                awareness -= 2
            end
        else
            -- uncensored book
            if choice == 1 then
                happiness += 2
            else
                happiness -= 5
            end
        end

        if books_num > 1 then
            -- more books left today
            books_num -= 1
            book = rnd(books)
        else
            next_day()
        end
    end

    -- game over
    if awareness > 75 or happiness < 25 then
        stop()
    end
end

function next_day()
    day += 1
    _init()
end

function _draw()
    cls(6)

    -- outline
    rect(32, 0, 96, 88, 0)

    -- background
    rectfill(33, 1, 95, 87, 7)

    -- header
    rectfill(34, 2, 94, 12, 0)
    print_centered("s.a. bOOKS", 5, 7)

    -- content outline
    rect(34, 14, 94, 86, 0)

    -- author
    print_centered(book.author, 22, 0)

    -- title
    print_centered(book.title, 34, 0, 50)

    -- image
    rectfill(40, 58, 88, 78, 0)
end