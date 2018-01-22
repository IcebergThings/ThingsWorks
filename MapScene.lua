-- Map Scene

function MapScene()
	local self = SceneManager.newScene(love.graphics.getWidth(), love.graphics.getHeight())

	local tilesA = love.graphics.newImage("TankWarsTiles.png")
	tilesA:setFilter("nearest", "nearest")
	local Tiles = require("TiledMap").new_from_file(
		"Map001.dat",
		{{tex = tilesA, w = 8, h = 4},
		 {tex = tilesA, w = 8, h = 4}}
	)
	Tiles.zoom = 32

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
