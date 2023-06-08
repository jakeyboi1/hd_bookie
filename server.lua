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
        VORPcore.NotifyBottomRight(_source, 'You have to wait, a fight has recently occured!', 4000)
      end
    elseif table.location == 'sd' then
      if not sdcdown then
        sdcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        sdcdown = false
      else
        VORPcore.NotifyBottomRight(_source, 'You have to wait, a fight has recently occured!', 4000)
      end
    elseif table.location == 'tl' then
      if not tlcdwon then
        tlcdwon = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        tlcdwon = false
      else
        VORPcore.NotifyBottomRight(_source, 'You have to wait, a fight has recently occured!', 4000)
      end
    elseif table.location == 'vh' then
      if not vhcdown then
        vhcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        vhcdown = false
      else
        VORPcore.NotifyBottomRight(_source, 'You have to wait, a fight has recently occured!', 4000)
      end
   elseif table.location == 'tw' then
      if not twcdown then
        twcdown = true
        TriggerClientEvent('hd_bookie:fightstartt', _source, qty, fighterbeton, table)
        Wait(table.cooldown)
        twcdown = false
      else
        VORPcore.NotifyBottomRight(_source, 'You have to wait, a fight has recently occured!', 4000)
      end
    end
  elseif Character.money < qty then
    VORPcore.NotifyBottomRight(_source, 'You do not have enough cash for the bet!', 4000)
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
