local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Floor = Class{inherits = Tile,
	function (self, x, y, id)
		local img = love.graphics.newImage("floor.png")
		Tile.construct(img, Vector2D(x, y), "floor")
	end
}

