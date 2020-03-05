local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["UP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Cora = {}
CMenu = {}

local itemPM = {}
local clesPM = {}
local armesPM = {}



----------------------------------------------------------------------------------------
-- Carte d'identité
----------------------------------------------------------------------------------------

local active = false

local nom = ""
local lieu = ""

local jour = ""
local mois = ""
local year = ""

local datedn = {}
datedn.jour = jour 
datedn.mois = year
datedn.year = year

local travail = ""
---------------------
local arme = ""
local voiture = ""
local moto = ""
local camion = ""

RegisterNetEvent('corazon:ShowClientIDCard')
AddEventHandler('corazon:ShowClientIDCard', function(result)
	active = true
	---- Identité
	nom = tostring(result[1].nameIdentity)
	lieu = tostring(result[1].lieuIdentity)
	---- Date de naissance
	jour = tonumber(result[1].jourIdentity)
	mois = tostring(result[1].moisIdentity)
	year = tonumber(result[1].yearIdentity)

	travail = tostring(result[1].job)
	---- Permis
	arme = tostring(result[1].armePermis)
	voiture = tostring(result[1].voiturePermis)
	moto = tostring(result[1].motoPermis)
	camion = tostring(result[1].camionPermis)
end)

local function RenderCarte()
	DrawRect(0.883000000000001, 0.37, 0.190, 0.325, 0, 0, 0, 220)
	DrawAdvancedText2(0.975000000000001, 0.235, 0.005, 0.0028, 0.4, "~b~~c~Carte d'identité", 255, 255, 255, 255, 0, 0)
	
	DrawAdvancedText2(0.897000000000001, 0.270, 0.005, 0.0028, 0.275, "~o~Nom & Prenom :~b~ "..nom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.300, 0.005, 0.0028, 0.275, "~o~Lieu de naissance :~b~ "..lieu, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.330, 0.005, 0.0028, 0.275, "~o~Date de naissance :~b~ "..jour.." "..mois.." "..year, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.360, 0.005, 0.0028, 0.275, "~o~Métier :~b~ "..travail, 255, 255, 255, 255, 0, 1)

	DrawAdvancedText2(0.975000000000001, 0.380, 0.005, 0.0028, 0.4, "~b~~c~Permis", 255, 255, 255, 255, 0, 0)

	DrawAdvancedText2(0.897000000000001, 0.415, 0.005, 0.0028, 0.275, "~o~Permis Arme :~b~ "..arme, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.445, 0.005, 0.0028, 0.275, "~o~Permis Voiture :~b~ "..voiture, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.475, 0.005, 0.0028, 0.275, "~o~Permis Moto :~b~ "..moto, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.505, 0.005, 0.0028, 0.275, "~o~Permis Camion :~b~ "..camion, 255, 255, 255, 255, 0, 1)

end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if active then
			RenderCarte()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if active then
			Wait(10000) --Permet l'affichage pendant 20 secondes
			active = false
		end
	end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- Fausse carte d'identité
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local assuranceActive = false

local fakeNom = ""
local fakeLieu = ""

local fakeJour = ""
local fakeMois = ""
local fakeYear = ""

local fakeTravail = ""
---------------------
local fakeArme = ""
local fakeVoiture = ""
local fakeMoto = ""
local fakeCamion = ""


RegisterNetEvent('corazon:FakeShowClientIDCard')
AddEventHandler('corazon:FakeShowClientIDCard', function(result)
	assuranceActive = true
	---- Identité
	fakeNom = tostring(result[1].nameIdentity)
	fakeLieu = tostring(result[1].lieuIdentity)
	---- Date de naissance
	fakeJour = tonumber(result[1].jourIdentity)
	fakeMois = tostring(result[1].moisIdentity)
	fakeYear = tonumber(result[1].yearIdentity)

	fakeTravail = tostring(result[1].jobIdentity)
	---- Permis
	fakeArme = tostring(result[1].armePermis)
	fakeVoiture = tostring(result[1].voiturePermis)
	fakeMoto = tostring(result[1].motoPermis)
	fakeCamion = tostring(result[1].camionPermis)
end)

local function FakeRenderCarte()
	DrawRect(0.883000000000001, 0.37, 0.190, 0.325, 0, 0, 0, 220)
	DrawAdvancedText2(0.975000000000001, 0.235, 0.005, 0.0028, 0.4, "~b~~c~Carte d'identité", 255, 255, 255, 255, 0, 0)
	
	DrawAdvancedText2(0.897000000000001, 0.270, 0.005, 0.0028, 0.275, "~o~Nom & Prenom :~b~ "..fakeNom, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.300, 0.005, 0.0028, 0.275, "~o~Lieu de naissance :~b~ "..fakeLieu, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.330, 0.005, 0.0028, 0.275, "~o~Date de naissance :~b~ "..fakeJour.." "..fakeMois.." "..fakeYear, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.360, 0.005, 0.0028, 0.275, "~o~Métier :~b~ "..fakeTravail, 255, 255, 255, 255, 0, 1)

	DrawAdvancedText2(0.975000000000001, 0.380, 0.005, 0.0028, 0.4, "~b~~c~Permis", 255, 255, 255, 255, 0, 0)

	DrawAdvancedText2(0.897000000000001, 0.415, 0.005, 0.0028, 0.275, "~o~Permis Arme :~b~ "..fakeArme, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.445, 0.005, 0.0028, 0.275, "~o~Permis Voiture :~b~ "..fakeVoiture, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.475, 0.005, 0.0028, 0.275, "~o~Permis Moto :~b~ "..fakeMoto, 255, 255, 255, 255, 0, 1)
	DrawAdvancedText2(0.897000000000001, 0.505, 0.005, 0.0028, 0.275, "~o~Permis Camion :~b~ "..fakeCamion, 255, 255, 255, 255, 0, 1)

end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if assuranceActive then
			FakeRenderCarte()
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if assuranceActive then
			Wait(10000) --Permet l'affichage pendant 20 secondes
			assuranceActive = false
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("corazon:setInventoryVariable")
AddEventHandler("corazon:setInventoryVariable", function()

	TriggerServerEvent("corazon_core:getPlayerDataMoney")

end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local ITEMS = {}

RegisterNetEvent("corazon:setInventoryVariable")
AddEventHandler("corazon:setInventoryVariable", function(items)

	ITEMS = items

end)

--local playerBank = Cora.playerBank

local personalMenu = {
	Base = { Title = "Menu Personnel" },
	--Base = { Header = {"shopui_title_carmod", "shopui_title_carmod"}, Title = "Corazon" },
	Data = { currentMenu = "menu personnel" },
	Events = {
		onOpened = function(_, s)
			TriggerServerEvent("corazon_item:setInventoryVariable")
			TriggerEvent("corazon_core:getPlayerData")

		end, 

		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			if btn.name == "~b~Sauvegarder Position" then
				RequestToSave()
			end

			if btn.name == "~b~Syncroniser son Personnage" then
				RequestToSave()
				ShowAboveRadarMessage("~b~Personnage Syncronisée")
			end

			if btn.name == "~c~Debug Perso" then
				TriggerEvent('corazon:playerSpawned')
				TriggerServerEvent("corazon:SpawnPlayerLastPosition")
				TriggerServerEvent("corazon:ShowMoneyPM")
				TriggerEvent("corazon_core:getPlayerData")
				TriggerEvent("corazon_core:getPlayerDataMoney")
			end
 
			if btn.name == "~r~Suppression Ped" then
				TriggerServerEvent("corazon:deletePed")
			end

			if btn.name == "~r~Suppression Skin" then
				TriggerServerEvent("corazon:deleteSkin")
			end
			--------------------------------------------------------------------------------------------------------------------------------------------
			
			---------------------------------------------------------------------- Carte d'identité
			if btn.name == "~m~Carte d'identité | ~b~Montrer" then
				
			end

			if btn.name == "~m~Carte d'identité | ~b~Voir" then
				TriggerServerEvent("corazon:ShowServerMeID")
			end
			---------------------------------------------------------------------- Fausse carte d'identité
			if btn.name == "~r~Fausse carte d'identité | ~g~Montrer" then

			end

			if btn.name == "~r~Fausse carte d'identité | ~g~Voir" then
				TriggerServerEvent("corazon:FakeShowServerMeID")
			end

			---------------------------------------------------------------------- Argent
			if btn.name == "Banque" then
				if Cora.playerBank == "" then
					ShowAboveRadarMessage("~r~Erreur, veuillez debuger votre personnage dans les options de ce menu !")
				else
					ShowAboveRadarMessage("~b~Banque : ~w~"..Cora.playerBank.."~b~$")
				end
			end

			if btn.name == "Espece" then
				if Cora.playerBank == "" then
					ShowAboveRadarMessage("~r~Erreur, veuillez debuger votre personnage dans les options de ce menu !")
				else
					ShowAboveRadarMessage("~g~Espece : ~w~"..Cora.playerBank.."~g~$")
				end
			end
		end,
	},

	Menu = {
		["menu personnel"] = {
			slidertime = 75,
			
			b = {
				{ name = "Inventaire", Description = "Inventaire de votre personnage" },
				{ name = "Portefeuille", Description = "Votre portefeuille" },
				{ name = "Factures", Description = "Vos factures" },
                { name = "---------------------------------------------------------------------" },
				{ name = "Options" },
				--{ name = "Mon service", checkbox = function() return setSexeTrue() end },
			}
		},
		
		["inventaire"] = {
			refresh = true,
			b = function() return isosu end
		},


		["portefeuille"] = {
			slidertime = 75,
			b = {
				{ name = "Argent" },
				{ name = "Papiers" },
			}
		},

		
        ["options"] = {
			slidertime = 75,
			b = {
				{ name = "~b~Syncroniser son Personnage", Description = "Sauvegarder votre personnage dans son integralité" },
				{ name = "~b~Sauvegarder Position", Description = "Sauvegarder votre position" },
                { name = "---------------------------------------------------------------------" },
				{ name = "~c~Debug Perso", Description = "Debug votre perso" },
                { name = "---------------------------------------------------------------------" },
				{ name = "~r~Suppression Ped", Description = "~r~Action Irreversible ! ~w~Supprime votre ped" },
				{ name = "~r~Suppression Skin", Description = "~r~Action Irreversible ! ~w~Supprime la customisation de votre personnage" },
			}
		},

		["argent"] = {
			refresh = true,
			b = {
				{ name = "Banque" },
				{ name = "Espece" },
			}
		},

		["papiers"] = {
			slidertime = 75,
			b = {
				{ name = "Carte d'identité" },
				{ name = "Assurance" },
			}
		},

		["carte d'identité"] = {
			slidertime = 75,
			b = {
				{ name = "~m~Carte d'identité | ~b~Montrer" },
				{ name = "~m~Carte d'identité | ~b~Voir" },
				{ name = "~c~-----------------------------------------------------------------" },
				{ name = "~r~Fausse carte d'identité | ~g~Montrer" },
				{ name = "~r~Fausse carte d'identité | ~g~Voir" },
			}
		},

		["assurance"] = {
			slidertime = 75,
			b = {
				{ name = "~g~Montrer" },
				{ name = "~g~Voir" },
			}
		}
	}
}

RegisterCommand("menu", function()
	--TriggerServerEvent("corazon_core:getPlayerDataMoney")
		--CreateMenu(personalMenu)
	TriggerServerEvent("corazon_core:removePlayerMoneyAnt", 10000)
end)

RegisterCommand("test69", function()
	--TriggerServerEvent("corazon_core:removePlayerMoneyAnt", 10000)
	print(Cora.playerMoney)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
		if IsControlJustReleased(0, 166) then
			CreateMenu(personalMenu)
        end  
    end
end)


