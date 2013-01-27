local GameState = require("hump.gamestate")
local Timer = require("hump.timer")

local WinState = GameState.new()

function WinState:init()
	winImage = love.graphics.newImage(Globals.IMAGE_DIR .. "winner.png")
end

function WinState:draw()
	love.graphics.draw(winImage, 0, 0)
end

function WinState:keypressed(key, unicode)
  	love.event.push("quit")
end

return WinState