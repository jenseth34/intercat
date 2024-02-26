require "colors"

local scene = {}

function scene.load()
  nippo_font = love.graphics.newFont("assets/Nippo-Medium.ttf", 80)
  
  song = love.audio.newSource("assets/Intercat.wav", "stream")
  song:setLooping(true)
  song:play()
  
  love.graphics.setBackgroundColor(teal)
end

function scene.update(dt)
  
  function love.keypressed(key)
    if key == "space" then
      SM.load("level1")
    end
  end
  
end

function scene.draw()
  intercat = {white, "Intercat"}
  love.graphics.setFont(nippo_font)
  love.graphics.print(intercat, 250, 250)
  
  start = {white, "Press space to start"}
  love.graphics.setNewFont(20)
  love.graphics.print(start, 275, 350)
end

return scene
