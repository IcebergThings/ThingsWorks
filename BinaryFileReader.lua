local BinaryFileReader = {}

function BinaryFileReader.new(filename)
	local self = {}
	self.file = io.open(filename, "r")
	if not self.file then
		return nil
	end
	-- utilizing luajit 2 bit module
	self.u8 = function ()
		return self.file:read(1):byte(1)
	end
	self.u16 = function ()
		local a, b = self.file:read(2):byte(1, 2)
		return bit.bor(a, bit.lshift(b, 8))
	end
	self.i32 = function ()
		local a, b, c, d = self.file:read(4):byte(1, 4)
		return bit.bor(a, bit.lshift(b, 8), bit.lshift(c, 16), bit.lshift(d, 24))
	end
	return self
end
print(BinaryFileReader.new("BinaryFileReader.lua").i32())

return BinaryFileReader
