local Rect = {}

Rect.new = function (x, y, w, h)
	local self = {}
	self.x = x
	self.y = y
	self.w = w
	self.h = h
	return self
end

return Rect
