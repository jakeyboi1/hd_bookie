--Pulls vorp core
local VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)
--end pulling it

RegisterNetEvent('hd_bookie:fightstartt') --Creates a client event that is triggered server side
AddEventHandler('hd_bookie:fightstartt', function(qty, fighterbeton) --makes the event have code to run and recieves the 2 variables from server
    VORPcore.NotifyBottomRight('The fight has begun!', 4000) --prints this in players screen
    local catch17 = false --creates a kinda of catch/trigger varaible
    local model = GetHashKey("cs_welshfighter") --sets the model to the varible ped to make set in the menu part of the code(Animal is a global set in menusetup.lua)
    local coords = Selectedtable.Fightersspawn.FighterA -- pulls the global set in menusetup.lua
    RequestModel(model) --dont know but is needed
    if not HasModelLoaded(model) then
        RequestModel(model)
    end
    while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do
        Citizen.Wait(1)
    end --end dont know but is needed
    Citizen.Wait(0) --waits a little(prevents crashing)
    if catch17 == false then --if catch17 is false then
        catch17 = true --sets it to true to prevent the code below from running again since this is in a loop
        Createdped2 = CreatePed(model, coords.x, coords.y, coords.z, true, true, true, true) --creates the ped
        Citizen.InvokeNative(0x283978A15512B2FE, Createdped2, true) --This sets the ped into a random outift(fixes an invisiblity bug)
    end
    --below this is fighter b setup
    local catch18 = false --creates catch  variable so it doesnt double spawn
    local model2 = GetHashKey('cs_welshfighter') --sets the model
    local coords2 = Selectedtable.Fightersspawn.FighterB --gets the set coords from config
    RequestModel(model2)
    if not HasModelLoaded(model2) then
        RequestModel(model2)
    end
    while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do
        Citizen.Wait(1)
    end --end dont know but is needed
    Citizen.Wait(0) --waits a little(prevents crashing)
    if catch18 == false then --if catch17 is false then
        catch18 = true --sets it to true to prevent the code below from running again since this is in a loop
        Createdped3 = CreatePed(model2, coords2.x, coords2.y, coords2.z, true, true, true, true) --creates the ped
        Citizen.InvokeNative(0x283978A15512B2FE, Createdped3, true) --This sets the ped into a random outift(fixes an invisiblity bug)
        --Createing thread to check if one of the 2 peds is dead
        Citizen.CreateThread(function() --creates thread
            TaskCombatPed(Createdped3, Createdped2) --makes the ped hostile to the other ped
            TaskCombatPed(Createdped2, Createdped3) --makes the ped hostile to the other ped
            while true do --creates a loop
                local cded = GetPedCauseOfDeath(Createdped2) --checks how the ped died
                local cded2 = GetPedCauseOfDeath(Createdped3) --checks how the ped died
                local dead = IsEntityDead(Createdped2) --checks if the ped is dead
                local dead2 = IsEntityDead(Createdped3) --checks if ped is dead
                Citizen.Wait(0) --prevents crashing
                if fighterbeton == 'fightera' then --if the variable is fightera then
                    if dead == 1 then --if it is dead then
                        if cded == -1569615261 then --this hash is the one for melee combat so if ped died to melee then
                            Wait(2000) --waits 2 seconds
                            DeletePed(Createdped2) --deletes ped
                            DeletePed(Createdped3) --deletes ped
                            VORPcore.NotifyBottomRight('The fighter you bet on won!', 4000) --prints this in players screen
                            TriggerServerEvent('hd_bookie:fightoveraddmoney', qty) break --triggers server event and breaks loop
                        elseif cded ~= -1569615261 then --else if ped did not die to the has(melee combat) then
                            DeletePed(Createdped2) --delete ped
                            DeletePed(Createdped3) --delete ped
                            VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break --prints on players screen and breaks loop
                        end
                    elseif dead2 == 1 then --elseif fighter b is dead then
                        if cded2 == -1569615261 then --if fighter b died by melee combat then
                            Wait(1500) --wait 1 and a half seconds
                            DeletePed(Createdped2) --delete ped
                            DeletePed(Createdped3) --delete ped
                            VORPcore.NotifyBottomRight('The fighter you bet on lost!', 4000) --prints at bottom of player screen
                            TriggerServerEvent('hd_bookie:fightoverremovemoney', qty) break --triggers server event and breaks
                        elseif cded ~= -1569615261 then --else if fighter b died not to melee combat then
                            DeletePed(Createdped2) --delete ped
                            DeletePed(Createdped3) --delete ped
                            VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break --print on screen and breaks loop
                        end
                    end
                elseif fighterbeton == 'fighterb' then
                    if dead2 == 1 then
                        if cded2 == -1569615261 then
                            Wait(2000)
                            DeletePed(Createdped2)
                            DeletePed(Createdped3)
                            VORPcore.NotifyBottomRight('The fighter you bet on won!', 4000) --prints this in players screen
                            TriggerServerEvent('hd_bookie:fightoveraddmoney', qty) break
                        elseif cded ~= -1569615261 then
                            DeletePed(Createdped2)
                            DeletePed(Createdped3)
                            VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break
                        end
                    elseif dead == 1 then
                        if cded == -1569615261 then
                            Wait(1500)
                            DeletePed(Createdped2)
                            DeletePed(Createdped3)
                            VORPcore.NotifyBottomRight('The fighter you bet on lost!', 4000)
                            TriggerServerEvent('hd_bookie:fightoverremovemoney', qty) break
                        elseif cded ~= -1569615261 then
                            DeletePed(Createdped2)
                            DeletePed(Createdped3)
                            VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break
                        end
                    end
                end
                --this will create the text on the npcs
                local fighteracoords = GetEntityCoords(Createdped2) --get ped coords
                local fighterbcoords = GetEntityCoords(Createdped3) --gets ped coords
                local player = PlayerPedId() --gets the players ped
                local playercoord = GetEntityCoords(player) --gets the players ped coordinates
                local dist = GetDistanceBetweenCoords(playercoord.x, playercoord.y, playercoord.z, fighteracoords.x, fighteracoords.y, fighteracoords.z, false) --gets the distance between coords
                if dist < 10 then -- if distance is less than 10 do
                    DrawText3D(fighteracoords.x, fighteracoords.y, fighteracoords.z, "Fighter B") --creates the text
                    DrawText3D(fighterbcoords.x, fighterbcoords.y, fighterbcoords.z, "Fighter A") --creates the text
                end
            end
        end)
    end
end)

--this is the notify for if you do not have the amount you tried to bet
RegisterNetEvent('hd_bookie:notenoughcash')
AddEventHandler('hd_bookie:notenoughcash', function()
    VORPcore.NotifyBottomRight('You do not have enough cash for the bet!', 4000)
end)

RegisterNetEvent('hd_bookie:bookiecdown')
AddEventHandler('hd_bookie:bookiecdown', function()
    VORPcore.NotifyBottomRight('You have to wait, a fight has recently occured!', 4000)
end)