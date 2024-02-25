io.stdout:setvbuf("no")
require "colors"

SM = require "lib.SceneMgr"

function love.load()
  SM.setPath("scenes/")
  
  SM.load("menu")
end

function love.update(dt)
  SM.update(dt)
end

function love.draw()
  SM.draw()
end