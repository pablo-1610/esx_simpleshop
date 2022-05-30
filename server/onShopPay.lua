RegisterNetEvent(("%s:shopPay"):format(EventFormat))
AddEventHandler(("%s:shopPay"):format(EventFormat), function(categoryId, itemId, qty)
    local _src = source

    local category = AdvancedShopConfig.categories[categoryId]
    if (not (category)) then
        respond(_src, true)
        return
    end

    local item = category.items[itemId]

    if (not (item)) then
        respond(_src, true)
        return
    end

    local xPlayer = ESX.GetPlayerFromId(_src)

    if (xPlayer.getAccount("cash").money < item.price) then
        respond(_src, true, "Vous n'avez pas assez d'argent")
        return
    end

    xPlayer.removeAccountMoney("cash", item.price)
    xPlayer.addInventoryItem(item.name, qty)

    respond(_src)
    TriggerClientEvent("esx:showNotification", _src, "[~g~Succès~s~] Votre achat a bien été effectué !")
end)