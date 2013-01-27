Timer = require("hump.timer")

require("Barrier")
require("BarrierDestroyer")
require("Consumable")
require("Door")
require("Floor")
require("Globals")
require("Key")
require("Level")
require("Overlay")
require("Map")
require("Player")
require("Tile")
require("Part")
require("Wall")

function love.load()
    -- Load everything you need!
    Map.GenerateLevel(Globals.LEVELS_DIR .. "levele1.png")
    player = Player(Globals.IMAGE_DIR .. "player.png", Map.levels[Map.currentLevel].beginning)
    overlay = Overlay()
	inventory = {
		door = false,
		spark_plug = false,
		radio = false,
		controls = false,
		hula = false,
		rocket = false,
		fuel = false,
		ac = false,
		battery = false,
		food = false
	}
end

function love.update(dt)
    Timer.update(dt)
    player:Update(dt)
end

function love.draw()
    Map.Draw()
    -- overlay:Draw()
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
