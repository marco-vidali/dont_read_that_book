function init_actions()
    selected_action = "pass"
end

function change_selected_action()
    if btnp(0) then
        selected_action = "pass"
    end

    if btnp(1) then
        selected_action = "censor"
    end
end

function confirm_action()
    if btnp(4) then
        if book.censored then
            -- censored book
            if selected_action == 1 then
                awareness += 5
            else
                awareness -= 2
            end
        else
            -- uncensored book
            if selected_action == 1 then
                happiness += 2
            else
                happiness -= 5
            end
        end

        if books_to_check > 1 then
            random_book()
        else
            next_day()
        end
    end
end