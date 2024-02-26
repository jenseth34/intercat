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
  
  love.graphics.setNewFont(20)
  text = {white, "Congrats! Here are your scores: "}
  love.graphics.print(text, 100, 100)
  
  sum = 0
  for i, v in ipairs(score) do
    love.graphics.print("Level "..i..": "..v, 100, 150 + 50 * i)
    sum = sum + v
  end
  
  love.graphics.print("Total: "..sum, 500, 500)
  love.graphics.setNewFont(12)
  love.graphics.print("Press Space to quit", 500, 550)
  
end

return scene