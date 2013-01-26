local Class = require('hump.class')
local Vector2D = require('hump.vector')

Consumable = Class{inherits = Tile,
    function(self, x, y, amount)
    	local img = Globals.IMAGE_DIR

    	if amount < 100 then
    		img = img .. "upper_" .. amount .. ".png"
    	else
    		img = img .. "downers_" .. amount - 100 .. ".png"
    	end

      	Tile.construct(self, img, Vector2D(x, y), "consumable")
      	self.heartAccel = amount
	end
}
   
function Consumable:UseConsumable()
 	player.heartRate = player.heartRate + self.heartAccel
end
