require("player")
require("ball")
require("ai")


function love.load()
   pause = false
   Player:load()
   Ball:load()
   AI:load()

   score = {player = 0, ai = 0}
   font = love.graphics.newFont(30)
end


function love.update(dt)
   function love.keypressed(key, unicode)
		if key == 'escape' then pause = not pause end
	end
   Player:update(dt)
   Ball:update(dt)
   AI:update(dt)
end


function love.draw()
   if pause then love.graphics.print("je moet ALT + F4 doen",0,0) else 
      love.graphics.print("Made By Tripaloski",0,0) end
   Player:draw()
   Ball:draw()
   AI:draw()
   love.graphics.print("Speler 1: "..score.player, 50, 50)
   love.graphics.print("Speler 2: "..score.ai, 1700, 50)
end


function checkCollision(a, b)
   if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
      return true
   else
      return false
   end
end

