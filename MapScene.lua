-- Map Scene

function MapScene()
  local self = SceneManager.newScene(love.graphics.getWidth(), love.graphics.getHeight())

  self.draw = function()
    love.graphics.print("MapScene", 10, 10)
  end

  return self
end

return MapScene
