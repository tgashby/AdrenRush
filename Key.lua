local Class = require('hump.class')
local Vector2D = require('hump.vector')

Key = Class{inherits = Tile,
    function(self, img, pos, keyVal)
      Tile.construct(self, img, pos)
      
      self.keyVal = keyVal
      
    end
  }

  
