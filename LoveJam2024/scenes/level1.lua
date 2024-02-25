local scene = {}

function scene.load()
  Object = require "lib.classic"
  require "game"
  
  level = Game(false)
  
  level:load()
end

function scene.update(dt)
  level:update(dt)
  
  if level.done == true then
    SM.load("transition")
  end
end

function scene:draw()
  level:draw()
end

return scene