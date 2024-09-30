local image = love.graphics.newImage("assets/images/lightDot.png")
image:setFilter("linear", "linear")

local ps = love.graphics.newParticleSystem(image, 77)
ps:setColors(1, 1, 1, 0, 1, 1, 1, 0.5, 1, 1, 1, 1, 1, 1, 1, 0.49609375, 1, 1, 1, 0)
ps:setDirection(-1.5707963705063)
ps:setEmissionArea("uniform", 59.281661987305, 2.7221171855927, 0, false)
ps:setEmissionRate(11.058518409729)
ps:setEmitterLifetime(-1)
ps:setInsertMode("top")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(90, 90)
ps:setParticleLifetime(4.1288161277771, 6.4026784896851)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(0, 0)
ps:setSizes(0.63178646564484, 0.45021045207977, 0.26639673113823, 0.16207575798035)
ps:setSizeVariation(1)
ps:setSpeed(97.194007873535, 208.24954223633)
ps:setSpin(0, 0)
ps:setSpinVariation(0)
ps:setSpread(0)
ps:setTangentialAcceleration(0, 0)

return ps