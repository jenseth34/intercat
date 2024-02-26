local scene = {}

function scene.load()
end

function scene.update(dt)
  
  local count = 1
  
  function love.keypressed(key)
    if key == "space" then
      love.event.quit(0)
    end
  end
  
end

function scene.draw()
  
  text = {white, "Good Job! Press Space to continue"}
  
  love.graphics.print(text, 100, 100)
end

return scene