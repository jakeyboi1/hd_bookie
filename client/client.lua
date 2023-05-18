----------- Pulling Essentials --------------
VORPcore = {}
TriggerEvent("getCore", function(core)
    VORPcore = core
end)

RegisterNetEvent('hd_bookie:fightstartt')
AddEventHandler('hd_bookie:fightstartt', function(qty, fighterbeton)
    VORPcore.NotifyBottomRight('The fight has begun!', 4000)
    local catch17 = false
    local model = joaat("cs_welshfighter")
    local coords = Selectedtable.Fightersspawn.FighterA
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
    if not catch17 then
        catch17 = true
        Createdped2 = CreatePed(model, coords.x, coords.y, coords.z, true, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, Createdped2, true)
    end
    
    local catch18 = false
    local model2 = joaat('cs_welshfighter')
    local coords2 = Selectedtable.Fightersspawn.FighterB
    RequestModel(model2)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    
    if not catch18 then
        catch18 = true
        Createdped3 = CreatePed(model2, coords2.x, coords2.y, coords2.z, true, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, Createdped3, true)
        
        TaskCombatPed(Createdped3, Createdped2)
        TaskCombatPed(Createdped2, Createdped3)
        while true do
            local cded = GetPedCauseOfDeath(Createdped2)
            local cded2 = GetPedCauseOfDeath(Createdped3)
            local dead = IsEntityDead(Createdped2)
            local dead2 = IsEntityDead(Createdped3)
            Wait(5)
            if fighterbeton == 'fightera' then
                if dead then
                    if cded == -1569615261 then --this hash is the one for melee combat so if ped died to melee then
                        Wait(2000)
                        DeletePed(Createdped2)
                        DeletePed(Createdped3)
                        VORPcore.NotifyBottomRight('The fighter you bet on won!', 4000)
                        TriggerServerEvent('hd_bookie:fightoveraddmoney', qty) break
                    elseif cded ~= -1569615261 then
                        DeletePed(Createdped2)
                        DeletePed(Createdped3)
                        VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break
                    end
                elseif dead2 then
                    if cded2 == -1569615261 then
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
            elseif fighterbeton == 'fighterb' then
                if dead2 then
                    if cded2 == -1569615261 then
                        Wait(2000)
                        DeletePed(Createdped2)
                        DeletePed(Createdped3)
                        VORPcore.NotifyBottomRight('The fighter you bet on won!', 4000)
                        TriggerServerEvent('hd_bookie:fightoveraddmoney', qty) break
                    elseif cded ~= -1569615261 then
                        DeletePed(Createdped2)
                        DeletePed(Createdped3)
                        VORPcore.NotifyBottomRight('Something has interuppted the fight!', 4000) break
                    end
                elseif dead then
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
            
            local fighteracoords = GetEntityCoords(Createdped2)
            local fighterbcoords = GetEntityCoords(Createdped3)
            local playercoord = GetEntityCoords(PlayerPedId())
            local dist = GetDistanceBetweenCoords(playercoord.x, playercoord.y, playercoord.z, fighteracoords.x, fighteracoords.y, fighteracoords.z, false)
            if dist < 10 then
                DrawText3D(fighteracoords.x, fighteracoords.y, fighteracoords.z, "Fighter B")
                DrawText3D(fighterbcoords.x, fighterbcoords.y, fighterbcoords.z, "Fighter A")
            end
        end
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