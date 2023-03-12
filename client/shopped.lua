Citizen.CreateThread(function()
    TriggerServerEvent('pedspawns')
end)

local pedlock = 0
RegisterNetEvent('pedspawn')
AddEventHandler('pedspawn', function()
    local model = GetHashKey('mp_re_slumpedhunter_males_01') --sets the npc model
    for k, v in pairs(Config.Setup) do
        local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Bookie")
        RequestModel(model) -- requests the varible model
        if not HasModelLoaded(model) then --checks if its loaded
            RequestModel(model)
        end
        while not HasModelLoaded(model) or HasModelLoaded(model) == 0 or model == 1 do -- not sure but its needed
            Citizen.Wait(1)
        end
        if pedlock == 0 then
            local createdped = CreatePed(model, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z - 1, v.Bookieheading, true, true, true, true) --creates ped the minus one makes it so its standing on the ground not floating
            Citizen.InvokeNative(0x283978A15512B2FE, createdped, true) -- sets ped into random outfit, stops it being invis
            SetEntityAsMissionEntity(createdped, true, true) -- sets ped as mission entity preventing it from despawning
            SetEntityInvincible(createdped, true) --sets ped invincible
            FreezeEntityPosition(createdped, true) --freezes the entity
        end
    end
    pedlock = pedlock + 1
end)

Citizen.CreateThread(function()
    while true do -- creates a loop to keep the text up and the distance constantly checked
        Citizen.Wait(0) --makes it wait a slight amount (avoids crashing is needed)
        for k, v in pairs(Config.Setup) do
            local player = PlayerPedId() --gets the players ped
            local playercoord = GetEntityCoords(player) --gets the players ped coordinates
            local dist = GetDistanceBetweenCoords(playercoord.x, playercoord.y, playercoord.z, v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, false) --gets the distance between coords
            if dist < 10 then -- if distance is less than 10 do
                DrawText3D(v.Bookielocation.x, v.Bookielocation.y, v.Bookielocation.z, "Press 'g' to bet on fights") --creates the text
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
--end 3d text ability
--end of shop npc setup

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
--end 3d text ability
--end of shop npc setup