function xRechterRand()
  return love.graphics.getWidth() - speler.plaatje:getWidth()
end

function yOnderRand()
  return love.graphics.getHeight()
end

function xWillekeurig()
  return math.random(50, love.graphics.getWidth() - 50)
end

function tekenVijanden(vijanden)
  for index, vijand in ipairs(vijanden) do
    love.graphics.draw(vijand.plaatje, vijand.x, vijand.y)
  end
end

function tekenKogels(kogels)
  for index, kogel in ipairs(kogels) do
    love.graphics.draw(kogel.plaatje, kogel.x, kogel.y)
  end
end

nieuweVijandInterval = 100
nieuweVijandTimer = 0
function maakNieuweVijand(vijanden)
  if nieuweVijandTimer < 0 then
    nieuweVijand = { x = xWillekeurig(), y = -100, plaatje = vijandPlaatje }
    table.insert(vijanden, nieuweVijand)
    nieuweVijandTimer = nieuweVijandInterval
  else
    nieuweVijandTimer = nieuweVijandTimer - 1
  end
end

nieuweKogelInterval = 20
nieuweKogelTimer = 0
function maakNieuweKogel(kogels, speler)
  if nieuweKogelTimer < 0 then
    nieuweKogel = { x = speler.x + (speler.plaatje:getWidth()/2), y = spelerY, plaatje = kogelPlaatje }
    table.insert(kogels, nieuweKogel)
    nieuweKogelTimer = nieuweKogelInterval
  else
    nieuweKogelTimer = nieuweKogelTimer - 1
  end
end