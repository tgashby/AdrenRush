local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

BarrierDestroyer = Class{inherts = Tile,
	function (self, x, y, id)
		local img = love.graphics.newImage("barrier_destroyer.png")

		Tile.construct(img, Vector2D(x, y), "barrierdestroyer")
	end
}