-------- Pulling Essentials --------
local VORPcore = {}
TriggerEvent("getCore", function(core)
  VORPcore = core
end)

------------- Variable reciever ----------
RegisterServerEvent('hd_bookie:bookiecatchinputforsell')
AddEventHandler('hd_bookie:bookiecatchinputforsell', function(qty)
  local _source = source
  TriggerClientEvent('hd_bookie:betplaced', _source, qty)
end)

------------- Cooldown Setup -------------
local valcdown, bwcdown, annesburgcdown, armadillocdown, sdcdwon = false, false, false, false, false
RegisterServerEvent('hd_bookie:fightbegin')
AddEventHandler('hd_bookie:fightbegin', function(qty, fighterbeton, table)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  if Character.money >= qty then
    if table.location == 'val' then
      if not valcdown then
        valcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        valcdown = false
      else
        TriggerClientEvent('hd_bookie:bookiecdown', _source)
      end
    elseif table.location == 'bw' then
      if not bwcdown then
        bwcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        valcdown = false
      else
        TriggerClientEvent('hd_bookie:bookiecdown', _source)
      end
    elseif table.location == 'sd' then
      if not sdcdwon then
        sdcdwon = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        sdcdwon = false
      else
        TriggerClientEvent('hd_bookie:bookiecdown', _source)
      end
    elseif table.location == 'armadillo' then
      if not armadillocdown then
        armadillocdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        armadillocdown = false
      else
        TriggerClientEvent('hd_bookie:bookiecdown', _source)
      end
    elseif table.location == 'annesburg' then
      if not annesburgcdown then
        annesburgcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        annesburgcdown = false
      else
        TriggerClientEvent('hd_bookie:bookiecdown', _source)
      end
    end
  elseif Character.money < qty then
    TriggerClientEvent('hd_bookie:notenoughcash', _source)
  end
end)

-------------- Money Handling ----------------
RegisterServerEvent('hd_bookie:fightoveraddmoney')
AddEventHandler('hd_bookie:fightoveraddmoney', function(qty)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  Character.addCurrency(0, qty)
  VORPcore.AddWebhook(Character.identifier, Config.Webhookling, 'Fighter Player Bet on won Removing Currency Amount ' .. tostring(qty))
end)

RegisterServerEvent('hd_bookie:fightoverremovemoney')
AddEventHandler('hd_bookie:fightoverremovemoney', function(qty)
  local _source = source
  local Character = VORPcore.getUser(_source).getUsedCharacter
  Character.removeCurrency(0, qty)
  VORPcore.AddWebhook(Character.identifier, Config.Webhookling, 'Fighter Player Bet on lost Removing Currency Amount ' .. tostring(qty))
end)