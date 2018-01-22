-- Map Scene

function MapScene()
	local self = SceneManager.newScene(love.graphics.getWidth(), love.graphics.getHeight())

	local tilesA = love.graphics.newImage("TankWarsTiles.png")
	tilesA:setFilter("nearest", "nearest")
	local Tiles = require("TiledMap").new(8, 8, 2,
		{{1,2,4,11,11,16,11,5,
			1,1,10,2,1,10,3,10,
			4,11,7,1,1,10,2,10,
			10,1,3,1,1,12,1,10,
			10,1,14,1,1,1,3,10,
			10,2,10,1,2,4,11,7,
			10,1,10,3,1,10,3,1,
			6,11,17,11,11,7,1,2},
		 {8,-1,-1,-1,28,-1,28,0,
		 	-1,-1,-1,28,8,-1,8,-1,
		 	-1,-1,28,8,-1,-1,-1,-1,
		 	-1,-1,8,-1,-1,28,28,-1,
		 	-1,-1,-1,-1,-1,8,8,-1,
		 	-1,28,-1,9,28,-1,-1,-1,
		 	-1,8,-1,8,8,-1,-1,28,
		 	0,-1,-1,-1,-1,-1,-1,8}},
		{{tex = tilesA, w = 8, h = 4},
		 {tex = tilesA, w = 8, h = 4}}
	)
	Tiles.zoom = 32
	Tiles.save("Map001.dat")

	local sprite = require("Sprite").new(tilesA, 8, 4)
	sprite.x = 0
	sprite.y = 64
	sprite.zoom_x = 2
	sprite.zoom_y = 2
	sprite.set_frame(20)

	local count = 0

	self.update = function(dt)
		if (love.keyboard.isDown("w")) then
			sprite.set_frame(20)
			sprite.y = sprite.y - 32 * dt
		elseif (love.keyboard.isDown("a")) then
			sprite.set_frame(21)
			sprite.x = sprite.x - 32 * dt
		elseif (love.keyboard.isDown("s")) then
			sprite.set_frame(22)
			sprite.y = sprite.y + 32 * dt
		elseif (love.keyboard.isDown("d")) then
			sprite.set_frame(23)
			sprite.x = sprite.x + 32 * dt
		end
	end

	self.draw = function()
		Tiles.draw()
		sprite.draw()
		love.graphics.print("MapScene", 10, 10)
	end

	return self
end

return MapScene
