local Gamestate = require "hump.gamestate"

local Menu = require("MenuState")

function love.load()
    -- Register the game state dispatcher and switch into the initial state.
   Gamestate.registerEvents()
   Gamestate.switch(Menu)
end
