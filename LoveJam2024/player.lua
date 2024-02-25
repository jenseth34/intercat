Player = Object:extend()

function Player:new(x, y, speed)
  self.image = love.graphics.newImage("assets/TheTigerCat.png")
  self.x = x
  self.y = y
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.speed = speed
end

function Player:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Player:move(dt)
  if love.keyboard.isDown("up") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("down") then
    self.y = self.y + self.speed * dt
  elseif love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  elseif love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end
  
  local window_width = love.graphics.getWidth()
  local window_height = love.graphics.getHeight()

  if self.x < 0 then
      self.x = 0
  elseif self.x + self.width > window_width then
      self.x = window_width - self.width
  end
  
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > window_height then
    self.y = window_height - self.height
  end
  
  
end
