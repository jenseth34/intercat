Target = Object:extend()

function Target:new(image, x, y, width, height, speed)
  self.image = love.graphics.newImage(image)
  self.x = x
  self.y = y
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.speed = speed
end

function Target:update(dt)
  self.y = self.y + self.speed * dt
end

function Target:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Target:createTarget(image, list, speed)
  newTarget = Target(image, love.math.random(1, 600), 50, self.width, self.height, speed)
  
  table.insert(list, newTarget)
end

function Target:checkCollisions(obj)
  local self_left = self.x
  local self_right = self.x + self.width
  local self_top = self.y
  local self_bottom = self.y + self.height
  
  local obj_left = obj.x
  local obj_right = obj.x + obj.width
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.height
  
  return self_right > obj_left and self_left < obj_right 
  and self_bottom > obj_top and self_top < obj_bottom
end

function Target:outOfBounds()
  return self.x < 0 or self.y < 0 
  or self.x + self.width > love.graphics.getWidth() 
  or self.y + self.height > love.graphics.getHeight()
end
