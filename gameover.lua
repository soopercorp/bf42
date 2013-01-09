gameover = {}

function gameover.load()
  gameover.dt_temp = 0
end

function gameover.draw()
  -- love.graphics.draw(imgs["title"],0,(gameover.dt_temp-1)*32*scale,0,scale,scale)
  love.graphics.setColor(fontcolor.r,fontcolor.g,fontcolor.b)
  -- Show after 2.5 seconds
  love.graphics.printf("Gameover",
    0,(gameover.dt_temp-1)*32*scale,love.graphics.getWidth(),"center")
  -- If previous game
  if game.score ~= 0 then
    love.graphics.printf("Score:"..game.score,0,96*scale,160*scale,"center")
  end
  -- Reset the color
  love.graphics.setColor(255,255,255)
end

function gameover.update(dt)
  -- Update dt_temp
  gameover.dt_temp = gameover.dt_temp + dt
  if debug then love.graphics.printf(gameover.dt_temp,0,80*scale,80*scale,"center") end
  -- Wait 2.5 seconds, then stop in place.
  if gameover.dt_temp > 2.5 then
    gameover.dt_temp = 2.5
  end
end

function gameover.keypressed(key)
  -- Change to game state, and init game.
  state = "splash"
  splash.load()
end
