require("Barrier")
require("BarrierDestroyer")
require("Consumable")
require("Door")
require("Floor")
require("Globals")
require("Key")
require("Level")
require("Map")
require("Player")
require("Tile")
require("Wall")

function love.load()
    -- Load everything you need!
    Map.GenerateLevel(Globals.LEVELS_DIR .. "basic.png")
    player = Player(Globals.IMAGE_DIR .. "player.png", Map.levels[Map.currentLevel].beginning)
end

function love.update(dt)
    -- Called as often as possible
    -- dt is the time, in seconds, since update was last called
end

function love.draw()
    Map.Draw()
    player:Draw()
end

function love.keypressed(key, unicode)
    -- Called when a key is pressed
    -- key - 'a', 'b', etc, list available at https://love2d.org/wiki/KeyConstant
    -- unicode - the unicode value of the key pressed
    if key == "w" or key == "up" then
        player.nextDir = "up"
    end

    if key == "a" or key == "left" then
        player.nextDir = "left"
    end

    if key == "d" or key == "right" then
        player.nextDir = "right"
    end

    if key == "s" or key == "down" then
        player.nextDir = "down"
    end
end

function love.keyreleased(key, unicode)
    -- I think you get it by now
    if key == "escape" then
      love.event.push("quit")
    end

    player:Move()
end
