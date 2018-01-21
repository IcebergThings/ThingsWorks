local Sprite = {}

Sprite.new = function (image, split_x, split_y)
	local self = {}

	self.image = image
	self.x = 0
	self.y = 0
	self.split_x = split_x
	self.split_y = split_y
	self.ox = 0
	self.oy = 0
	self.zoom_x = 1
	self.zoom_y = 1
	self.orientation = 0

	self.frame = 0
	local w = self.image:getWidth()
	local h = self.image:getHeight()
	self.quad = love.graphics.newQuad(0, 0, w / split_x, h / split_y, w, h)
	self.set_frame = function (frame)
		self.frame = frame
		local _, _, w, h = self.quad:getViewport()
		self.quad:setViewport(w * (frame % split_x), h * math.floor(frame / split_x), w, h)
	end
	self.set_frame(0)

	self.draw = function ()
		love.graphics.draw(
			self.image, self.quad,
			self.x, self.y, self.orientation,
			self.zoom_x, self.zoom_y,
			self.ox, self.oy
		)
	end

	return self
end

return Sprite
