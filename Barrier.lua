local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Barrier = Class{inherits = Tile,
	function (self, x, y, id)
		local img = Globals.IMAGE_DIR .. "barrier_Phase1.png"
		Tile.construct(self, img, Vector2D(x, y), "barrier")

		self.dir = id == 1 and Vector2D(0, -1) or Vector2D(-1, 0)
		self.lastUpdate = 0
	end
}

function Barrier:Update(dt)
	self.lastUpdate = self.lastUpdate + dt

	if self.lastUpdate > 0.5 then
		self.position = self.position + self.dir
		local wall = Map.CollidesWith("wall", self.position)
		local door = Map.CollidesWith("door", self.position)

		if wall or door then
			if wall and not wall.penetrable or door then
				self.dir = -1 * self.dir
			end
		end
		if player.position:dist(self.position) < Globals.TILE_SIZE then
			--reset
		end
	end
end