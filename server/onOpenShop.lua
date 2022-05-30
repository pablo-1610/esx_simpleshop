RegisterNetEvent(("%s:openShop"):format(EventFormat))
AddEventHandler(("%s:openShop"):format(EventFormat), function(shopId)
    print("test")
    local _src = source

    if (not (shopId)) then
        respond(_src, true)
        return
    end

    if (not (AdvancedShopConfig.list[shopId])) then
        respond(_src, true)
        return
    end

    local shopData = AdvancedShopConfig.list[shopId]

    if (#(GetEntityCoords(GetPlayerPed(_src))-shopData.position) >= 10.0) then
        respond(_src, true)
        return
    end

    TriggerClientEvent(("%s:callbackOpenShop"):format(EventFormat), _src, AdvancedShopConfig.categories)
    respond(_src)
end)