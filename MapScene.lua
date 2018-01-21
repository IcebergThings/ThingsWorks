-- Map Scene

function MapScene()
  local self = SceneManager.newScene(love.graphics.getWidth(), love.graphics.getHeight())

  local tilesA = love.graphics.newImage("TankWarsTiles.png")
  tilesA:setFilter("nearest", "nearest")
  local Tiles = require("TiledMap").new(8,8,2,
    {{1,2,4,11,11,16,11,4,
      1,1,10,2,1,10,3,10,
      4,11,7,1,1,10,2,10,
      10,1,3,1,1,12,1,10,
      10,1,14,1,1,1,3,10,
      10,2,10,1,2,4,11,7,
      10,1,10,3,1,10,3,1,
      4,11,16,11,11,7,1,2},
     {8,-1,-1,-1,20,16,20,0,
      -1,-1,-1,20,8,-1,8,-1,
      -1,-1,20,8,-1,-1,-1,-1,
      -1,-1,8,-1,-1,20,20,-1,
      -1,-1,-1,-1,-1,8,8,-1,
      -1,20,-1,9,20,-1,-1,-1,
      -1,8,-1,8,8,-1,-1,20,
      0,-1,17,-1,-1,-1,-1,8}},
    {{tex = tilesA, w = 8, h = 3},
     {tex = tilesA, w = 8, h = 3}}
  )
  Tiles.zoom = 32

  local count = 0

  self.update = function()
    count = count + 0.1
    Tiles.x = math.sin(count) * 10 + 50
    Tiles.y = math.cos(count) * 10 + 50
    Tiles.zoom = math.sin(count) * 10 + 32
  end

  self.draw = function()
    love.graphics.print("MapScene", 10, 10)

    Tiles.draw()
  end

  return self
end

return MapScene
