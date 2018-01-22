local TiledMap = {}

TiledMap.new = function (w, h, layers, map, texture)

	local self = {}

	local layered_vertices = {}
	local mesh = {}

	self.map = map
	self.texture = texture

	self.x = 0
	self.y = 0
	self.zoom = 16

	self.w = w
	self.h = h

	for l = 1, layers do

	end

	self.generate = function ()
		-- Loop through each layer
		for l = 1, layers do
			-- Generate vertices for single layer
			local vertices = {}
			local tilex, tiley = self.texture[l]["w"], self.texture[l]["h"]
			local uvw, uvh = 1.0 / tilex, 1.0 / tiley
			for x = 1, self.w do
				for y = 1, self.h do
					local index = (y - 1) * w + x
					local tile = self.map[l][index]
					if tile >= 0 then
						local x0, y0 = x - 1, y - 1

						local uvx, uvy = uvw * (tile % tilex), uvh * math.floor(tile / tilex)

						vertices[index * 6 - 5] = {x0  , y0  , uvx    , uvy     , 255, 255, 255, 255}
						vertices[index * 6 - 4] = {x0+1, y0+1, uvx+uvw, uvy+uvh, 255, 255, 255, 255}
						vertices[index * 6 - 3] = {x0  , y0+1, uvx    , uvy+uvh, 255, 255, 255, 255}

						vertices[index * 6 - 2] = {x0  , y0  , uvx    , uvy     , 255, 255, 255, 255}
						vertices[index * 6 - 1] = {x0+1, y0  , uvx+uvw, uvy     , 255, 255, 255, 255}
						vertices[index * 6    ] = {x0+1, y0+1, uvx+uvw, uvy+uvh, 255, 255, 255, 255}
					else
						vertices[index * 6 - 5] = {0, 0, 0, 0, 255, 255, 255, 0}
						vertices[index * 6 - 4] = {0, 0, 0, 0, 255, 255, 255, 0}
						vertices[index * 6 - 3] = {0, 0, 0, 0, 255, 255, 255, 0}

						vertices[index * 6 - 2] = {0, 0, 0, 0, 255, 255, 255, 0}
						vertices[index * 6 - 1] = {0, 0, 0, 0, 255, 255, 255, 0}
						vertices[index * 6    ] = {0, 0, 0, 0, 255, 255, 255, 0}
					end
				end
			end
			-- Add into layers
			layered_vertices[l] = vertices
		end
	end

	self.generate_mesh = function ()
		for l = 1, layers do
			mesh[l] = love.graphics.newMesh(layered_vertices[l], "triangles", "static")
			mesh[l]:setTexture(texture[l]["tex"])
		end
	end

	self.update_mesh = function ()
		for l = 1, layers do
			mesh[l]:setVertices(layered_vertices[l], 1)
			mesh[l]:setTexture(texture[l]["tex"])
		end
	end

	self.generate()
	self.generate_mesh()

	self.draw = function ()
		love.graphics.push()
		love.graphics.translate(self.x, self.y)
		love.graphics.scale(self.zoom, self.zoom)
		for l = 1, layers do
			love.graphics.draw(mesh[l])
		end
		love.graphics.pop()
	end

	self.save = function (filename)
		local writer = require("binaryfile").new_writer(filename)
		writer.i32(0x57a7d4a3) -- ThingsWorks magic number
		writer.i32(0x70614dff) -- "\xffMap"
		writer.i32(self.w)
		writer.i32(self.h)
		writer.i32(layers)
		for l = 1, layers do
			for i = 1, self.w * self.h do
				writer.u8(0) -- variant type
				writer.u8(0) -- texture id, unsupported
				local tile = self.map[l][i]
				writer.u16(tile)
			end
		end
		writer.close()
	end

	return self
end

return TiledMap
