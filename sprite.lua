Sprite = {}

Sprite.new = function (image)
	local self = {}

	self.image = image
	self.x = 0
	self.y = 0
	self.ox = 0
	self.oy = 0
	self.zoom_x = 1
	self.zoom_y = 1
	self.orientation = 0

	self.draw = function ()
		love.graphics.draw(
			self.image,
			self.x, self.y, self.orientation,
			self.zoom_x, self.zoom_y,
			self.ox, self.oy
		)
	end

	return self
end

return Sprite
