local Items = require("Items")
local ItemPrices = require("ItemPrices")
local Table = require("Table")

local RandomLogic = {
    amountOfPrices = 5
}

function RandomLogic.getRandomItem()
    return Table.random(Items)
end

function RandomLogic.randomRange(minValue, maxValue)
    return math.random() * (maxValue - minValue) + minValue
end

function RandomLogic.getRandomPrices(itemId)
    local prices = {}
    local usedPrices = {}
    local realPrice = ItemPrices[itemId]

    -- one price is the real one
    prices[1] = realPrice
    usedPrices[realPrice] = true

    -- decide the range
    local minPercentage = math.random(-0.9, 0)
    local maxPercentage = minPercentage + 0.9

    for priceIndex = 2, RandomLogic.amountOfPrices do
        local randomPrice
        repeat
            randomPrice = math.floor((1 + RandomLogic.randomRange(minPercentage, maxPercentage)) * realPrice)
        until not usedPrices[randomPrice]

        prices[priceIndex] = randomPrice
        usedPrices[randomPrice] = true
    end

    -- now shuffle them
    Table.shuffle(prices)

    return prices
end

return RandomLogic
