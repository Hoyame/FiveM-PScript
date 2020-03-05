------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Fonctions Av
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Acheter()
	TriggerServerEvent("corazon_p:buyAppart", cLocation[mmenunumber].nom, cLocation[mmenunumber].price)
end

function Vendre()
	TriggerServerEvent("corazon_p:sellAppart", cLocation[mmenunumber].nom, cLocation[mmenunumber].price)
end

function Sonner()
	TriggerServerEvent("corazon_p:getPlayerisInside", appart_license, cLocation[mmenunumber].nom)
end

function MyHome(i)
    for i=1, #cLocation do
		if i == mmenunumber then
			DoScreenFadeOut(1000)
			while IsScreenFadingOut() do Citizen.Wait(0) end
			NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
			Wait(1000)
			SetEntityCoords(GetPlayerPed(-1), cLocation[mmenunumber].xo,cLocation[mmenunumber].yo,cLocation[mmenunumber].zo)
			SetEntityHeading(GetPlayerPed(-1), cLocation[mmenunumber].ho)
			NetworkFadeInEntity(GetPlayerPed(-1), 0)
			Wait(1000)
			mmenunumber = i
			SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
			DoScreenFadeIn(1000)
			while IsScreenFadingIn() do Citizen.Wait(0) end
		end
    end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Menus
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local appartementAchatMenu = {
	Base = { Title = "Achat Appartement" },
	Data = { currentMenu = "propriétés" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			if btn.name == "Acheter l'appartement" then
                Acheter()
                self:CloseMenu(true)
			end

		end,
	},

	Menu = {
		["propriétés"] = {
			slidertime = 75,
			b = {
				{ name = "Acheter l'appartement" },
			}
        }
	}
}

local appartementActionMenu = {
	Base = { Title = "Menu Appartement" },
	Data = { currentMenu = "propriétés" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			if btn.name == "Entrer dans votre maison" then
                TriggerServerEvent("corazon:updateIsInside")
                MyHome()
                self:CloseMenu(true)
            end

            if btn.name == "Revendre votre maison" then
                Vendre()
                self:CloseMenu(true)
            end
            
		end,
	},

	Menu = {
		["propriétés"] = {
			slidertime = 75,
			b = {
                { name = "Entrer dans votre maison" },
                { name = "Revendre votre maison" },
			}
        }
	}
}

