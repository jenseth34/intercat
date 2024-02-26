local scene = {}

function scene.load()
  Object = require "lib.classic"
  require "game"
  
  level = Game(false, 150, 200, 1, 20)
  
  level:load()
end

function scene.update(dt)
  level:update(dt)
  
  if level.done == true then
    SM.load("transition2")
  end
end

function scene:draw()
  level:draw()
  
  text = {white, "Level 2"}
  
  love.graphics.print(text, 350, 25)
end

return scene