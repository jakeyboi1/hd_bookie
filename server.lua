--[[##########################Pulling Essentials##############################################]]
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)

--[[################Variable reciever############################]]
RegisterServerEvent('hd_bookie:bookiecatchinputforsell') --creates server event
AddEventHandler('hd_bookie:bookiecatchinputforsell', function(qty) --makes event have code to run and recieves the qty varibale from menusetup lua
  TriggerClientEvent('hd_bookie:betplaced', source, qty) --triggers client event and passes the qty variable to it
end)

--[[#########################Cooldown Setup#################################]]
--This is the variables used to create cooldowns for each bookie
local valcdown = false
local bwcdown = false
local annesburgcdown = false
local armadillocdown = false
local sdcdwon = false
RegisterServerEvent('hd_bookie:fightbegin') --creates a server event that checks if you actually have the money you tried to bet if so and its not on cooldown it starts the fight
AddEventHandler('hd_bookie:fightbegin', function(qty, fighterbeton, table) --makes the event have code to run and catches the 3 variables from the client
  local Character = VORPcore.getUser(source).getUsedCharacter --gets the character used by the player
  if Character.money >= qty then --if the money you have is greater or equal to your bet amount then
    if table.location == 'val' then --the table is val then
      if valcdown == false then --if val cooldown is false then
        valcdown = true --makes cooldown true
        TriggerClientEvent('hd_bookie:fightstartt', source, qty, fighterbeton, table) --triggers client event and passes variables
        Wait(table.cooldown) --waits the set time
        valcdown = false --resets cooldown so code can run again
      elseif valcdown == true then --if it is on cooldown then
        TriggerClientEvent('hd_bookie:bookiecdown', source) --trigger client event that notifies its on cooldown
      end
    elseif table.location == 'bw' then
      if bwcdown == false then
        bwcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        valcdown = false
      elseif bwcdown == true then
        TriggerClientEvent('hd_bookie:bookiecdown', source)
      end
    elseif table.location == 'sd' then
      if sdcdwon == false then
        sdcdwon = true
        TriggerClientEvent('hd_bookie:fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        sdcdwon = false
      elseif sdcdwon == true then
        TriggerClientEvent('hd_bookie:bookiecdown', source)
      end
    elseif table.location == 'armadillo' then
      if armadillocdown == false then
        armadillocdown = true
        TriggerClientEvent('hd_bookie:fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        armadillocdown = false
      elseif armadillocdown == true then
        TriggerClientEvent('hd_bookie:bookiecdown', source)
      end
    elseif table.location == 'annesburg' then
      if annesburgcdown == false then
        annesburgcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', source, qty, fighterbeton, table)
        Wait(table.cooldown)
        annesburgcdown = false
      elseif annesburgcdown == true then
        TriggerClientEvent('hd_bookie:bookiecdown', source)
      end
    end
  elseif Character.money < qty then --if you do not have the money then
    TriggerClientEvent('hd_bookie:notenoughcash', source) --triggers the cleint event that prints you do not have the money
  end
end)

--[[#######################Addition and removal of money####################################]]
RegisterServerEvent('hd_bookie:fightoveraddmoney')
AddEventHandler('hd_bookie:fightoveraddmoney', function(qty)
  local Character = VORPcore.getUser(source).getUsedCharacter
  Character.addCurrency(0, qty)
  VORPcore.AddWebhook(Character.identifier, Config.Webhookling, 'Fighter Player Bet on won Removing Currency Amount ' .. tostring(qty))
end)

RegisterServerEvent('hd_bookie:fightoverremovemoney')
AddEventHandler('hd_bookie:fightoverremovemoney', function(qty)
  local Character = VORPcore.getUser(source).getUsedCharacter
  Character.removeCurrency(0, qty)
  VORPcore.AddWebhook(Character.identifier, Config.Webhookling, 'Fighter Player Bet on lost Removing Currency Amount ' .. tostring(qty))
end)