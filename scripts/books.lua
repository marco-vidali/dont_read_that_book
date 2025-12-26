book_colors = {3, 4, 6, 7, 8, 9, 10, 11, 12, 14, 15}
books_x = 32
books_y = 20

function init_books()
	books_to_check = flr(rnd(day ^ 1.2)) + 1
	random_book()
end

function random_book()
    book = rnd(books_list)
    book.price = flr(rnd(14)) + 5
    book.color = rnd(book_colors)

    books_to_check -= 1

    viewing_side = "front"
	selected_action = "pass"
end

function flip_book()
    if btnp(5) then
        if viewing_side == "front" then
            viewing_side = "back"
		elseif viewing_side == "back" then
            viewing_side = "front"
        end
    end
end

function draw_book()
    -- outline
    rect(books_x, books_y, books_x + 64, books_y + 88, 0)

    -- background
    rectfill(books_x + 1, books_y + 1, books_x + 63, books_y + 87, book.color)

    if viewing_side == "front" then
		-- header
		rectfill(books_x + 2, books_y + 2, books_x + 62, books_y + 12, 0)
		print_centered("s.a. bOOKS", books_y + 5, book.color)

		-- content outline
		rect(books_x + 2, books_y + 14, books_x + 62, books_y + 86, 0)

		-- author
		print_centered(book.author, books_y + 22, 0)

		-- title
		print_centered(wrap_text(book.title, 50), books_y + 34, 0)

		-- image
		rectfill(books_x + 8, books_y + 58, books_x + 56, books_y + 78, 0)
    elseif viewing_side == "back" then
		-- content outline
		rect(books_x + 2, books_y + 2, books_x + 62, books_y + 86, 0)

		-- author
		print(wrap_text(book.synopsis, 52), books_x + 6, books_y + 6)

		-- price
		print("$" .. book.price .. ".00", books_x + 36, books_y + 78)
    end
end