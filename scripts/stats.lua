awareness = 50
happiness = 50

function check_stats()
    if awareness > 75 or happiness < 25 then
        stop()
    end
end