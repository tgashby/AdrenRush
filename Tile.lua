local Class = require('hump.class')
local Vector2D = require('hump.vector')

Tile = Class{
    function(self, img, pos) 
        self.image = img
        self.position = pos
    end
}

function Tile:Draw()
    love.graphics.draw(self.image, self.bounds.x, self.bounds.y)
end

