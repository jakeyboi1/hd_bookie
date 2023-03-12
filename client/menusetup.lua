--Menu Setup
Citizen.CreateThread(function()
    WarMenu.CreateMenu('book', "Bookie") --creates the main menu
    repeat --repeates until it ends/breaks
        if WarMenu.IsMenuOpened('book') then --if the menu is opened then
            if WarMenu.Button(' Bet on fighter A? ') then --creates the spawnbutton
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
                    if qty > 0 then
                        TriggerServerEvent("bookiecatchinputforsell",  qty) --result
                    else
                        TriggerEvent("vorp:TipRight", "insertamount", 3000)
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
                    if qty > 0 then
                        TriggerServerEvent("bookiecatchinputforsell",  qty) --result
                    else
                        TriggerEvent("vorp:TipRight", "insertamount", 3000)
                    end
                end)
                WarMenu.CloseMenu()
            end
        end
    WarMenu.Display()
    Citizen.Wait(0)
    until false
end)

RegisterNetEvent('betplaced')
AddEventHandler('betplaced', function(qty)
    local fighterbeton = Fighterbetonn
    local table = Selectedtable
    TriggerServerEvent('fightbegin', qty, fighterbeton, table)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        for k, v in pairs(Config.Setup) do
            if GetDistanceBetweenCoords(v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, GetEntityCoords(PlayerPedId()), false) < 2 then
                if IsControlJustReleased(0, 0x760A9C6F) then
                    Selectedtable = v
                    WarMenu.OpenMenu('book')
                end
            end
        end
    end
end)
--End menu setup