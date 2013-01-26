local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Floor = Class{inherits = Tile,
	function (self, x, y, id)
		local img = Globals.IMAGE_DIR .. "floor.png"
		Tile.construct(self, img, Vector2D(x, y), "floor")
	end
}

