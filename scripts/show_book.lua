palt(0, false)

day = 1

awareness = 50
happiness = 50

function _init()
    hours = "08"
    minutes = "00"
    start_timer = time()

    books_num = flr(rnd(day ^ 1.2)) + 1

    showing = "front"
    choice = 1

    random_book()
end

function random_book()
    book = rnd(books)
    book.price = flr(rnd(14)) + 5
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
            random_book()
        else
            next_day()
        end
    end

    -- handle flip button press
    if btnp(5) then
        if showing == "front" then
            showing = "back"
        else
            showing = "front"
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
    rect(32, 20, 96, 108, 0)

    -- background
    rectfill(33, 21, 95, 107, 7)

    if showing == "front" then
        draw_book_front()
    elseif showing == "back" then
        draw_book_back()
    end
end

function draw_book_front()
    -- header
    rectfill(34, 22, 94, 32, 0)
    print_centered("s.a. bOOKS", 25, 7)

    -- content outline
    rect(34, 34, 94, 106, 0)

    -- author
    print_centered(book.author, 42, 0)

    -- title
    print_centered(wrap_text(book.title, 50), 54, 0)

    -- image
    rectfill(40, 78, 88, 98, 0)
end

function draw_book_back()
    -- content outline
    rect(34, 22, 94, 106, 0)

    -- author
    print(wrap_text(book.synopsis, 52), 38, 26)

    -- price
    print("$" .. book.price .. ".00", 38, 98)

    -- barcode
    spr(1, 76, 97, 2, 1)
end