local appartementSonnerMenu = {
	Base = { Title = "Menu Appartement" },
	Data = { currentMenu = "propriétés" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			if btn.name == "Sonner" then
                Sonner()
                self:CloseMenu(true)
            end
           
		end,
	},

	Menu = {
		["propriétés"] = {
			slidertime = 75,
			b = {
                { name = "Sonner" },
			}
        }
	}
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Evenements
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ local appart_license = ""

RegisterNetEvent("corazon_p:isBuy")
AddEventHandler("corazon_p:isBuy", function(license)
  isBuy = 1
  appart_license = license
  CreateMenu(appartementSonnerMenu)
end)
 
RegisterNetEvent("corazon_p:isNotBuy")
AddEventHandler("corazon_p:isNotBuy", function()
  isBuy = 0
  CreateMenu(appartementAchatMenu)
end)

RegisterNetEvent("corazon_p:isMine")
AddEventHandler("corazon_p:isMine", function(license)
  isBuy = 2
  appart_license = license
  CreateMenu(appartementActionMenu)
end)

RegisterNetEvent("corazon_p:CanEnterDring")
AddEventHandler("corazon_p:CanEnterDring", function()
	MyHome()
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Fonctions
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function missionText(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end

function DisplayHelpAlert(help)
    BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(help);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);  
end

function CoraLeBestPropret()
	local inrange = false
	local pos = GetEntityCoords(GetPlayerPed(-1), false)
	local playerCora = GetPlayerPed(-1)

	for k, v in ipairs(cLocation) do

		--DrawMarker(0,v.xe,v.ye,v.ze-1,0,0,0,0,0,0,2.001,2.0001,0.7001,0,155,255,200,0,0,0,0)
		--DrawMarker(0,v.xo,v.yo,v.zo-1,0,0,0,0,0,0,2.001,2.0001,0.7001,0,155,255,200,0,0,0,0)
	   
		if Vdist(v.xe,v.ye,v.ze, pos.x, pos.y, pos.z) < 2 then
			if GetLastInputMethod(0) then
				mmenunumber = k
				ShowHelpNotification("~INPUT_TALK~ pour ouvrir le menu propriété")
			else
				mmenunumber = k
				ShowHelpNotification("~INPUT_CELLPHONE_RIGHT~ pour ouvrir le menu propriété")
			end
			if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
				TriggerServerEvent("corazon_p:getAppart", cLocation[k].nom)
			end
		end
   
		if Vdist(v.xo,v.yo,v.zo, pos.x, pos.y, pos.z) < 2 then
			if GetLastInputMethod(0) then
				ShowHelpNotification("~INPUT_TALK~ pour sortir de l'habitation")
			else
				ShowHelpNotification("~INPUT_CELLPHONE_RIGHT~ pour sortir de l'habitation")
			end
			if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then
				TriggerServerEvent("corazon_p:updateIsInside")
				DoScreenFadeOut(500)
				while IsScreenFadingOut() do Citizen.Wait(0) end
				NetworkFadeOutEntity(playerCora, true, false)
				Wait(500)
				SetEntityCoords(playerCora, cLocation[k].xe,cLocation[k].ye,cLocation[k].ze)
				SetEntityHeading(playerCora, cLocation[k].ho)
				NetworkFadeInEntity(playerCora, 0)
				Wait(500)
				SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
				DoScreenFadeIn(500)
				while IsScreenFadingIn() do Citizen.Wait(0) end
			end 
		end
	end
end
--------------||Thread||----------------
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		CoraLeBestPropret()
	end
end)

Citizen.CreateThread(function()
	for k, v in pairs(cLocation) do
		v.blip = AddBlipForCoord(v.xe, v.ye, v.ze)
		SetBlipSprite(v.blip, 375)
		SetBlipAsShortRange(v.blip, true)
		BeginTextCommandSetBlipName("STRING")
		SetBlipColour(v.blip, 3)
		SetBlipScale(v.blip, 0.9)
		AddTextComponentString("Logement")
		EndTextCommandSetBlipName(v.blip)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("corazon_p:CgetCash")
AddEventHandler("corazon_p:CgetCash", function(aMoney)
    money = aMoney
end)

local appartementCoffreHMenu = {
	Base = { Title = "Stockage" },
	Data = { currentMenu = "propriétés" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			--if btn.name == "Acheter l'appartement" then
                --Acheter()
            --    self:CloseMenu(true)
			--end

		end,
	},

	Menu = {
		["propriétés"] = {
			slidertime = 75,
			b = {
				{ name = "Coffre" },
			}
		},

		["coffre"] = {
			slidertime = 75,
			b = {
				{ name = "Argent" },
				{ name = "Items" },
				{ name = "Armes" },
			}
		},
		
		["argent"] = {
			slidertime = 75,
			b = {
				{ name = "Deposer" },
				{ name = "Retirer" },
                { name = "---------------------------------------------------------------------" },
				{ name = "Afficher" },

			}
		},

		["items"] = {
			slidertime = 75,
			b = {
				{ name = "Deposer" },
				{ name = "Retirer" },
                { name = "---------------------------------------------------------------------" },
				{ name = "Afficher" },

			}
		},
		
		["armes"] = {
			slidertime = 75,
			b = {
				{ name = "Deposer" },
				{ name = "Retirer" },
                { name = "---------------------------------------------------------------------" },
				{ name = "Afficher" },

			}
        }
	}
}

function deposerargent(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("corazon_p:depositcash", txt, apart)
		end
	end
end

