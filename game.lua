local ItemPrices = require("ItemPrices")
local RandomLogic = require("RandomLogic")
local sceneManager = require("sceneManager")
local legendaryVictory = require("legendaryVictory")

local game = {}

local currentItem
local prices = {}
local currentRound = 1
local TOTAL_ROUNDS = 2
local randomItems

local BUTTON_WIDTH = 80
local BUTTON_HEIGHT = 30

local results = {}

local chosenValue = nil

local valuesPositions = {
    {x = 30, y = 300},
    {x = 130, y = 300},
    {x = 230, y = 300},
    {x = 30, y = 400},
    {x = 130, y = 400},
    {x = 230, y = 400}
}

local function refreshItem()
    currentItem = randomItems[currentRound]
    prices = RandomLogic.getRandomPrices(currentItem)
end

function game.load()
    -- select item
    randomItems = RandomLogic.getRandomItems(TOTAL_ROUNDS)

    refreshItem()
end

function game.update(dt)
    -- check if win or lose
    if chosenValue then
        print("prices[chosenValue]", prices[chosenValue])
        print("ItemPrices[currentItem]", ItemPrices[currentItem])

        if prices[chosenValue] == ItemPrices[currentItem] then
            -- won
            table.insert(results, "won")
        else
            -- lost
            table.insert(results, "lost")
        end

        chosenValue = nil

        -- go to next round
        currentRound = currentRound + 1

        if currentRound > TOTAL_ROUNDS then
            sceneManager.pushScene(legendaryVictory)
        else
            refreshItem()
        end
    end
end

function game.draw()
    love.graphics.draw(background)

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

    love.graphics.draw(itemToShow, 120, 100, 0, scale, scale)

    -- draw values
    for index = 1, 6 do
        love.graphics.print("R$" .. prices[index], valuesPositions[index].x + 10, valuesPositions[index].y + 10)

        love.graphics.rectangle("line", valuesPositions[index].x, valuesPositions[index].y, BUTTON_WIDTH, BUTTON_HEIGHT)
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

function game.mousepressed(x, y, button)
    -- print(x)
    -- print(y)

    -- check click on value
    for index = 1, 6 do
        if
            x >= valuesPositions[index].x and x <= valuesPositions[index].x + BUTTON_WIDTH and
                y >= valuesPositions[index].y and
                y <= valuesPositions[index].y + BUTTON_HEIGHT
         then
            chosenValue = index
        end
    end
end

return game
