redzonesCfg = {
    ["F Block"] = {
        marker = {x = -14.54, y = -1449.59, z = 30.64},
        radius = 50.0
    },
    ["Opium"] = {
        marker = {x = -225.9, y = -2655.0, z = 5.99},
        radius = 250.0
    }
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        local isSleep = true
        local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(redzonesCfg) do
            if (GetDistanceBetweenCoords(coords, v.marker.x, v.marker.y, v.marker.z, true) < v.radius) then
                isSleep = false
                isntInRed = false
                drawTextRedzones(0.4, 0.9, "You are in ~r~"..k.."~w~ redzone, you are allowed to KOS here.")
            end
		end

        if isSleep then
            Citizen.Wait(500)
        end

    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(redzonesCfg) do
        local redzones = AddBlipForRadius(v.marker.x, v.marker.y, v.marker.z, v.radius)
        SetBlipHighDetail(redzones, true)
        SetBlipColour(redzones, 1)
        SetBlipAlpha(redzones, 128)
    end
end)

drawTextRedzones = function(x,y,text)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.45, 0.45)
    SetTextColour(255,255,255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end