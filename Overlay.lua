local Class = require('hump.class')
local Vector2D = require('hump.vector')
require("Player")

Overlay = Class{
	function (self)
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "overlay.png")
	end
}

function Overlay:Draw()
	love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2, player.position.y + player.image:getHeight() / 2, 
		0, 4.5 - player.beatPercent * 3.5, 4.5 - player.beatPercent * 3.5, self.image:getWidth() / 2, self.image:getHeight() / 2)
end

