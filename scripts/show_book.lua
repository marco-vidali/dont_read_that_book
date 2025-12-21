function _init()
    book = rnd(books)
end

function _update()
    
end

function _draw()
    cls()

    print(book.title)
    print(book.author)
    print_wrapped(book.synopsis, 0, 12, 7, 128)
end