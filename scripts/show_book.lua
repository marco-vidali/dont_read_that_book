day = 1

awareness = 50
happiness = 50

function _init()
    hours = "08"
    minutes = "00"
    start_timer = time()

    books_num = flr(rnd(day * 2)) + 1

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
            -- next day
            day += 1
            _init()
        end
    end
end

function _draw()
    cls()

    print("dAY " .. day, 0, 0, 7)
    print(hours .. ":" .. minutes, 109, 0, 7)

    print("aWARENESS: " .. awareness .. "%", 0, 12, 14)
    print("hAPPINESS: " .. happiness .. "%", 0, 18, 10)

    print("bOOKS LEFT: " .. books_num, 0, 30, 6)

    print_wrapped(book.title, 0, 42, 12, 128)
    print_wrapped(book.author, 0, 48, 9, 128)
    print_wrapped(book.synopsis, 0, 54, 7, 128)

    if choice == 1 then
        print("pass", 0, 84, 11)
        print("censor", 30, 84, 5)
    elseif choice == 2 then
        print("pass", 0, 84, 5)
        print("censor", 30, 84, 8)
    end
end