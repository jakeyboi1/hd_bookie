------ Menu Setup ---------
CreateThread(function()
    WarMenu.CreateMenu('hd_bookie:book', "Bookie")
    repeat
        if WarMenu.IsMenuOpened('hd_bookie:book') then
            if WarMenu.Button(' Bet on fighter A? ') then
                Fighterbetonn = 'fightera'
                local myInput = {
                    type = "enableinput", -- dont touch
                    inputType = "input", -- or text area for sending messages
                    button = "confirm", -- button name
                    placeholder = "insertamount", --placeholdername
                    style = "block", --- dont touch
                    attributes = {
                        inputHeader = "amount", -- header
                        type = "number", -- inputype text, number,date.etc if number comment out the pattern
                        pattern = "[0-9]{1,20}", -- regular expression validated for only numbers "[0-9]", for letters only [A-Za-z]+   with charecter limit  [A-Za-z]{5,20}     with chareceter limit and numbers [A-Za-z0-9]{5,}
                        title = "must be only numbers min 1 max 20", -- if input doesnt match show this message
                        style = "border-radius: 10px; background-color: ; border:none;", -- style  the inptup
                    }
                }
                TriggerEvent("vorpinputs:advancedInput", json.encode(myInput),function(result)
                    local qty = tonumber(result)
                    if qty == nil then
                        VORPcore.NotifyBottomRight('Invalid Input. Input has to be a number!', 4000)
                    elseif qty > 0 or qty == nil then
                        TriggerServerEvent("hd_bookie:bookiecatchinputforsell",  qty) --result
                    end
                end)
                WarMenu.CloseMenu()
            elseif WarMenu.Button(" Bet on fighter B?") then
                Fighterbetonn = 'fighterb'
                local myInput = {
                    type = "enableinput", -- dont touch
                    inputType = "input", -- or text area for sending messages
                    button = "confirm", -- button name
                    placeholder = "insertamount", --placeholdername
                    style = "block", --- dont touch
                    attributes = {
                        inputHeader = "amount", -- header
                        type = "number", -- inputype text, number,date.etc if number comment out the pattern
                        pattern = "[0-9]{1,20}", -- regular expression validated for only numbers "[0-9]", for letters only [A-Za-z]+   with charecter limit  [A-Za-z]{5,20}     with chareceter limit and numbers [A-Za-z0-9]{5,}
                        title = "must be only numbers min 1 max 20", -- if input doesnt match show this message
                        style = "border-radius: 10px; background-color: ; border:none;", -- style  the inptup
                    }
                }
                TriggerEvent("vorpinputs:advancedInput", json.encode(myInput),function(result)
                    local qty = tonumber(result)
                    if qty == nil then
                        VORPcore.NotifyBottomRight('Invalid Input. Input has to be a number!', 4000)
                    elseif qty > 0 or qty ~= nil then
                        TriggerServerEvent("hd_bookie:bookiecatchinputforsell",  qty) --result
                    end
                end)
                WarMenu.CloseMenu()
            end
        end
        WarMenu.Display()
        Wait(0)
    until false
end)

RegisterNetEvent('hd_bookie:betplaced')
AddEventHandler('hd_bookie:betplaced', function(qty)
    local fighterbeton = Fighterbetonn
    local table = Selectedtable
    TriggerServerEvent('hd_bookie:fightbegin', qty, fighterbeton, table)
end)

CreateThread(function()
    while true do
        Wait(5)
        for k, v in pairs(Config.Setup) do
            if GetDistanceBetweenCoords(v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, GetEntityCoords(PlayerPedId()), false) < 2 then
                if IsControlJustReleased(0, 0x760A9C6F) then
                    Selectedtable = v
                    WarMenu.OpenMenu('hd_bookie:book')
                end
            end
        end
    end
end)