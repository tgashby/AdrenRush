Timer = require("hump.timer")

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
    overlay = love.graphics.newImage(Globals.IMAGE_DIR .. "overlay.png")
end

function love.update(dt)
    -- Called as often as possible
    -- dt is the time, in seconds, since update was last called
    Timer.update(dt)
end

function love.draw()
    Map.Draw()
    love.graphics.draw(overlay, player.position.x - overlay:getWidth() / 2 + player.image:getWidth() / 2, 
        player.position.y - overlay:getHeight() / 2 + player.image:getHeight() / 2, 0, 1, 1)
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
end

function HeartBeat()
    player:Move()
    Timer.add(player.heartRate / 60, HeartBeat)
end

Timer.add(2, HeartBeat)