local Class = require('hump.class')
local Vector2D = require('hump.vector')

Key = Class{inherits = Tile,
    function(self, x, y, id)
	    local img = Globals.IMAGE_DIR .. "key_" .. id - 1 .. ".png" 
		self.used = false
		self.id = id
	    Tile.construct(self, img, Vector2D(x, y), "key")
	    self.keyVal = id
    end
}

function Key:useKey()
	if not self.used then
		Map.openDoors(self.keyVal)
		self.used = true
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "floor_0.png")
	end
end
  
