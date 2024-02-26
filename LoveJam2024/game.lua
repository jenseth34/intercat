io.stdout:setvbuf("no")
require "colors"

Game = Object:extend()
score = {}

function Game:new(done, speedTargets, speedEndTarget, delayTarget, delayEndTarget)
  self.done = done
  self.speedTargets = speedTargets
  self.speedEndTargets = speedEndTarget
  self.delayTarget = delayTarget
  self.delayEndTarget = delayEndTarget
end

--to put in game.lua
function Game:load()
  Object = require "lib.classic"
  tick = require "lib.tick"
  require "target"
  require "player"
  
  player = Player(350, 450, 400)
  
  listOfMice = {}
  listOfWater = {}
  listOfComputer = {}
  points = 0
  
  good_sfx = love.audio.newSource("assets/good.wav", "static")
  bad_sfx = love.audio.newSource("assets/bad.wav", "static")
  end_sfx = love.audio.newSource("assets/end.wav", "static")
  
  drawTarget = false
  drawEndTarget = false
  
  tick.delay(function () drawTarget = true end, self.delayTarget)
  tick.delay(function () drawEndTarget = true end, self.delayEndTarget)
  
end

function Game:update(dt)
  player:move(dt)
  tick.update(dt)
  
  --to put in game.lua
  for i, v in ipairs(listOfMice) do
    if v:checkCollisions(player) then
      table.remove(listOfMice, i)
      good_sfx:play()
      points = points + 10
    end
    if v:outOfBounds() then
      table.remove(listOfMice, i)
    end
  end
  
  for i, v in ipairs(listOfMice) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfWater) do
    if v:checkCollisions(player) then
      table.remove(listOfWater, i)
      bad_sfx:play()
      points = points - 10
    end
    if v:outOfBounds() then
      table.remove(listOfWater, i)
    end
  end
  
  for i, v in ipairs(listOfWater) do
    v:update(dt)
  end
  
  for i, v in ipairs(listOfComputer) do
    if v:checkCollisions(player) then
      table.remove(listOfComputer, i)
      table.insert(score, points)
      end_sfx:play()
      self.done = true
    end
    if v:outOfBounds() then
      table.remove(listOfComputer, i)
    end
  end
  
  for i, v in ipairs(listOfComputer) do
    v:update(dt)
  end
  
end

function Game:draw()
  player:draw()
  
  graphicPoints = {white, points}
  
  love.graphics.print(graphicPoints, 50, 25)
  
  for i, v in ipairs(listOfMice) do
    v:draw()
  end
  
  for i, v in ipairs(listOfWater) do
    v:draw()
  end
  
  for i, v in ipairs(listOfComputer) do
    v:draw()
  end
  
  if drawTarget == true then
    spawnObjects(self.speedTargets, self.delayTarget)
    drawTarget = false
  end
  
  if drawEndTarget == true then
    spawnEnd(self.speedEndTargets, self.delayEndTarget)
    drawEndTarget = false
  end
end

function spawnObjects(speed, delayTarget)
  tick.delay(function () drawTarget = true end, delayTarget)
  randValue = love.math.random(0, 1)
  
  if randValue == 1 then
    Target:createTarget("assets/Mouse.png", listOfMice, speed)
  else
    Target:createTarget("assets/Water.png", listOfWater, speed)
  end
end

function spawnEnd(speed, delayEndTarget)
  tick.delay(function () drawEndTarget = true end, delayEndTarget)
  
  Target:createTarget("assets/Desktop.png", listOfComputer, speed)
end