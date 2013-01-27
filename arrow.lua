local Class = require('hump.class')
local Vector2D = require('hump.vector')
require("Player")

Arrow = Class{
	function (self)
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "arrow.png")
	end
}

function Arrow:Draw()
	love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2, player.position.y + player.image:getHeight() / 2, 
		math.rad(90 * player.directions[player.nextDir]))
end

