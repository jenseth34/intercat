local scene = {}

function scene.load()
end

function scene.update(dt)
  
  function love.keypressed(key)
    if key == "space" then
      SM.load("level1")
    end
  end
  
end

function scene.draw()
  
  text = {black, "Good Job! Press Space to continue"}
  
  love.graphics.print(text, 100, 100)
end

return scene