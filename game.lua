local game = {}

function game.load()
    -- load assets
    -- select item
    -- load random values
end

function game.update(dt)
    -- check click on values
    -- check if win or lose
    -- load next item
end

function game.draw()
    -- draw title
    love.graphics.print("Tempo Livre", 120, 10)

    -- draw item
    local itemToShow = itens["buggy"]
    local w, h = itemToShow:getDimensions()
    local scaleX = 150 / w
    local scaleY = 150 / h
    local scale = math.min(scaleX, scaleY)

    love.graphics.draw(itemToShow, 120, 100, 0, scale, scale)

    -- draw values
    love.graphics.print("R$24", 60, 300)
    love.graphics.print("R$47", 160, 300)
    love.graphics.print("R$32", 240, 300)
    love.graphics.print("R$96", 60, 400)
    love.graphics.print("R$12", 160, 400)
    love.graphics.print("R$85", 240, 400)

    -- draw rounds
    love.graphics.circle("line", 330, 260, 5)
    love.graphics.circle("line", 330, 280, 5)
    love.graphics.circle("line", 330, 300, 5)
    love.graphics.circle("line", 330, 320, 5)
    love.graphics.circle("line", 330, 340, 5)

    -- draw players
    love.graphics.circle("line", 30, 570, 20)
    love.graphics.draw(bob, 10, 550, 0, 0.2, 0.2)

    love.graphics.circle("line", 130, 570, 20)
    love.graphics.draw(julia, 110, 550, 0, 0.2, 0.2)

    love.graphics.circle("line", 230, 570, 20)
    love.graphics.draw(mutt, 210, 550, 0, 0.2, 0.2)

    love.graphics.circle("line", 330, 570, 20)
    love.graphics.draw(rich, 310, 550, 0, 0.2, 0.2)
end

return game
