-- Typical LOVE Functions you'll use, a few other also exist

function love.load()
    -- Load everything you need!
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
end

function love.focus(f)
    -- Called whenever the user clicks on or off the LOVE window
    -- f - boolean of whether focus gained or lost
    if f then
        print("LOVE Window now in focus!")
    else
        print("LOVE Window lost focus :-(")
    end
end

function love.quit()
    -- Called right before the LOVE application exits
end
