local Class = require('hump.class')
local Vector2D = require('hump.vector')

Tile = Class{
    function(self, img, pos, type) 
        self.image = love.graphics.newImage(img)
        self.position = pos
        self.type = type
    end
}

function Tile:Draw()
    love.graphics.draw(self.image, self.position.x, self.position.y)
end

