local scene = {}

function scene.load()
  Object = require "lib.classic"
  require "game"
  
  level = Game(false, 175, 250, 0.5, 25)
  
  level:load()
end

function scene.update(dt)
  level:update(dt)
  
  if level.done == true then
    SM.load("gameover")
  end
end

function scene:draw()
  level:draw()
  
  text = {white, "Level 3"}
  
  love.graphics.print(text, 350, 25)
end

return scene