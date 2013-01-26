local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Level = Class{
	function (self)
		self.tiles = {}
		self.beginning = nil
		self.end = nil
		self.Spawn = {
			wall = function (x, y, id)
				self.tiles[#self.tiles + 1] = Wall(x, y, id)
			end,
			door = function (x, y, id)
				self.tiles[#self.tiles + 1] = Door(x, y, id)
			end,
			key = function (x, y, id)
				self.tiles[#self.tiles + 1] = Key(x, y, id)
			end,
			consumable = function (x, y, id)
				self.tiles[#self.tiles + 1] = Consumable(x, y, id)
			end,
			barrier = function (x, y, id)
				self.tiles[#self.tiles + 1] = Barrier(x, y, id)
			end,
			barrierdestroyer = function (x, y, id)
				self.tiles[#self.tiles + 1] = BarrierDestroyer(x, y, id)
			end,
			part = function (x, y, id)
				self.tiles[#self.tiles + 1] = Part(x, y, id)
			end,
			beginning = function (x, y, id)
				self.beginning = Vector2D(x, y)
			end,
			ending = function (x, y, id)
				self.end = Vector2D(x, y)
			end
		}
	end
}

function Level:AddTile(x, y, id, name)
	self.Spawn[name](x, y, id)
end