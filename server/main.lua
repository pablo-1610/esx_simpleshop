ESX = nil

function respond(_src, hasFailed, customMessage)
    TriggerClientEvent(("%s:serverCallback"):format(EventFormat), _src, hasFailed, customMessage)
end

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj

    for _, category in pairs(AdvancedShopConfig.categories) do
        for _, categoryItem in pairs(category.items) do
            local item = ESX.GetItem(categoryItem.name)
            if (item) then
                categoryItem.label = item.label
            end
        end
    end
end)
