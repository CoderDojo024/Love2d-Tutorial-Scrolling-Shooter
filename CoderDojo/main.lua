require 'functies'


-- variabele om het plaatje in op te slaan
spelersVliegtuig = nil

function love.load(arg)
  -- laadt het plaatje in de variabele
  spelersVliegtuig = love.graphics.newImage('plaatjes/spelersVliegtuig.png')
end


function love.draw(dt)
  -- teken het plaatje op het scherm
  love.graphics.draw(spelersVliegtuig, 100, 100)
end

