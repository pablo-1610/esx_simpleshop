RegisterNetEvent(("%s:serverCallback"):format(EventFormat))
AddEventHandler(("%s:serverCallback"):format(EventFormat), function(hasFailed, customMessage)
    isWaitingForServer = false
    if (hasFailed) then
        ESX.ShowNotification(("[~r~Erreur~s~] %s"):format(customMessage and customMessage or "Une erreur est survenue."))
    end
end)