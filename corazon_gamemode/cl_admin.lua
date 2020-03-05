local helper = ""
local modo = ""
local admin = ""
local dev = ""
local owner = ""

local playerLevel = ""
local playerGroup = ""

----------------------------------------------------------------------------------------
-- Fonction pour savoir si le joueur est staff

RegisterNetEvent("corazon_core:getPlayerisAdmin")
AddEventHandler("corazon_core:getPlayerisAdmin", function(result)
    playerLevel = tostring(result[1].permission_level)
    playerGroup = tostring(result[1].permission_group)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local staffHelperMenu = {
	Base = { Title = "Mon Personnage" },
	Data = { currentMenu = "helper" },
	Events = {
		onSelected = function(self, _, btn)
			print(btn.name)
		end,
	},

	Menu = {
		["helper"] = {
			b = {
				{ name = "~g~Helper" }
			}
		}
	}
}

local staffModoMenu = {
	Base = { Title = "Mon Personnage" },
	Data = { currentMenu = "modo" },
	Events = {
		onSelected = function(self, _, btn)
			print(btn.name)
		end,
	},

	Menu = {
		["modo"] = {
			b = {
				{ name = "~g~Modo" }
			}
		}
	}
}

local staffAdminMenu = {
	Base = { Title = "Mon Personnage" },
	Data = { currentMenu = "admin" },
	Events = {
		onSelected = function(self, _, btn)
			print(btn.name)
		end,
	},

	Menu = {
		["admin"] = {
			b = {
				{ name = "~g~Admin" }
			}
		}
	}
}

local staffOwnerMenu = {
	Base = { Title = "Mon Personnage" },
	Data = { currentMenu = "owner" },
	Events = {
		onSelected = function(self, _, btn)
			print(btn.name)
		end,
	},

	Menu = {
		["owner"] = {
			b = {
				{ name = "~g~Owner" }
			}
		}
	}
}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
Citizen.CreateThread(function()
    while true do
		Wait(0)
		if IsControlJustReleased(0, 56) then
			if playerGroup == "" then
				ShowAboveRadarMessage("~b~Vous n'avez pas la permission d'ouvrir ce menu !")
			if playerGroup == helper then
				CreateMenu(helperMenu)
			elseif playerGroup == modo then
				CreateMenu(modoMenu)
			elseif playerGroup == admin then
				CreateMenu(adminMenu)
			elseif playerGroup == dev then
				CreateMenu(devMenu)
			elseif playerGroup == owner then
				CreateMenu(ownerMenu)
			end
		end
    end
end)
--]]

function openStaffMenuInGrade()
	if playerGroup == "" then
		ShowAboveRadarMessage("Vous n'avez pas la permission d'ouvrir ce menu")
	elseif playerGroup == "helper" then
		CreateMenu(staffHelperMenu)
	elseif playerGroup == "modo" then
		CreateMenu(staffModoMenu)
	elseif playerGroup == "admin" then
		CreateMenu(staffAdminMenu)
	elseif playerGroup == "owner" then
		CreateMenu(staffOwnerMenu)
	end
end

RegisterCommand("debug1", function()
	print(playerGroup)
end)

RegisterCommand("admin", function()
	openStaffMenuInGrade()
end)

Citizen.CreateThread(function()
    while true do
		Wait(0)
		if IsControlJustReleased(0, 170) then
			openStaffMenuInGrade()
		end
    end
end)
