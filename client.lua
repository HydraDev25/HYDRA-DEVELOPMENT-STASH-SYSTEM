CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)
        local nearLocation = nil
        for i, coords in ipairs(Config.InventoryLocations) do
            if #(playerCoords - coords) <= Config.OpenDistance then
                nearLocation = i
                DrawText3D(coords.x, coords.y, coords.z, "[E] Personal Stash")
                if IsControlJustReleased(0, Config.OpenKey) then
                    TriggerServerEvent("hydra_stast:openStash", i)
                end
                break
            end
        end

        if not nearLocation then
            Wait(1000)
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
