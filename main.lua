local Button = require "button"

function love.load()
  font=love.graphics.newFont("wqy-microhei-lite.ttc",16)
  font:setFilter("linear", "linear")
  love.graphics.setFont(font)

  btn0 = Button.new(15,15,200,50)
  btn0.title = "Hello Button"

  btn1 = Button.new(15,65,100,50)
  btn1.title = "Disabled"
  btn1.disabled = true

  btn2 = Button.new(15,200,200,100)
  btn2.title = "Large"
  btn2.text_scale_x = 1
  btn2.text_scale_y = 1
  btn2.callback = function()
    btn2.w = btn2.w + 1
    btn2.h = btn2.h + 1
  end
end

function love.mousepressed(x, y, button, isTouch)
  btn0.onMousePress(x,y)
  btn1.onMousePress(x,y)
  btn2.onMousePress(x,y)
end

function love.mousereleased(x, y, button, isTouch)
  btn0.onMouseRelease(x,y)
  btn1.onMouseRelease(x,y)
  btn2.onMouseRelease(x,y)
end

function love.update(dt)
  btn0.update(dt)
  btn1.update(dt)
  btn2.update(dt)
end

function love.draw()
  love.graphics.print("Hello World 中文爆炸", 400, 300)

  btn0.draw()
  btn1.draw()
  btn2.draw()
end
