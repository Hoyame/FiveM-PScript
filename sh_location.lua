function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, 218.81, -811.01, 30.66, 111.641, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "Location")
end

local locationVehicule = {
	Base = { Title = "Location Vehicule" },
	Data = { currentMenu = "location vehicule" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			if btn.name == "Louer un vehicule" then
                spawnCar("faggio")
                ShowAboveRadarMessage("Le vehicule est derriere vous")
                self:CloseMenu(true)
            end
            
		end,
	},

	Menu = {
		["location vehicule"] = {
			slidertime = 75,
			b = {
                { name = "Louer un vehicule" },
			}
        }
	}
}


local positionLester = {
    {x = 213.51, y = -809.08, z = 31.01}
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionLester) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionLester[k].x, positionLester[k].y, positionLester[k].z)

            if dist <= 2.0 then
                ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~b~Jhonny")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(locationVehicule)
				end
            end
        end
    end
end)


Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_y_beachvesp_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "a_m_y_beachvesp_01", 213.51, -809.08, 30.01, 266.946, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)