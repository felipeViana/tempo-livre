local RandomLogic = require("RandomLogic")
local ItemPrices = require("ItemPrices")

for _ = 1, 5 do
    local item = RandomLogic.getRandomItem()

    print("chosen item:", item)
    print("real price:", ItemPrices[item])

    local prices = RandomLogic.getRandomPrices(item)

    print("Prices: ", table.concat(prices, ", "))
    print()
end
