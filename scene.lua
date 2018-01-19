local SceneManager = {}
local sc

SceneManager.load = function(new)
  SceneManager.current = new
  sc = SceneManager.current
end

-- Prototype of Scene
SceneManager.newScene = function(w,h)
  self = {}

  self.canvas = love.graphics.newCanvas(w,h)

  self.mousepressed = function(x, y, button, isTouch)
  end

  self.mousereleased = function(x, y, button, isTouch)
  end

  self.keypressed = function(key, scancode, isrepeat)
  end

  self.keyreleased = function(key)
  end

  self.update = function(dt)
  end

  self.draw = function()
  end

  return self
end

SceneManager.mousepressed = function(x, y, button, isTouch)
  sc.mousepressed(x, y, button, isTouch)
end

SceneManager.mousereleased = function(x, y, button, isTouch)
  sc.mousereleased(x, y, button, isTouch)
end

SceneManager.keypressed = function(key, scancode, isrepeat)
  sc.keypressed(key, scancode, isrepeat)
end

SceneManager.keyreleased = function(key)
  sc.keyreleased(key)
end

SceneManager.update = function(dt)
  sc.update(dt)
end

-- Render scene to canvas
SceneManager.draw = function()
  love.graphics.push()
--  love.graphics.setCanvas(sc.canvas)
--  love.graphics.clear()
--  love.graphics.setBlendMode("alpha")
  sc.draw()
--  love.graphics.setCanvas()
  love.graphics.pop()
  love.graphics.draw(sc.canvas)
end

return SceneManager
