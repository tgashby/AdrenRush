local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Player = Class {inherits = Tile,
    function(self, img, pos) 
        Tile.construct(self, img, pos)
        self.dir = "up"
        self.directions = {up = 0, left = -1, right = 1, down = 2}
        self.nextDir = ""
        self.heartRate = 60
    end
}

function Player:Draw()
    love.graphics.draw(self.img, self.position.x, self.position.y, math.rad(90 * self.directions[self.dir]))
end

function Player:Move()
    if self.nextDir ~= "" then
        if dir == "up" then
            self.position.y = self.position.y - Globals.TILE_SIZE
        elseif dir == "left" then
            self.position.x = self.position.x - Globals.TILE_SIZE        
        elseif dir == "right" then
            self.position.x = self.position.x + Globals.TILE_SIZE
        else
            self.position.y = self.position.y + Globals.TILE_SIZE
        end
    end
end
