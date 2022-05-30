fx_version 'adamant'
game 'gta5'
author "Pablo_1610"

shared_scripts {
    "shared/config.lua"
}

client_scripts {
    -- RageUI
    "vendors/RageUI/RMenu.lua",
    "vendors/RageUI/menu/RageUI.lua",
    "vendors/RageUI/menu/Menu.lua",
    "vendors/RageUI/menu/MenuController.lua",
    "vendors/RageUI/components/*.lua",
    "vendors/RageUI/menu/elements/*.lua",
    "vendors/RageUI/menu/items/*.lua",
    "vendors/RageUI/menu/panels/*.lua",
    "vendors/RageUI/menu/windows/*.lua",

    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}