local Class = require('hump.class')
local Vector2D = require('hump.vector')

Consumable = Class{inherits = Tile,
    function(self, img, pos, heartAccel)
      	Tile.construct(self, img, pos)
      	self.heartAccel = heartAccel
	end
}
   
function Consumable:UseConsumable()
 	player.heartRate = player.heartRate + self.heartAccel
end
   
   
   