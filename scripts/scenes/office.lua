function show_office()
    game.update = update_office
    game.draw = draw_office

    init_actions()
    init_books()
    init_clock()
end

function update_office()
    update_clock()
    change_selected_action()
    confirm_action()
    flip_book()
    check_stats()
    check_day_ended()
end

function draw_office()
    rectfill(0, 0, 127, 127, 7)

    draw_book()
    draw_day()
    draw_clock()
end
