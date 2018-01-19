-- Demo game for all these stuff
-- This is the title screen, which is the entry of game

local SceneManager = require("scene")
local Button = require "button"

self = SceneManager.newScene(love.graphics.getWidth(), love.graphics.getHeight())

local btn0, btn1, btn2
local title_img = love.graphics.newImage("TankWarsTitle.png")

btn0 = Button.new(220,290,200,40)
btn0.title = "New Game"

btn1 = Button.new(220,335,200,40)
btn1.title = "Load Game"
btn1.disabled = true

btn2 = Button.new(220,380,200,40)
btn2.title = "Exit"
btn2.callback = function()
  love.event.quit()
end

self.mousepressed = function(x, y, button, isTouch)
  btn0.onMousePress(x,y)
  btn1.onMousePress(x,y)
  btn2.onMousePress(x,y)
end

self.mousereleased = function(x, y, button, isTouch)
  btn0.onMouseRelease(x,y)
  btn1.onMouseRelease(x,y)
  btn2.onMouseRelease(x,y)
end

self.update = function(dt)
  btn0.update(dt)
  btn1.update(dt)
  btn2.update(dt)
end

self.draw = function()
  love.graphics.draw(title_img)

  btn0.draw()
  btn1.draw()
  btn2.draw()
end

return self
