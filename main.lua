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
	levels = {
	"basic.png", 
	"levele1.png",
	"levele2.png",
	"levele3.png",
	"levele3A.png",
	"levele4.png",
	"levele5.png",
	"levele6.png",
	"levele7.png",
	"levels1.png",
	"levels2.png",
	"levels3.png",
	"levels4.png",
	"levels5.png",
	"levels6.png",
	"levels7.png",
	"levels8.png"
	}
	for i, v in ipairs(levels) do
		   Map.GenerateLevel(Globals.LEVELS_DIR .. v)
	end

    player = Player(Globals.IMAGE_DIR .. "player.png", Map.levels[Map.currentLevel].beginning)
    overlay = Overlay()
	inventory = {
		i1 = false,
		i2 = false,
		i3 = false,
		i4 = false,
		i5 = false,
		i6 = false,
		i7 = false,
		i8 = false,
		i9 = false,
		i10 = false
	}
	
end

function love.update(dt)
    Timer.update(dt)
    player:Update(dt)
    Map.Update(dt)
end

function love.draw()
    Map.Draw()
    overlay:Draw()
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
