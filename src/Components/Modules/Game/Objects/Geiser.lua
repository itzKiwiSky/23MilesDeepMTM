local Geiser = {}
Geiser.__index = Geiser

local function _new(x, y, direction, attackTime, attackCooldown)
    local self = setmetatable({}, Geiser)
    self.x = x or 0
    self.y = y or 0
    self.assets = {}
    self.assets.sheet, self.assets.quads = love.graphics.getQuads("assets/images/geiser")
    self.assets.particles = require 'src.Components.Modules.Game.Particles.GeiserSplash'
    self.direction = direction or 1
    self.attackTime = attackTime or 2.4
    self.attackCooldown = attackCooldown or 5

    self.attackHitbox = {
        x = self.x,
        y = self.y + 8,
        w = world.width,
        h = 16
    }

    self.assets.particles:stop()

    self.meta = {}
    self.meta.timer = self.attackCooldown
    self.meta.state = "idle"
    return self
end

function Geiser:draw()
    love.graphics.draw(self.assets.sheet, self.assets.quads[self.direction], self.x, self.y, 0, 2, 2)
    love.graphics.setBlendMode("add")
    if self.direction == 1 then
        love.graphics.draw(self.assets.particles, self.x + 32, self.y + 16, math.rad(0))
    elseif self.direction == 2 then
        love.graphics.draw(self.assets.particles, self.x - 16, self.y + 32, math.rad(90))
    elseif self.direction == 3 then
        love.graphics.draw(self.assets.particles, self.x + 32, self.y - 16, math.rad(180))
    elseif self.direction == 4 then
        love.graphics.draw(self.assets.particles, self.x + 32, self.y + 32, math.rad(270))
    end
    love.graphics.setBlendMode("alpha")
end

function Geiser:update(elapsed)
    self.assets.particles:update(elapsed)

    if self.meta.state == "idle" then
        self.meta.timer = self.meta.timer - elapsed
        if self.meta.timer <= 0 then
            self.meta.state = "attack"
            self.assets.particles:start()
            self.meta.timer = self.attackTime
        end
    elseif self.meta.state == "attack" then
        self.meta.timer = self.meta.timer - elapsed
        if self.meta.timer <= 0 then
            self.meta.state = "idle"
            self.assets.particles:stop()
            self.meta.timer = self.attackCooldown
        end
    end
    
end

return setmetatable(Geiser, { __call = function(_, ...) return _new(...) end })