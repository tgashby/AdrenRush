local Vector2D = require('hump.vector')
require('Tile')

Map = {
	levels = {},
	currentLevel = 1
}

function Map.GenerateLevel(levelFile)
	local levelData = love.image.newImageData(levelFile)
	local level = Level()

	for y = 0, Globals.SCREEN_HEIGHT_TILES - 1 do
		for x = 0, Globals.SCREEN_WIDTH_TILES - 1 do
			local r, g, b, a = levelData:getPixel(x, y)

			local tileX = x * Globals.TILE_SIZE
			local tileY = y * Globals.TILE_SIZE

			if r == 0 and g == 0 then
				level:AddTile(tileX, tileY, b, "wall")
			elseif r == 255 and g == 255 and b == 255 then
				level:AddTile(tileX, tileY, r, "floor")
			elseif g == 0 and b == 255 then
				level:AddTile(tileX, tileY, r, "door")
			elseif g == 255 and b == 0 then
				level:AddTile(tileX, tileY, r, "key")
			elseif r == 255 and g == 0 then
				level:AddTile(tileX, tileY, b, "consumable")
			elseif r == 255 and g == 255 then
				level:AddTile(tileX, tileY, b, "barrier")
			elseif g == 255 and b == 255 then
				level:AddTile(tileX, tileY, r, "barrierdestroyer")
			elseif r == 255 and b == 255 then
				level:AddTile(tileX, tileY, g, "part")
			elseif r == 201 and g == 201 and b == 201 then
				level:AddTile(tileX, tileY, r, "beginning")
			elseif r == 255 and g == 220 and b == 220 then
				level:AddTile(tileX, tileY, r, "ending")
			else
				print("UNKNOWN PIXEL TYPE: ", r, g, b)
			end
		end
	end

	if not level.beginning then
		print("NO STARTING TILE")
	end

	if not level.ending then
		print("NO ENDING TILE")
	end

	Map.levels[#Map.levels + 1] = level
end

function Map.CollidesWith(type, objectPos)
	return Map.levels[Map.currentLevel].tiles[Globals.SCREEN_WIDTH_TILES * objectPos.y / Globals.SCREEN_WIDTH_TILES + 
	(objectPos.x / Globals.SCREEN_WIDTH_TILES + 1)].type == type, Map.levels[Map.currentLevel].tiles[Globals.SCREEN_WIDTH_TILES * objectPos.y / Globals.SCREEN_WIDTH_TILES + 
	(objectPos.x / Globals.SCREEN_WIDTH_TILES + 1)]
end

function Map.Draw()
	Map.levels[Map.currentLevel]:Draw()	
end

function Map.Update(dt)
	Map.levels[Map.currentLevel]:Update(dt)
end