local Class = require('hump.class')
local Vector2D = require('hump.vector')

Door = Class{inherits = Tile,
    function(self, x, y, id)
        local img = Globals.IMAGE_DIR .. "door_" .. id - 1 .. ".png" 
        Tile.construct(self, img, Vector2D(x, y), "door")
		self.closed = true
        self.keyVal = id
    end
}


function Door:open(id)
	if id == self.keyVal then
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "floor_0.png")
		self.closed = false
	end
end