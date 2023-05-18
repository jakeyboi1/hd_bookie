------------ Ped Spawning ----------
CreateThread(function()
    local model = joaat('mp_re_slumpedhunter_males_01')
    for k, v in pairs(Config.Setup) do
        if Config.BookieBlip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Bookie")
        end
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
        local createdped = CreatePed(model, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z - 1, v.Bookieheading, false, false, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, createdped, true)
        SetEntityAsMissionEntity(createdped, true, true)
        SetEntityInvincible(createdped, true)
        FreezeEntityPosition(createdped, true)
    end
end)

----------- Draw Text On Peds ----------
CreateThread(function()
    while true do
        Wait(2)
        for k, v in pairs(Config.Setup) do
            local playercoord = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(playercoord.x, playercoord.y, playercoord.z, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, true) < 10 then
                DrawText3D(v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, "Press 'g' to bet on fights")
            end
        end
    end
end)

--Creates the ability to use DrawText3D
function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
	  SetTextScale(0.30, 0.30)
	  SetTextFontForCurrentCommand(1)
	  SetTextColor(255, 255, 255, 215)
	  SetTextCentre(1)
	  DisplayText(str,_x,_y)
	  local factor = (string.len(text)) / 225
	  DrawSprite("feeds", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 35, 35, 35, 190, 0)
	end
end