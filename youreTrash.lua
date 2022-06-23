local youreTrash = {}

function youreTrash.load()
end

function youreTrash.update(dt)
end

function youreTrash.draw()
    -- background
    local screenWidth, screenHeight = love.graphics.getDimensions()
    local rectWidth = screenWidth * 0.80
    local rectHeight = screenHeight * 0.8

    local color = {
        fill = {0, 0, 0, 1},
        line = {1, 1, 1, 1}
    }
    for _, mode in ipairs {"fill", "line"} do
        love.graphics.setColor(color[mode])
        love.graphics.rectangle(
            mode,
            screenWidth / 2 - rectWidth / 2,
            screenHeight / 2 - rectHeight / 2,
            rectWidth,
            rectHeight
        )
    end

    love.graphics.draw(
        seuLixo,
        screenWidth / 2,
        screenHeight / 2,
        0,
        1,
        1,
        seuLixo:getWidth() / 2,
        seuLixo:getHeight() / 2
    )

    love.graphics.print("Você perdeu!", 100, screenHeight * 0.8, 0, 2)
    love.graphics.print("seu lixo", 160, screenHeight * 0.85, 0, 0.8)
end

function youreTrash.keypressed(key)
    if key == "return" or key == "space" then
        resetGame()
    end
end

return youreTrash
