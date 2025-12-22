function _init()
    book = rnd(books)
    choice = 1
    awareness = 50
    happiness = 50
end

function _update()
    if btnp(0) and choice > 1 then
        choice -= 1
    end

    if btnp(1) and choice < 2 then
        choice += 1
    end

    if btnp(4) then
        if choice == 1 then
            if not book.censored then
                -- correct
            else
                -- wrong
            end
        elseif choice == 2 then
            if book.censored then
                -- correct
            else
                -- wrong
            end
        end

        book = rnd(books)
    end
end

function _draw()
    cls()

    print("aWARENESS: " .. awareness .. "%", 0, 0, 7)
    print("hAPPINESS: " .. happiness .. "%", 0, 6, 7)

    print_wrapped(book.title, 0, 18, 7, 128)
    print_wrapped(book.author, 0, 24, 7, 128)
    print_wrapped(book.synopsis, 0, 30, 7, 128)

    if choice == 1 then
        print("pass", 0, 60, 7)
        print("censor", 30, 60, 5)
    elseif choice == 2 then
        print("pass", 0, 60, 5)
        print("censor", 30, 60, 7)
    end
end