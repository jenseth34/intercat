Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height)
  Rectangle.super.new(self, x, y)
  self.width = width
  self.height = height
  self.speed = 100
end

function Rectangle:draw(mode, color)
  love.graphics.setColor(color)
  love.graphics.rectangle(mode, self.x, self.y, self.width, self.height)
end

function Rectangle:createRectangle(list)
  newRectangle = Rectangle(love.math.random(1, 600), 100, 100, 25)
  
  table.insert(list, newRectangle)
end