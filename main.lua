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
require("arrow")

function love.load()
    -- Load everything you need!
	levels = {
	"levele1.png", 
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
	music = love.audio.newSource("Music/Adr loop NO PULSE.wav")
	music:setLooping(true)
	music:setVolume(.3)
	love.audio.play(music)
    player = Player(Globals.IMAGE_DIR .. "player.png", Map.levels[Map.currentLevel].beginning)
    overlay = Overlay()
	inventory = {
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	}
	arrow = Arrow()
end

function love.update(dt)
    Timer.update(dt)
    player:Update(dt)
    Map.Update(dt)
end

function love.draw()
    Map.Draw()
    overlay:Draw()
	arrow:Draw()
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
	if key == " " then
		player.showInvent = true
	end
end

function love.keyreleased(key, unicode)
    -- I think you get it by now
    if key == "escape" then
      love.event.push("quit")
    end
	if key == " " then
		player.showInvent = false;
	end
end
