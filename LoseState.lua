local GameState = require("hump.gamestate")
local Timer = require("hump.timer")

local LoseState = GameState.new()

function LoseState:init()
	loseImage = love.graphics.newImage(Globals.IMAGE_DIR .. "gameOver.png")
end

function LoseState:draw()
	love.graphics.draw(loseImage, 0, 0)
end

function LoseState:keypressed(key, unicode)
  	love.event.push("quit")
end

return LoseState