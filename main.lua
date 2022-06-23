require("RandomLogicTesting")

local sceneManager = require "sceneManager"

local itemNames = require "Items"

function love.load(...)
    math.randomseed(os.time())


    -- load assets

    -- load items
    itens = {}
    for index, name in ipairs(itemNames) do
        itens[name] = love.graphics.newImage("items/" .. name .. ".png")
    end

    -- load players
    bob = love.graphics.newImage("npcs/bob.png")
    julia = love.graphics.newImage("npcs/julia.png")
    mutt = love.graphics.newImage("npcs/mutt.png")
    rich = love.graphics.newImage("npcs/rich.png")

    sceneManager.changeScene(require "game")
end

function love.update(dt)
    sceneManager.currentScene.update(dt)
end

function love.draw()
    sceneManager.draw()
end

function love.keypressed(key)
    sceneManager.currentScene.keypressed(key)
end

function love.mousepressed(x, y, button)
    sceneManager.currentScene.mousepressed(x, y, button)
end
