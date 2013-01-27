local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Level = Class{
    function (self)
        self.tiles = {}
        self.barriers = {}
        self.beginning = nil
        self.ending = nil
        self.Spawn = {
            wall = function (x, y, id)
                self.tiles[#self.tiles + 1] = Wall(x, y, id)
            end,
            door = function (x, y, id)
                self.tiles[#self.tiles + 1] = Door(x, y, id)
            end,
            floor = function (x, y, id)
                self.tiles[#self.tiles + 1] = Floor(x, y, id)
            end,
            key = function (x, y, id)
                self.tiles[#self.tiles + 1] = Key(x, y, id)
            end,
            consumable = function (x, y, id)
                self.tiles[#self.tiles + 1] = Consumable(x, y, id)
            end,
            barrier = function (x, y, id)
                self.tiles[#self.tiles + 1] = Barrier(x, y, id)
                self.barriers[#self.barriers + 1] = self.tiles[#self.tiles]
            end,
            barrierdestroyer = function (x, y, id)
                self.tiles[#self.tiles + 1] = BarrierDestroyer(x, y, id)
            end,
            part = function (x, y, id)
                self.tiles[#self.tiles + 1] = Part(x, y, id)
            end,
            beginning = function (x, y, id)
                self.tiles[#self.tiles + 1] = Floor(x, y, id)
                self.beginning = Vector2D(x, y)
            end,
            ending = function (x, y, id)
                self.tiles[#self.tiles + 1] = Floor(x, y, id)
                self.ending = Vector2D(x, y)
            end
        }
    end
}

function Level:AddTile(x, y, id, name)
    self.Spawn[name](x, y, id)
end

function Level:Draw()
    local barriers = {}
    for i,v in ipairs(self.tiles) do
        v:Draw()
        -- love.graphics.setColor(0, 255, 0, 255)
        -- love.graphics.print(tostring(i), v.position.x, v.position.y)
        -- love.graphics.setColor(255, 255, 255, 255)
    end

    for i,v in ipairs(self.barriers) do
        v:Draw()
    end
end
function Level:Update(dt)
    for i,v in ipairs(self.tiles) do
        if v.Update then
            v:Update(dt)
        end
        -- love.graphics.setColor(0, 255, 0, 255)
        -- love.graphics.print(tostring(i), v.position.x, v.position.y)
        -- love.graphics.setColor(255, 255, 255, 255)
    end
end