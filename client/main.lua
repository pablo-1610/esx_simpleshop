ESX = nil
isWaitingForServer = false
shopCategories = {}

CreateThread(function()
    TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
    end)

    while (true) do
        local interval, playerPosition = 20, GetEntityCoords(PlayerPedId())

        if (not (isWaitingForServer)) then
            for shopId, data in pairs(AdvancedShopConfig.list) do
                local position = data.position
                local dst = #(playerPosition - position)
                if (dst <= 10.0) then
                    DrawMarker(25, position.x, position.y, position.z - 0.9, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
                    if (dst <= 1.0) then
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le magasin.")
                        if (IsControlJustPressed(0, 51)) then
                            isWaitingForServer = true
                            TriggerServerEvent(("%s:openShop"):format(EventFormat), shopId)
                        end
                    end
                    interval = 0
                end
            end
        end

        Wait(interval)
    end
end)