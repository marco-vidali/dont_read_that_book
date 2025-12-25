-- set gray as transparent color
palt(0, false)
palt(5, true)

game = {}

function _init()
    show_office()
end

function _update()
    game.update()
end

function _draw()
    game.draw()
end