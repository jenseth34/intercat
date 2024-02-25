io.stdout:setvbuf("no")
require "colors"

local scene = {}

function scene.load()
  Object = require "lib.classic"
  tick = require "lib.tick"
  require "shape"
  require "rectangle"
  
  player = Rectangle(350, 500, 100, 25)
  listOfRectangle = {}
  listOfRedRectangle = {}
  listOfEndRectangle = {}
  points = 0
  
  --Create a boolean
  drawRectangle = false
  drawEndRectangle = false
  
  tick.delay(function () drawRectangle = true end, 2)
  tick.delay(function () drawEndRectangle = true end, 10)
  
  love.graphics.setBackgroundColor(1, 1, 1)
end

function scene.update(dt)
  player:move(dt)
  tick.update(dt)
  
  local removeRectangle = {}
  
  for i, v in ipairs(listOfRectangle) do
    if checkCollisions(player, v) then
      table.remove(listOfRectangle, i)
      points = points + 10
    end
    if outOfBounds(v) then
      table.remove(listOfRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfRectangle) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    if checkCollisions(player, v) then
      table.remove(listOfRedRectangle, i)
      points = points - 10
    end
    if outOfBounds(v) then
      table.remove(listOfRedRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    if checkCollisions(player, v) then
      table.remove(listOfEndRectangle, i)
      points = points - 10
    end
    if outOfBounds(v) then
      table.remove(listOfEndRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    v:update(dt)
  end
  
end

function scene:draw()
  player:draw("line", blue)
  
  love.graphics.setColor(black)
  love.graphics.print(points, 50, 50)
  
  for i, v in ipairs(listOfRectangle) do
    v:draw("line", green)
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    v:draw("line", red)
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    v:draw("line", black)
  end
  
  if drawRectangle == true then
    spawnObjects()
    drawRectangle = false
  end
  
  if drawEndRectangle == true then
    spawnEnd()
    drawEndRectangle = false
  end
  
end

function spawnObjects()
  tick.delay(function () drawRectangle = true end, 2)
  randValue = love.math.random(0, 1)
  
  if randValue == 1 then
    Rectangle:createRectangle(listOfRectangle)
  else
    Rectangle:createRectangle(listOfRedRectangle)
  end
end

function spawnEnd()
  tick.delay(function () drawEndRectangle = true end, 10)
  
  Rectangle:createRectangle(listOfEndRectangle)
end

function checkCollisions(a, b)
  local a_left = a.x
  local a_right = a.x + a.width
  local a_top = a.y
  local a_bottom = a.y + a.height
  
  local b_left = b.x
  local b_right = b.x + b.width
  local b_top = b.y
  local b_bottom = b.y + b.height
  
  return a_right > b_left and a_left < b_right 
  and a_bottom > b_top and a_top < b_bottom
end

function outOfBounds(a)
  return a.x < 0 or a.y < 0 
  or a.x + a.width > love.graphics.getWidth() 
  or a.y + a.height > love.graphics.getHeight()
end

return scene