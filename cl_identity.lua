local identityMenu = {
	Base = { Title = "Mon Personnage", Blocked = true },
	Data = { currentMenu = "identité" },
	Events = {
		onSelected = function(self, _, btn)
			if btn.name == "~g~Confirmer" then
				local buttons, identityData = self.Menu["identité"].b, {}
				
				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local lieuIdentity = buttons[3].askValue or buttons[3].ask
				local lieuIdentity = buttons[4].askValue or buttons[4].ask
				local lieuIdentity = buttons[5].askValue or buttons[5].ask

				if not identityData or not identityData.l or string.len(identityData.l) <= 0 or not identityData.d or tableCount(identityData.d) ~= 3 or not identityData.d[1] or identityData.d[1] == "0" then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété la catégorie identité.") return 
                else
                    TriggerServerEvent("corazon:saveIdentity", nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)

                    self:CloseMenu(true)
					TriggerEvent("corazon:launcherCar")
				end
			end
			
			if btn.name == "~b~Valider" then
				local buttons, identityData = self.Menu["identité"].b, {}
				
				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local lieuIdentity = buttons[3].askValue or buttons[3].ask
				local lieuIdentity = buttons[4].askValue or buttons[4].ask
				local lieuIdentity = buttons[5].askValue or buttons[5].ask

				if not identityData or not identityData.l or string.len(identityData.l) <= 0 or not identityData.d or tableCount(identityData.d) ~= 3 or not identityData.d[1] or identityData.d[1] == "0" then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété la catégorie identité.") return 
				else
					TriggerServerEvent("corazon:saveIdentity", nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
                    self:CloseMenu(true)
                    TriggerEvent("corazon:upVarOpen")
					TriggerEvent('corazon_character:openSaveableMenu', source)
				end
			end
		end,
	},

	Menu = {
		["identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Où votre personnage est-il né?", ask = "Los Santos" },
				{ name = "Jour de naissance", ask = "31" },
				{ name = "Mois de naissance", ask = "Mois" },
				{ name = "Année de naissance", ask = "Année" },
				{ name = "~g~Continuer" }
			}
		}, 
		["~g~continuer"] = {
			slidertime = 75,
			b = {
				--{ name = "~g~Choisir un ped", Description = "Choisir un personnage de GTA, customisation impossibles" },
				{ name = "~g~Choisir un personnage et le customiser", Description = "Choisir un personnage de base Homme ou Femme et le customiser" }
			}
		},
		
		["~g~choisir un ped"] = {
			slidertime = 75,
			b = {
				{ name = "~o~Êtes-vous sur de continuer" },
				{ name = "~g~Confirmer", Description = "Un nouveau menu sera ouvert et vous pourrez choisir votre ped" },
				{ name = "~o~Êtes-vous sur de continuer" }
			}
		},		
		
		["~g~choisir un personnage et le customiser"] = {
			slidertime = 75,
			b = {
				{ name = "~o~Êtes-vous sur de continuer" },
				{ name = "~b~Valider", Description = "Un nouveau menu sera ouvert et vous pourrez choisir votre personnage et le custom" },
				{ name = "~o~Êtes-vous sur de continuer" }
			}
		}
	}
}

RegisterNetEvent("corazon:tempChar")
AddEventHandler("corazon:tempChar", function(id)
	CreateMenu(identityMenu)
end)


RegisterCommand("identité", function()
    TriggerEvent("corazon:tempChar")
end)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local fakeIdentityMenu = {
	Base = { Title = "Fausse Identité" },
	Data = { currentMenu = "fausse identité" },
	Events = {
		onSelected = function(self, _, btn)	
			if btn.name == "~g~Confirmer" then
				local buttons, identityData = self.Menu["fausse identité"].b, {}
				
				identityData = {
					n = buttons[1].askValue or buttons[1].ask,
					l = buttons[2].askValue or buttons[2].ask,
					d = { buttons[3].slidename, buttons[4].slidename, buttons[5].slidename },
				}

				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local jourIdentity = buttons[3].slidename
				local moisIdentity = buttons[4].slidename
				local yearIdentity = buttons[5].slidename
				local jobIdentity = buttons[6].slidename

				if not identityData or not identityData.l or string.len(identityData.l) <= 0 or not identityData.d or tableCount(identityData.d) ~= 3 or not identityData.d[1] or identityData.d[1] == "0" then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété la catégorie identité.") return 
				else
					TriggerServerEvent("corazon:saveFakeIdentity", nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
                    self:CloseMenu(true)
				end
			end
		end,
	},

	Menu = {
		["fausse identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Où votre personnage est-il né?", ask = "Los Santos" },
				{ name = "Jour de naissance", ask = "31" },
				{ name = "Mois de naissance", ask = "Mois" },
				{ name = "Année de naissance", ask = "Année" },
				{ name = "Job", ask = "Metier" },
				{ name = "~g~Confirmer" }
			}
		}
	}
}

RegisterCommand("fausseidentité", function()
	CreateMenu(fakeIdentityMenu)
end)


