local Class = require('hump.class')
local Vector2D = require('hump.vector')

Consumable = Class{inherits = Tile,
    function(self, x, y, amount)
    	local img = Globals.IMAGE_DIR
		self.used = false
    	if amount < 100 then
    		img = img .. "upper_" .. amount .. ".png"
			self.heartAccel = amount
    	else
    		img = img .. "downers_" .. amount - 100 .. ".png"
			self.heartAccel = 100 - amount
    	end

      	Tile.construct(self, img, Vector2D(x, y), "consumable")
      	
	end
}
   
function Consumable:UseConsumable()
	if not self.used then
		player.heartRate = player.heartRate + self.heartAccel
		self.used = true
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "floor_0.png")
	end
end
