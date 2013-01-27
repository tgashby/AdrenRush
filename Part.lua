local Class = require('hump.class')
local Vector2D = require('hump.vector')

Part = Class{inherits = Tile,
    function(self, x, y, id)
		local img = Globals.IMAGE_DIR .. "part_" .. id .. ".png"
		self.id = id
		self.used = false
		Tile.construct(self, img, Vector2D(x, y), "part")
	end
}

function Part:usePart()
	if not self.used then
		player.tempInventory[self.id] = true
		self.used = true
		self.image = love.graphics.newImage(Globals.IMAGE_DIR .. "floor_0.png")
	end
end