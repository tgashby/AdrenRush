local Class = require('hump.class')
local Vector2D = require('hump.vector')

Consumable = Class{inherits = Tile,
    function(self, x, y, amount)
    	local img = nil

    	if amount < 100 then
    		img = love.graphics.newImage("upper_" .. amount .. ".png")
    	else
    		img = love.graphics.newImage("downer_" .. amount - 100 .. ".png")
    	end

      	Tile.construct(self, img, Vector2D(x, y), "consumable")
      	self.heartAccel = heartAccel
	end
}
   
function Consumable:UseConsumable()
 	player.heartRate = player.heartRate + self.heartAccel
end
   
   
   