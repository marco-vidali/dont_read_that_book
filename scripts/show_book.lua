function _init()
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
end

function _draw()
    cls()

    print(book.title, 7)
    print(book.author, 7)
    print_wrapped(book.synopsis, 0, 12, 7, 128)

    if choice == 1 then
        print("pass", 0, 50, 7)
        print("censor", 30, 50, 5)
    elseif choice == 2 then
        print("pass", 0, 50, 5)
        print("censor", 30, 50, 7)
    end
end