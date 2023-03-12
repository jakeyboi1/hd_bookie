-- Pulls and allows the use of VORP core
local VORPcore = {}

TriggerEvent("getCore", function(core)
  VORPcore = core
end)
--end of pulling vorpcore

--This keeps the shop ped from spawning multiple times
local shoppedspawn = 0 --creates a variable that is set to 0 on server start
RegisterServerEvent('pedspawns') --registers a server event
AddEventHandler('pedspawns', function() --makes the server event have some code to run
  for k, v in pairs(Config.Setup) do --for the amount of table in the config repeat(runs this code once per table in config)
    if shoppedspawn == 0 then --if the variable is 0 then meaning if code hasnt been run already
      TriggerClientEvent('pedspawn', source) --triggers the client event that spawns the ped
    end
  end
  shoppedspawn = shoppedspawn + 1 --sets the variable to 1 so this event cant run again until script or server restart
end)

--This part of the code catches the information from the players bet amount
RegisterServerEvent('bookiecatchinputforsell') --creates server event
AddEventHandler('bookiecatchinputforsell', function(qty) --makes event have code to run and recieves the qty varibale from menusetup lua
  TriggerClientEvent('betplaced', source, qty) --triggers client event and passes the qty variable to it
end)

--Cooldown setups
--This is the variables used to create cooldowns for each bookie
local valcdown = false
local bwcdown = false
local annesburgcdown = false
local armadillocdown = false
local sdcdwon = false

RegisterServerEvent('fightbegin') --creates a server event that checks if you actually have the money you tried to bet if so and its not on cooldown it starts the fight
AddEventHandler('fightbegin', function(qty, fighterbeton, table) --makes the event have code to run and catches the 3 variables from the client
  local Character = VORPcore.getUser(source).getUsedCharacter --gets the character used by the player
  if Character.money >= qty then --if the money you have is greater or equal to your bet amount then
    if table.location == 'val' then --the table is val then
      if valcdown == false then --if val cooldown is false then
        valcdown = true --makes cooldown true
        TriggerClientEvent('fightstartt', source, qty, fighterbeton, table) --triggers client event and passes variables
        Wait(table.cooldown) --waits the set time
        valcdown = false --resets cooldown so code can run again
      elseif valcdown == true then --if it is on cooldown then
        TriggerClientEvent('bookiecdown', source) --trigger client event that notifies its on cooldown
      end
    elseif table.location == 'bw' then
      if bwcdown == false then
        bwcdown = true
        TriggerClientEvent('fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        valcdown = false
      elseif bwcdown == true then
        TriggerClientEvent('bookiecdown', source)
      end
    elseif table.location == 'sd' then
      if sdcdwon == false then
        sdcdwon = true
        TriggerClientEvent('fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        sdcdwon = false
      elseif sdcdwon == true then
        TriggerClientEvent('bookiecdown', source)
      end
    elseif table.location == 'armadillo' then
      if armadillocdown == false then
        armadillocdown = true
        TriggerClientEvent('fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        armadillocdown = false
      elseif armadillocdown == true then
        TriggerClientEvent('bookiecdown', source)
      end
    elseif table.location == 'annesburg' then
      if annesburgcdown == false then
        annesburgcdown = true
        TriggerClientEvent('fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        annesburgcdown = false
      elseif annesburgcdown == true then
        TriggerClientEvent('bookiecdown', source)
      end
    end
  elseif Character.money < qty then --if you do not have the money then
    TriggerClientEvent('notenoughcash', source) --triggers the cleint event that prints you do not have the money
  end
end)

--these events handle the adding and removal of cash
RegisterServerEvent('fightoveraddmoney')
AddEventHandler('fightoveraddmoney', function(qty)
  local Character = VORPcore.getUser(source).getUsedCharacter
  Character.addCurrency(0, qty)
end)

RegisterServerEvent('fightoverremovemoney')
AddEventHandler('fightoverremovemoney', function(qty)
  local Character = VORPcore.getUser(source).getUsedCharacter
  Character.removeCurrency(0, qty)
end)