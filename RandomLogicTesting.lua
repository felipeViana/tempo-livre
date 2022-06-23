local RandomLogic = require("RandomLogic")
local ItemPrices = require("ItemPrices")
local items = RandomLogic.getRandomItems(5)

for i = 1, 5 do
    local item = items[i]

    print("chosen item:", item)
    print("real price:", ItemPrices[item])

    local prices = RandomLogic.getRandomPrices(item)

    print("Prices: ", table.concat(prices, ", "))
    print()
end
