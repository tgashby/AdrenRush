local Class = require('hump.class')
local Vector2D = require('hump.vector')

Part = Class{inherits = Tile,
    function(self, x, y, id)
      local img = Globals.IMAGE_DIR .. "part_" .. id .. ".png"

      Tile.construct(self, img, Vector2D(x, y), "part")
	end
}

function Part:usePart()

end