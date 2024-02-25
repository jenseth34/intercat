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
  love.graphics.print("Menu", 100, 100)
end

return scene
