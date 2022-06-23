local ItemPrices = require("ItemPrices")
local RandomLogic = require("RandomLogic")

local game = {}

local currentItem
local prices = {}
local currentRound = 1
local TOTAL_ROUNDS = 5

local results = {}

local valuesPositions = {
    {x = 60, y = 300},
    {x = 160, y = 300},
    {x = 260, y = 300},
    {x = 60, y = 400},
    {x = 160, y = 400},
    {x = 260, y = 400}
}

function game.load()
    -- select item
    currentItem = RandomLogic.getRandomItem()

    -- load random values
    prices = RandomLogic.getRandomPrices(currentItem)
end

function game.update(dt)
    -- check click on values
    -- check if win or lose
    -- load next item
end

function game.draw()
    -- debug
    love.graphics.print(ItemPrices[currentItem]) -- correct price

    -- draw title
    love.graphics.print("Tempo Livre", 120, 10)

    -- draw item
    local itemToShow = itens[currentItem]
    local w, h = itemToShow:getDimensions()
    local scaleX = 150 / w
    local scaleY = 150 / h
    local scale = math.min(scaleX, scaleY)

    love.graphics.print(currentItem, 120, 80) -- debug
    love.graphics.draw(itemToShow, 120, 100, 0, scale, scale)

    -- draw values
    for index = 1, 6 do
        love.graphics.print("R$" .. prices[index], valuesPositions[index].x, valuesPositions[index].y)
    end
    -- draw rounds
    local circlePositions = {
        {x = 330, y = 260},
        {x = 330, y = 280},
        {x = 330, y = 300},
        {x = 330, y = 320},
        {x = 330, y = 340}
    }

    for index = 1, TOTAL_ROUNDS do
        love.graphics.circle("line", circlePositions[index].x, circlePositions[index].y, 5)
    end

    -- draw previous rounds
    for index, result in ipairs(results) do
        if result == "won" then
            love.graphics.setColor(0, 1, 0)
        else
            love.graphics.setColor(1, 0, 0)
        end

        love.graphics.circle("fill", circlePositions[index].x, circlePositions[index].y, 5)
    end
    love.graphics.setColor(1, 1, 1)

    -- draw current round
    love.graphics.circle("fill", circlePositions[currentRound].x, circlePositions[currentRound].y, 5)

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
