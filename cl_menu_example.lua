local MyMenus = {
    Base = { Title = "Menu Personnel" },
    Data = { currentMenu = "Paramètres" },
    Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Changer de personnage" then                                      
                RequestToSave()
            end
        end,
    },

    Menu = {
        ["paramètres"] = {
            b = {                             -- affiche > / bloque l'ecriture
                {name = "Changer de personnage", ask = ">", askX = true},
                {name = "----------------------------------------------------------------------"},
                {name = "Paramètres vocal", },
                {name = "Réglages affichage"},
                {name = "Réglages filtres"},
                {name = "----------------------------------------------------------------------"},
                {name = "Optimisation"},
            }
        },

        ["paramètres vocal"] = {
            b = {
                {name = "Changer de personnage"},
                {name = "----------------------------------------------------------------------"},
                {name = "Changer de personnage"},
            }
        }
    }
}


Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, 57) then
            CreateMenu(MyMenus)
        end  
    end
end)