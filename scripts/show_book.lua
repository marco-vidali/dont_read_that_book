function _init()
    book = rnd(books)
    choice = 1
    mode = "choice"
    current_subphrase = 1
end

function _update()
    if btnp(0) and choice > 1 then
        choice -= 1
    end

    if btnp(1) and choice < 2 then
        choice += 1
    end

    if btnp(4) then
        if choice == 2 then
            mode = "censoring"
        end
    end
end

function _draw()
    cls()

    print(book.title, 7)
    print(book.author, 7)

    -- choice mode
    if mode == "choice" then
        print_wrapped(book.synopsis, 0, 12, 7, 128)
    end

    -- censoring mode
    if mode == "censoring" then
        local subphrase = book.subphrases[current_subphrase]
        local start = subphrase[1]
        local _end = subphrase[2]
        local words = split_words(book.synopsis)

        print_wrapped(book.synopsis, 0, 12, 5, 128)
        print_wrapped(
            sub_words(split_words(book.synopsis), start, _end),
            0, 12, 7, 128
        )
    end

    if choice == 1 then
        print("pass", 0, 50, 7)
        print("censor", 30, 50, 5)
    elseif choice == 2 then
        print("pass", 0, 50, 5)
        print("censor", 30, 50, 7)
    end
end