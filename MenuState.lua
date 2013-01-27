local GameState = require("hump.gamestate")
local Timer = require("hump.timer")

local PlayState = require("PlayState")

local Menu = GameState.new()
local Instructions = GameState.new()

function Menu:init()
	menuImage = love.graphics.newImage(Globals.IMAGE_DIR .. "cover.png")
    coalitionFont = love.graphics.newFont("Coalition_v2.ttf", 24)

	Timer.add(3, function ()
		GameState.switch(Instructions)
	end)
end

function Menu:draw()
	love.graphics.draw(menuImage, 0, 0)
end

function Menu:update(dt)
	Timer.update(dt)
end

function Instructions:init()
	instructionsImage = love.graphics.newImage(Globals.IMAGE_DIR .. "instructions.png")
end

function Instructions:enter(previous)
    levels = {
	
    
    "basic.png", 
    "levele1.png",
--    "levele2.png",
    "levele4.png",
    "levele5.png",
--    "levele6.png",
--    "levele7.png",
	--    "basic.png", 
    "levele1.png",
--    "levele2.png",
--    "levele3.png",
--    "levele3A.png",
    "levele4.png",
    "levele5.png",
--    "levele6.png",
--    "levele7.png",
	"levels13.png",
    "levels11.png",
    "levels12.png",
    }
    for i, v in ipairs(levels) do
       Map.GenerateLevel(Globals.LEVELS_DIR .. v)
    end
end

function Instructions:keypressed(key, unicode)
	GameState.switch(PlayState)
end

function Instructions:draw()
    love.graphics.setFont(coalitionFont)
	love.graphics.draw(instructionsImage, 0, 0)
    love.graphics.setColor(217, 167, 127, 255)
    love.graphics.print("Press Any Key To Begin", 300, 720)
    love.graphics.setColor(217, 255, 255, 255)
end

function Instructions:update(dt)
	Timer.update(dt)
end

return Menu