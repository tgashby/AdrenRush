local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Wall = Class{inherits = Tile,
	function (self, x, y, id)
		local img = love.graphics.newImage("wall_" .. id .. ".png")
		self.penetrable = id == 75
		Tile.construct(img, Vector2D(x, y), "wall")
	end
}

