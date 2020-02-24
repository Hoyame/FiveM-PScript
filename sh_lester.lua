local interactionLester = {
	Base = { Title = "Lester" },
	Data = { currentMenu = "lester" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			--if btn.name == "~b~Sauvegarder Position" then
			--	RequestToSave()
            --end
            
            print(btn.name)
		end,
	},

	Menu = {
		["lester"] = {
			slidertime = 75,
			b = {
                { name = "Faux Papiers" },
                { name = "Outils Braco" },
			}
        },

        ["faux papiers"] = {
			slidertime = 75,
			b = {
                { name = "~r~                                    ILLEGAL " },
                { name = "---------------------------------------------------------------------" },
                { name = "~g~Pack Fausse Identité", Description = "Fausse carte d'identité + permis camion, moto, voiture", ask = "~g~90000$", askX = true },
                { name = "~g~Pack Faux Permis", Description = "Permis camion, moto, voiture", ask = "~g~25000$", askX = true },
                { name = "---------------------------------------------------------------------" },
                { name = "~o~Fausse carte d'identité", ask = "~g~75000$", askX = true },
                { name = "~o~Fausse plque d'immatriculation", ask = "~g~30000$", askX = true },
                { name = "---------------------------------------------------------------------" },
                { name = "~y~Faux permis arme", ask = "~g~10000$", askX = true },
                { name = "~y~Faux permis camion", ask = "~g~10000$", askX = true },
                { name = "~y~Faux permis voiture", ask = "~g~10000$", askX = true },
                { name = "~y~Faux permis moto", ask = "~g~10000$", askX = true },
			}
        },

        ["outils braco"] = {
			slidertime = 75,
			b = {
                { name = "SOON", ask = "~g~0$", askX = true },
                { name = "SOON", ask = "~g~0$", askX = true },
                { name = "SOON", ask = "~g~0$", askX = true },
                { name = "SOON", ask = "~g~0$", askX = true },
			}
        }
	}
}

local positionLester = {
    {x = 1273.12, y = -1711.8, z = 54.77}
}

--1273.53 -1721.3 54.66 198.55

--1275.63 -1720.33 54.66

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionLester) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionLester[k].x, positionLester[k].y, positionLester[k].z)

            if dist <= 2.0 then
                ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~b~Lester")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    CreateMenu(interactionLester)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_lestercrest")
    local hashTwo = GetHashKey("s_m_y_blackops_01")


    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    while not HasModelLoaded(hashTwo) do
        RequestModel(hashTwo)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVMALE", "ig_lestercrest", 1272.25, -1711.8, 53.77, 266.946, true, true)

    pedOne = CreatePed("PED_TYPE_CIVMALE", "s_m_y_blackops_01", 1273.53, -1721.3, 53.66, 198.55, true, true)
    pedTwo = CreatePed("PED_TYPE_CIVMALE", "s_m_y_blackops_01", 1275.63, -1720.33, 53.66, 198.55, true, true)
    --ped = CreatePed("PED_TYPE_CIVMALE", "ig_lestercrest", 1272.25, -1711.8, 53.77, 266.946, true, true)

    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)

    SetBlockingOfNonTemporaryEvents(pedOne, true)
    SetEntityInvincible(pedOne, true)
    FreezeEntityPosition(pedOne, true)

    SetBlockingOfNonTemporaryEvents(pedTwo, true)
    SetEntityInvincible(pedTwo, true)
    FreezeEntityPosition(pedTwo, true)
end)