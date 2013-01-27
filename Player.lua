local Class = require('hump.class')
local Vector2D = require('hump.vector')
require('Tile')

Player = Class {inherits = Tile,
    function(self, img, pos) 
        Tile.construct(self, img, pos, "player")
        self.dir = "up"
        self.directions = {up = 0, left = -1, right = 1, down = 2}
        self.nextDir = ""
        self.heartRate = 60
        self.beatPercent = 0
        self.beatIncreaseTimer = 0
		self.inventory = main.inventory
    end
}

function Player:Draw()
    love.graphics.draw(self.image, self.position.x + 16, self.position.y + 16, math.rad(90 * self.directions[self.dir]), 1, 1, 
        self.image:getWidth() / 2, self.image:getHeight() / 2)
end

function Player:Update(dt)
    self.beatPercent = self.beatPercent + self.heartRate * dt / 60
    self.beatIncreaseTimer = self.beatIncreaseTimer + dt

    if self.beatPercent >= 1 then
        self:Move()
		if onPart then
			part:usePart()
		end
		onCons, cons = Map.CollidesWith("consumable", self.position)
		if onCons then
			cons:useConsumable()
		end
        self.beatPercent = 0
    end

    if self.beatIncreaseTimer > 2 then
        self.heartRate = self.heartRate + 1
        self.beatIncreaseTimer = 0
    end
end

function Player:Move()
    if self.nextDir ~= "" then
        if self.nextDir == "up" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x, self.position.y - Globals.TILE_SIZE)) then
                self.position.y = self.position.y - Globals.TILE_SIZE
            end
        elseif self.nextDir == "left" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x - Globals.TILE_SIZE, self.position.y)) then
                self.position.x = self.position.x - Globals.TILE_SIZE
            end
        elseif self.nextDir == "right" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x + Globals.TILE_SIZE, self.position.y)) then
                self.position.x = self.position.x + Globals.TILE_SIZE
            end
        else
            if not Map.CollidesWith("wall", Vector2D(self.position.x, self.position.y + Globals.TILE_SIZE)) then
                self.position.y = self.position.y + Globals.TILE_SIZE
            end
        end

        self.dir = self.nextDir
        self.nextDir = ""
    end
end
