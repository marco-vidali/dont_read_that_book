function _init()
    day = 1
    books_num = flr(5 + rnd(2 ^ day))

    awareness = 50
    happiness = 50

    book = rnd(books)
    choice = 1
end

function _update()
    if btnp(0) and choice > 1 then
        choice -= 1
    end

    if btnp(1) and choice < 2 then
        choice += 1
    end

    if btnp(4) then
        if book.censored then
            if choice == 1 then
                awareness += 5
            else
                awareness -= 2
            end
        else
            if choice == 1 then
                happiness += 2
            else
                happiness -= 5
            end
        end

        if books_num > 0 then
            books_num -= 1
            book = rnd(books)
        else
            day += 1
            books_num = flr(5 + rnd(day * 2))
        end
    end
end

function _draw()
    cls()

    print("dAY " .. day, 0, 0, 7)
    print("bOOKS LEFT: " .. books_num, 64, 0, 7)

    print("aWARENESS: " .. awareness .. "%", 0, 12, 14)
    print("hAPPINESS: " .. happiness .. "%", 0, 18, 10)

    print_wrapped(book.title, 0, 30, 12, 128)
    print_wrapped(book.author, 0, 36, 9, 128)
    print_wrapped(book.synopsis, 0, 42, 7, 128)

    if choice == 1 then
        print("pass", 0, 72, 11)
        print("censor", 30, 72, 5)
    elseif choice == 2 then
        print("pass", 0, 72, 5)
        print("censor", 30, 72, 8)
    end
end