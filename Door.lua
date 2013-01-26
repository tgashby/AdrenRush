local Class = require('hump.class')
local Vector2D = require('hump.vector')

Door = Class{inherits = Tile,
    function(self, x, y, id)
        local img = love.graphics.newImage("door_" .. id .. ".png") 
        Tile.construct(self, img, Vector2D(x, y), "door")
        self.keyVal = id
    end
}


function Door:WillOpen(keyVal)
   if keyVal == self.keyVal then
      return true
     else
      return false
  end
end