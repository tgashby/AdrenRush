local GameState = require("hump.gamestate")
local Timer = require("hump.timer")

local PlayState = require("PlayState")

local Menu = GameState.new()
local Instructions = GameState.new()

function Menu:init()
	menuImage = love.graphics.newImage(Globals.IMAGE_DIR .. "cover.png")

	Timer.add(3, function ()
		GameState.switch(Instructions)
	end)
end

function Menu:draw()
	love.graphics.draw(menuImage, 0, 0)
end

function Menu:update(dt)
	Timer.update(dt)
end

function Instructions:init()
	instructionsImage = love.graphics.newImage(Globals.IMAGE_DIR .. "instructions.png")
end

function Instructions:enter(previous)
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
end

function Instructions:keypressed(key, unicode)
	GameState.switch(PlayState)
end

function Instructions:draw()
	love.graphics.draw(instructionsImage, 0, 0)
end

function Instructions:update(dt)
	Timer.update(dt)
end

return Menu