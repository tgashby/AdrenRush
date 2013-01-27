local GameState = require "hump.gamestate"

require("WinState")
require("LoseState")
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

local PlayState = GameState.new()

function PlayState:init()	
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
	exitImage = love.graphics.newImage(Globals.IMAGE_DIR .. "exit.png")
end

function PlayState:update(dt)
	player:Update(dt)
    Map.Update(dt)

    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        player.nextDir = "up"
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        player.nextDir = "left"
    end

    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        player.nextDir = "right"
    end

    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        player.nextDir = "down"
    end
end

function PlayState:draw()
	Map.Draw()
    overlay:Draw()
	arrow:Draw()
	love.graphics.draw(exitImage, Map.levels[Map.currentLevel].ending.x, Map.levels[Map.currentLevel].ending.y) 
    player:Draw()
    love.graphics.print(player.heartRate .. " / 240 BPM", 930, 740)
end

function PlayState:keypressed(key, unicode)
    if key == "escape" then
      love.event.push("quit")
    end
    
	if key == " " then
		player.showInvent = not player.showInvent
	end
end

return PlayState