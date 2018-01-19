Button = {}

Button.new = function(x,y,w,h)
  local self = {}

  self.x = x
  self.y = y
  self.w = w
  self.h = h

  self.disabled = false
  self.hit = false
  self.hover = 0

  self.title = ""
  self.text_scale_x = 1
  self.text_scale_y = 1

  self.text_color = {r = 0, g = 0, b = 0}

  self.callback = function()
  end

  self.onMousePress = function(x,y)
    if not self.disabled and x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
      self.hit = true
    end
  end

  self.onMouseRelease = function(x,y)
    if not self.disabled and x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
      self.hit = false
      self.callback()
    end
  end

  self.update = function(dt)
    self.hover = math.max(self.hover - 2 * dt, 0)

    local x, y = love.mouse.getPosition()
    if x > self.x and x < self.x + self.w and y > self.y and y < self.y + self.h then
      self.hover = 1
    end
  end

  self.draw = function()
    if self.disabled then
      love.graphics.setColor(128, 128, 128)
      love.graphics.rectangle("fill", x, y, w, h)
      love.graphics.setColor(self.text_color.r * 0.5, self.text_color.g * 0.5, self.text_color.b * 0.5)
    else
      if self.hit then
        love.graphics.setColor(128, 128, 128)
        love.graphics.rectangle("fill", x, y, w, h)
        love.graphics.setColor(204, 204, 204)
        love.graphics.rectangle("fill", x+1, y+1, w-2, h-2)
      else
        local b = self.hover * 0.2 + 0.8
        love.graphics.setColor(160 * b, 160 * b, 160 * b)
        love.graphics.rectangle("fill", x, y, w, h)
        love.graphics.setColor(255 * b, 255 * b, 255 * b)
        love.graphics.rectangle("fill", x+1, y+1, w-2, h-2)
      end
      love.graphics.setColor(self.text_color.r, self.text_color.g, self.text_color.b)
    end
    love.graphics.printf(self.title, x, y + h * 0.5 - 8 * self.text_scale_y, w, "center", 0, self.text_scale_x, self.text_scale_y)
  end

  return self
end

return Button
