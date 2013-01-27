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