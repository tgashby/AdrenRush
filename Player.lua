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
        self.leftHandForward = false
        self.altImage = love.graphics.newImage(Globals.IMAGE_DIR .. "player_2.png")
		self.inventory = {} 
		self.heartSound = love.audio.newSource("Music/pulse1.wav")
		self.inventory = {
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false
		}
		self.tempInventory = {
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false
		}
    end
}

function Player:Draw()
    local image = self.leftHandForward and self.image or self.altImage
    love.graphics.draw(image, self.position.x + 16, self.position.y + 16, math.rad(90 * self.directions[self.dir]), 1, 1, 
        self.image:getWidth() / 2, self.image:getHeight() / 2)
end

function Player:Update(dt)
    self.beatPercent = self.beatPercent + self.heartRate * dt / 60
    self.beatIncreaseTimer = self.beatIncreaseTimer + dt

    if self.beatPercent >= 1 then
        self:Move()
		love.audio.newSource("Music/pulse1.wav", "static"):play()
        onPart, part = Map.CollidesWith("part", self.position)
		if onPart then
			part:usePart()
		end
		onCons, cons = Map.CollidesWith("consumable", self.position)
		if onCons then
			cons:UseConsumable()
		end
		onKey, key = Map.CollidesWith("key", self.position)
		if onKey then
			key:useKey()
		end
		if self.position == Map.levels[Map.currentLevel].ending then
			self.inventory = self.tempInventory
			Map:nextLevel()
		end
        self.beatPercent = 0
		
    end

    if self.beatIncreaseTimer > 1 then
        self.heartRate = self.heartRate + 2
        self.beatIncreaseTimer = 0
		
    end
	if self.heartRate > 240 then
		Map:Reset()
	end
end

function Player:Move()
    if self.nextDir ~= "" then
        if self.nextDir == "up" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x, self.position.y - Globals.TILE_SIZE)) then
				willDoor, door = Map.CollidesWith("door", Vector2D(self.position.x, self.position.y - Globals.TILE_SIZE))
				if not willDoor or willDoor and not door.closed then
					self.position.y = self.position.y - Globals.TILE_SIZE
				end
            end
        elseif self.nextDir == "left" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x - Globals.TILE_SIZE, self.position.y)) then
				willDoor, door = Map.CollidesWith("door", Vector2D(self.position.x - Globals.TILE_SIZE, self.position.y))
				if not willDoor or willDoor and not door.closed then
					self.position.x = self.position.x - Globals.TILE_SIZE
				end
            end
        elseif self.nextDir == "right" then
            if not Map.CollidesWith("wall", Vector2D(self.position.x + Globals.TILE_SIZE, self.position.y)) then
				willDoor, door = Map.CollidesWith("door", Vector2D(self.position.x + Globals.TILE_SIZE, self.position.y)) 
				if not willDoor or willDoor and not door.closed then
					self.position.x = self.position.x + Globals.TILE_SIZE
				end
            end
        else
            if not Map.CollidesWith("wall", Vector2D(self.position.x, self.position.y + Globals.TILE_SIZE)) then
				willDoor, door = Map.CollidesWith("door", Vector2D(self.position.x, self.position.y + Globals.TILE_SIZE)) 
				if not willDoor or willDoor and not door.closed then
					self.position.y = self.position.y + Globals.TILE_SIZE
				end
            end
        end

        self.dir = self.nextDir
        self.nextDir = ""
    else
	Map.Reset()
	end
end

function Player:Reset()
	self.tempInventory = self.inventory
    self.heartRate = 60
    self.beatPercent = 0
    self.beatIncreaseTimer = 0
    self.dir = "up"
end