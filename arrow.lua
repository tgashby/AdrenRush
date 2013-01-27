local Class = require('hump.class')
local Vector2D = require('hump.vector')
require("Player")

Arrow = Class{
	function (self)
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "arrow.png")
	end
}

function Arrow:Draw()
	if player.nextDir ~= "" then
		if player.nextDir == "up" then
			love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2, player.position.y + player.image:getHeight() / 2 - 48, 
				math.rad(90 * player.directions[player.nextDir]), 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
		elseif player.nextDir == "left" then
			love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2 - 48, player.position.y + player.image:getHeight() / 2, 
				math.rad(90 * player.directions[player.nextDir]), 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
		elseif player.nextDir == "right" then
			love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2 + 48, player.position.y + player.image:getHeight() / 2, 
				math.rad(90 * player.directions[player.nextDir]), 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
		elseif player.nextDir == "down" then
			love.graphics.draw(self.image, player.position.x + player.image:getWidth() / 2, player.position.y + player.image:getHeight() / 2 + 48, 
				math.rad(90 * player.directions[player.nextDir]), 1, 1, self.image:getWidth() / 2, self.image:getHeight() / 2)
		end
	end
end

