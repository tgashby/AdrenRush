local GameState = require("hump.gamestate")
local Timer = require("hump.timer")

local LoseState = GameState.new()

function LoseState:init()
	loseImage = love.graphics.newImage(Globals.IMAGE_DIR .. "gameOver.png")

	Timer.add(3, function ()
		GameState.switch(Instructions)
	end)
end

function LoseState:draw()
	love.graphics.draw(loseImage, 0, 0)
end

return LoseState