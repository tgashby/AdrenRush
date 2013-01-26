require("Barrier")
require("BarrierDestroyer")
require("Consumable")
require("Door")
require("Floor")
require("Globals")
require("Key")
require("Level")
require("Map")
require("Player")
require("Tile")
require("Wall")

function love.load()
    -- Load everything you need!
    player = Player("img/player.png", Vector2D(100, 100))
end

function love.update(dt)
    -- Called as often as possible
    -- dt is the time, in seconds, since update was last called
end

function love.draw()
    -- Called every frame
    -- Draw all your entities!
end

function love.mousepressed(x, y, button)
    -- Called whenever the mouse is pressed
    -- x,y - the position of the mouse on the screen, in screen coords
    -- button - 'l', 'r', 'm', 'wd' (wheel down), 'wu' (wheel up), 'x1' (button 4),
    -- 'x2' (button 5)
end

function love.mousereleased(x, y, button)
    -- Called when the mouse is released
    -- Same parameters as mousepressed
end

function love.keypressed(key, unicode)
    -- Called when a key is pressed
    -- key - 'a', 'b', etc, list available at https://love2d.org/wiki/KeyConstant
    -- unicode - the unicode value of the key pressed
end

function love.keyreleased(key, unicode)
    -- I think you get it by now
    if key == "escape" then
      love.event.push("quit")
    end
end
