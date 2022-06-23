local ItemPrices = require("ItemPrices")
local RandomLogic = require("RandomLogic")

local game = {}

local currentItem
local prices = {}

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
    love.graphics.print("R$" .. prices[1], 60, 300)
    love.graphics.print("R$" .. prices[2], 160, 300)
    love.graphics.print("R$" .. prices[3], 240, 300)
    love.graphics.print("R$" .. prices[4], 60, 400)
    love.graphics.print("R$" .. prices[5], 160, 400)
    love.graphics.print("R$" .. prices[6], 240, 400)

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
