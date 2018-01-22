local BinaryFile = {}

function BinaryFile.new_reader(filename)
	local self = {}
	self.file = io.open(filename, "rb")
	if not self.file then
		return nil
	end
	self.close = function ()
		self.file:close()
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

function BinaryFile.new_writer(filename)
	local self = {}
	self.file = io.open(filename, "wb")
	if not self.file then
		return nil
	end
	self.close = function ()
		self.file:close()
	end
	self.u8 = function (data)
		self.file:write(string.char(data))
	end
	self.u16 = function (data)
		self.file:write(string.char(
			bit.band(data, 255),
			bit.band(bit.rshift(data, 8), 255)
		))
	end
	self.i32 = function (data)
		self.file:write(string.char(
			bit.band(data, 255),
			bit.band(bit.rshift(data, 8), 255),
			bit.band(bit.rshift(data, 16), 255),
			bit.band(bit.rshift(data, 24), 255)
		))
	end
	return self
end

return BinaryFile
