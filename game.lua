local game = {}

function love.load()
    -- load assets
    -- select item
    -- load random values
end

function love.update(dt)
    -- check click on values
    -- check if win or lose
    -- load next item
end

function love.draw()
    -- draw title
    love.graphics.print("Tempo Livre", 120, 10)

    -- draw item
    love.graphics.rectangle("line", 120, 100, 100, 100)

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
    love.graphics.circle("line", 130, 570, 20)
    love.graphics.circle("line", 230, 570, 20)
    love.graphics.circle("line", 330, 570, 20)
end

return game
