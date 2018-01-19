local SceneManager = require "scene"
local MainScene

function love.load()
  font=love.graphics.newFont("wqy-microhei-lite.ttc",16)
  font:setFilter("linear", "linear")
  love.graphics.setFont(font)

  MainScene = require("MainScene")
  SceneManager.load(MainScene)
end

function love.mousepressed(x, y, button, isTouch)
  SceneManager.mousepressed(x, y, button, isTouch)
end

function love.mousereleased(x, y, button, isTouch)
  SceneManager.mousereleased(x, y, button, isTouch)
end

function love.keypressed(key, scancode, isrepeat)
  SceneManager.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key)
  SceneManager.keyreleased(key)
end

function love.update(dt)
  SceneManager.update(dt)
end

function love.draw()
  love.graphics.clear()

  SceneManager.draw()

  love.graphics.setColor(255, 255, 255)
  love.graphics.print("FPS "..love.timer.getFPS(), 3, 3)
end
