local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Barrier = Class{inherits = Tile,
	function (self, x, y, id)
		local img = Globals.IMAGE_DIR .. "floor_0.png"
		Tile.construct(self, img, Vector2D(x, y), "floor")

		self.barrierImage = love.graphics.newImage(Globals.IMAGE_DIR .. "barrier_Phase1.png")

		self.dir = id == 1 and Vector2D(0, -1) or Vector2D(-1, 0)
		self.lastUpdate = 0
		self.startPos = Vector2D(x, y)
	end
}

function Barrier:Draw()
	love.graphics.draw(self.image, self.startPos.x, self.startPos.y)
	love.graphics.draw(self.barrierImage, self.position.x, self.position.y)
end

function Barrier:Update(dt)
	self.lastUpdate = self.lastUpdate + dt

	if self.lastUpdate > 0.5 then
		self.position = self.position + self.dir
		local snappedVec = Vector2D(math.floor(self.position.x / Globals.TILE_SIZE) * 
			Globals.TILE_SIZE, math.floor(self.position.y / Globals.TILE_SIZE) * Globals.TILE_SIZE)

		if self.dir.y == 1 then
			snappedVec.y = math.ceil(self.position.y / Globals.TILE_SIZE) * Globals.TILE_SIZE
		elseif self.dir.x == 1 then
			snappedVec.x = math.ceil(self.position.x / Globals.TILE_SIZE) * Globals.TILE_SIZE
		end

		local wall, wallTile = Map.CollidesWith("wall", snappedVec)
		local door = Map.CollidesWith("door", snappedVec)

		if wall or door then
			if wall and not wallTile.penetrable or door then
				self.dir = -1 * self.dir
			end
		end

		if player.position:dist(self.position) < Globals.TILE_SIZE * 3 / 4 then
			Map:Reset()
		end
	end
end