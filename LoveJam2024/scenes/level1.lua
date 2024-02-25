local scene = {}

function scene.load()
  function love.keypressed(key)
    if key == "space" then
      SM.load("game")
    end
  end
end

function scene.update(dt)
end

function scene.draw()
  love.graphics.print("Level 1", 100, 100)
end

return scene