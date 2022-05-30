RegisterNetEvent(("%s:callbackOpenShop"):format(EventFormat))
AddEventHandler(("%s:callbackOpenShop"):format(EventFormat), function(shopData)
    shopCategories = shopData
    openShopMenu()
end)