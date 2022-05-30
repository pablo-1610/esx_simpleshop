local selectedCategory = nil

local title, desc = "Superette", "Faites votre choix"
local menuOpened = false

local menu_main = RageUI.CreateMenu(title, desc, nil, nil, "root_cause", "black_red")
local menu_browse = RageUI.CreateSubMenu(menu_main, title, desc, nil, nil, "root_cause", "black_red")

menu_main.Closed = function()
    menuOpened = false
end

function openShopMenu()
    if (menuOpened) then
        return
    end
    menuOpened = true
    FreezeEntityPosition(PlayerPedId(), true)
    RageUI.Visible(menu_main, true)
    CreateThread(function()
        while (menuOpened) do
            Wait(0)
            RageUI.IsVisible(menu_main, function()
                RageUI.Separator("Bienvenue au magasin")
                for categoryId, category in pairs(shopCategories) do
                    RageUI.Button(("Catégorie %s"):format(category.label), nil, {RightLabel = "→"}, true, {
                        onActive = function()
                            selectedCategory = categoryId
                        end,
                    }, menu_browse)
                end
            end)

            RageUI.IsVisible(menu_browse, function()
                local category = shopCategories[selectedCategory]
                if (not (category)) then
                    RageUI.GoBack()
                else
                    RageUI.Separator(("Catégorie: ~o~%s"):format(category.label))
                    for itemId, item in pairs(category.items) do
                        RageUI.Button(("%s"):format(item.label), "Appuyez pour acheter cet article.", {RightLabel = ("~g~%s$"):format(ESX.Math.GroupDigits(item.price))}, true, {
                            onSelected = function()
                                local qty = Utils.input_showBox("Quantité", "", 2, true)
                                if (qty ~= nil and tonumber(qty) and tonumber(qty) > 0) then
                                    print("Ok")
                                    isWaitingForServer = true
                                    TriggerServerEvent(("%s:shopPay"):format(EventFormat), selectedCategory, itemId, tonumber(qty))
                                else
                                    Utils.errorMess("La quantité indiqué est invalide.")
                                end
                            end
                        })
                    end
                end
            end)
        end
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end