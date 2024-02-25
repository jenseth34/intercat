io.stdout:setvbuf("no")
require "colors"

local scene = {}

Game = Object:extend()

function Game:new(done)
  self.done = done
end

--to put in game.lua
function Game:load()
  Object = require "lib.classic"
  tick = require "lib.tick"
  require "target"
  require "player"
  
  player = Player(350, 500, 400)
  
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


function Game:update(dt)
  player:move(dt)
  tick.update(dt)
  
  local removeRectangle = {}
  
  --to put in game.lua
  for i, v in ipairs(listOfRectangle) do
    if v:checkCollisions(player) then
      table.remove(listOfRectangle, i)
      points = points + 10
    end
    if v:outOfBounds() then
      table.remove(listOfRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfRectangle) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    if v:checkCollisions(player) then
      table.remove(listOfRedRectangle, i)
      points = points - 10
    end
    if v:outOfBounds() then
      table.remove(listOfRedRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    if v:checkCollisions(player) then
      table.remove(listOfEndRectangle, i)
      self.done = true
    end
    if v:outOfBounds() then
      table.remove(listOfEndRectangle, i)
    end
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    v:update(dt)
  end
  
end

function Game:draw()
  player:draw()
  
  graphicPoints = {black, points}
  
  love.graphics.print(graphicPoints, 50, 50)
  
  for i, v in ipairs(listOfRectangle) do
    v:draw()
  end
  
  for i, v in ipairs(listOfRedRectangle) do
    v:draw()
  end
  
  for i, v in ipairs(listOfEndRectangle) do
    v:draw()
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
    Target:createTarget("assets/Mouse.png", listOfRectangle, 50)
  else
    Target:createTarget("assets/Water.png", listOfRedRectangle, 50)
  end
end

function spawnEnd()
  tick.delay(function () drawEndRectangle = true end, 10)
  
  Target:createTarget("assets/Desktop.png", listOfEndRectangle, 50)
end