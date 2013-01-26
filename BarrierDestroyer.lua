local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

BarrierDestroyer = Class{inherts = Tile,
	function (self, x, y, id)
		local img = Globals.IMAGE_DIR .. "barrier_destroyer.png"

		Tile.construct(self, img, Vector2D(x, y), "barrierdestroyer")
	end
}