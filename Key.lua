local Class = require('hump.class')
local Vector2D = require('hump.vector')

Key = Class{inherits = Tile,
    function(self, x, y, id)
	    local img = Globals.IMAGE_DIR .. "key_" .. id - 1 .. ".png" 
	    Tile.construct(self, img, Vector2D(x, y), "key")
	    self.keyVal = id
    end
}

  
