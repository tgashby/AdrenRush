local Vector2D = require('hump.vector')
require('Tile')

Map = {
	levels = {}
}

function Map:GenerateLevel(levelFile)
	local levelData = love.image.newImageData(levelFile)
	local level = Level()

	for x = 0, Globals.SCREEN_WIDTH, Globals.TILE_SIZE do
		for y = 0, Globals.SCREEN_HEIGHT, Globals.TILE_SIZE do
			local r, g, b, a = levelData:getPixel(x, y)

			if r == 0 and g == 0 then
				level.AddTile(x, y, b, "wall")
			elseif g == 0 and b == 255 then
				level.AddTile(x, y, r, "door")
			elseif g == 255 and b == 0 then
				level.AddTile(x, y, r, "key")
			elseif r == 255 and g == 0 then
				level.AddTile(x, y, b, "consumable")
			elseif r == 255 and g == 255 then
				level.AddTile(x, y, b, "barrier")
			elseif g == 255 and b == 255 then
				level.AddTile(x, y, r, "barrierdestroyer")
			elseif r == 255 and b == 255 then
				level.AddTile(x, y, g, "part")
			elseif r == 201 and g == 201 and b == 201 then
				level.AddTile(x, y, r, "beginning")
			elseif r == 255 and g == 220 and b == 220 then
				level.AddTile(x, y, r, "ending")
			else
				print("UNKNOWN PIXEL TYPE: ", r, g, b)
			end
		end
	end

	if not level.beginning then
		print("NO STARTING TILE")
	end

	if not level.end then
		print("NO ENDING TILE")
	end

	self.levels[#self.levels + 1]
end