require 'functies'

stapGrootte = 2
spelerY = 560
spelerX = 200

-- variabelen om eigenschappen van de speler in op te slaan
speler = { x = spelerX, y = spelerY, plaatje = nil }
-- lijst om vijanden in op te slaan
vijanden = {}
-- lijst om kogels in op te slaan
kogels = {}

function love.load(arg)
  -- laadt het plaatje in eigenschap plaatje van de variabele speler
  speler.plaatje = love.graphics.newImage('plaatjes/spelersVliegtuig.png')
  -- laadt het plaatje van de vijand
  vijandPlaatje = love.graphics.newImage('plaatjes/vijandsVliegtuig.png')
  -- laadt het plaatje van de kogel
  kogelPlaatje = love.graphics.newImage('plaatjes/kogel.png')
end

function love.draw(dt)
  -- teken het plaatje op het scherm
  love.graphics.draw(speler.plaatje, speler.x, speler.y)
  -- teken de vijanden in de lijst
  tekenVijanden(vijanden)
  -- teken de kogels in de lijst
  tekenKogels(kogels)
end

function love.update(dt)

  -- als de spatiebalk wordt ingedrukt
  if love.keyboard.isDown('space') then
    -- schiet dan
    maakNieuweKogel(kogels, speler)
  end
  
  -- voor elke kogel in de lijst
  for index, kogel in ipairs(kogels) do
    
    -- beweeg de kogel naar boven
    kogel.y = kogel.y - (2 * stapGrootte)
    
    -- als de kogel de bovenrand heeft bereikt
    if kogel.y < -20 then
      -- verwijder het uit de lijst
      table.remove(kogels, index)
    end
  end
  

  maakNieuweVijand(vijanden)  

  -- voor elke vijand in de lijst  
  for index, vijand in ipairs(vijanden) do

    -- laat de vijand een stapje naar beneden doen  
    vijand.y = vijand.y + stapGrootte
    
    -- als de vijand de onderrand heeft bereikt
    if vijand.y > yOnderRand() then
      -- verwijder de vijand als ie buiten het venster is verdwenen
      table.remove(vijanden, index)
    end
  end
  
  -- als pijltje naar links ingedrukt
  if love.keyboard.isDown('left') then
    -- en de linker rand is nog niet bereikt
    if speler.x > 0 then
      -- dan doe een stap naar links
      speler.x = speler.x - stapGrootte
    end

  -- als pijltje naar rechts ingedrukt
  elseif love.keyboard.isDown('right') then
    -- en de rechter rand is nog niet bereikt
    if speler.x < xRechterRand() then
      -- dan doe een stap naar rechts
      speler.x = speler.x + stapGrootte
    end
  end
end