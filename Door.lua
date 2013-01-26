local Class = require('hump.class')
local Vector2D = require('hump.vector')

Door = Class{inherits = Tile,
    function(self, img, pos, keyVal)
      Tile.construct(self, img, pos)
      
      self.keyVal = keyVal
      
    end
  }


function Door::WillOpen(keyVal)
   if keyVal == self.keyVal
      return true
     else
      return false
  end
   
   
  end