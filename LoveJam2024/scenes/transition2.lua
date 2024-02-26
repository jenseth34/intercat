local scene = {}

function scene.load()
end

function scene.update(dt)
  
  local count = 1
  
  function love.keypressed(key)
    if key == "space" then
      SM.load("level3")
    end
  end
  
end

function scene.draw()
  
  text = {white, "Good Job! Almost Done"}
  
  love.graphics.print(text, 100, 100)
end

return scene