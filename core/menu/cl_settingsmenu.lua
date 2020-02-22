local voiceactive = false

function LoadingPrompt(loadingText, spinnerType)

    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end

    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end

    EndTextCommandBusyString(spinnerType)
end

AddEventHandler('onClientMapStart', function()
	NetworkSetVoiceActive(0)
end)

local SettingMenu = {
    Base = { Title = "Paramètres" },
    Data = { currentMenu = "paramètres" },
    Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            -- Changer de personnage
            -- Réglages vocal
            if btn.name == "Activer le chat vocal" and voiceactive == true then
                --ESX.ShowColoredNotification('ERREUR: Le chat vocal est déjà activé.', 27)
            end
            if btn.name == "Activer le chat vocal" and voiceactive == false then
                --voiceactive = true
                LoadingPrompt("Connexion au chat vocal...", 3)
                Citizen.Wait(2000)
                --NetworkSetVoiceActive(1)
                --ESX.ShowColoredNotification('Le chat vocal est désormais activé.', 25)
                RemoveLoadingPrompt()
            end
            if btn.name == "Désactiver le chat vocal" and voiceactive == false then
                --ESX.ShowColoredNotification('ERREUR: Le chat vocal est déjà désactivé.', 27)
            end
            if btn.name == "Désactiver le chat vocal" and voiceactive == true then
                --voiceactive = false
                NetworkSetVoiceActive(0)
                --ESX.ShowColoredNotification('Le chat vocal est désormais désactivé.', 25)
            end
            if btn.name == "Intensité -> ~b~Très basse" and voiceactive == true then
                NetworkSetTalkerProximity(3.001)
               -- ESX.ShowNotification('L\'intensité de votre voix a été réglée sur ~h~~b~faible~w~.')
            end 
            if btn.name == "Intensité -> ~b~Très basse" and voiceactive == false then
                --ESX.ShowColoredNotification('ERREUR: Vous n\'avez pas activé le chat vocal.', 27)
             end 
            if btn.name == "Intensité -> ~g~Normale" and voiceactive == true then
                NetworkSetTalkerProximity(5.001)
                --ESX.ShowNotification('L\'intensité de votre voix a été réglée sur ~h~~g~normal~w~.')
            end 
            if btn.name == "Intensité -> ~g~Normale" and voiceactive == false then
                --ESX.ShowColoredNotification('ERREUR: Vous n\'avez pas activé le chat vocal.', 27)
            end 
            if btn.name == "Intensité -> ~r~Très élevée" and voiceactive == true then
                NetworkSetTalkerProximity(12.091)
                --ESX.ShowNotification('L\'intensité de votre voix a été réglée sur ~h~~r~élevée~w~.')
            end 
            if btn.name == "Intensité -> ~r~Très élevée" and voiceactive == false then
                --ESX.ShowColoredNotification('ERREUR: Vous n\'avez pas activé le chat vocal.', 27)
            end 
            -- FIN Réglages vocal
            -- Réglages affichage
            if btn.name == "Activer le radar" then
                DisplayRadar(true)
            end
            if btn.name == "Désactiver le radar" then
                DisplayRadar(false)
            end
            if btn.name == "Activer la vue cinématique" then
                SendNUIMessage({openCinema = true})

				-- TriggerEvent('es:setMoneyDisplay', 0.0) Add if you use es_extended hud
                
                --TriggerEvent('esx_status:setDisplay', 0.0)

                DisplayRadar(false)

                DisplayAmmoThisFrame(false)
            end
            if btn.name == "Désactiver la vue cinématique" then
                SendNUIMessage({openCinema = false})

				-- TriggerEvent('es:setMoneyDisplay', 0.0) Add if you use es_extended hud
                
                --TriggerEvent('esx_status:setDisplay', 1.0)

                DisplayRadar(true)

                DisplayAmmoThisFrame(true)
            end
            -- FIN Réglages affichage
            -- Réglages filtres
            if btn.name == "Normal" then
                SetTimecycleModifier('')
            end
            if btn.name == "Vue & lumières améliorées" then
                SetTimecycleModifier('tunnel')
            end
            if btn.name == "Couleurs amplifiées" then
                SetTimecycleModifier('rply_saturation')
            end
            if btn.name == "Noir & blanc" then
                SetTimecycleModifier('rply_saturation_neg')
            end
            -- FIN Réglages filtres
            -- Optimisation
            if btn.name == "Optimiser votre client FiveM" then
                
            self:CloseMenu(true)
            DoScreenFadeIn(2000)
            LoadingPrompt("Optimisation en cours...", 3)
            DoScreenFadeOut(2000)
            Citizen.Wait(2000)
            DoScreenFadeIn(1500)
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearHelp()
            ClearNotificationsPos()
            ClearPedInPauseMenu()
            ClearFloatingHelp()
            ClearGpsPlayerWaypoint()
            ClearGpsRaceTrack()
            ClearReminderMessage()
            ClearThisPrint()

            Citizen.Wait(2090)

            --print('Client FiveM optimisé.')
            --ESX.ShowColoredNotification("✅ Optimisation effectuée.", 25)
            RemoveLoadingPrompt()
            Citizen.Wait(100)
            PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)

            end

            if btn.name == "Conseils d'optimisations pour FiveM" then
                self:CloseMenu(true)
                --ESX.ShowHelpNotification('Conseil N°1: Dans les paramètres de votre jeu, baissez au maximum la densité & variété des PNJ.')
                Citizen.Wait(12000)
                --ESX.ShowHelpNotification('Conseil N°2: Videz régulièrement le cache de votre FiveM.')
                Citizen.Wait(8000)
                --ESX.ShowHelpNotification('Conseil N°3: Inutile de mettre vos paramètres au maximum, privilègiez la performance.')
                Citizen.Wait(11000)
                --ESX.ShowHelpNotification('Conseil N°4: De temps en temps, allez sur le menu F10, puis Optimisation et Optimiser votre FiveM.')
                Citizen.Wait(11000)
                --ESX.ShowHelpNotification('Conseil N°5: Un bon processeur et minimum 8GO de ram sont requis pour profiter de l\'experience RP.')
                Citizen.Wait(12000)
                --ESX.ShowHelpNotification('Profitez-bien, bon jeu à vous sur Advanced V !')
                print('Séquence de tutoriel terminée.')
            end
            -- Fin Optimisation
        end,
    },

    Menu = {
        ["paramètres"] = {
            b = {
                {name = "Changer de personnage"},
                {name = "----------------------------------------------------------------------"},
                {name = "Paramètres vocal"},
                {name = "Réglages affichage"},
                {name = "Réglages filtres"},
                {name = "----------------------------------------------------------------------"},
                {name = "Optimisation"},
            }
        },

        ["paramètres vocal"] = {
            b = {
                {name = "Activer le chat vocal"},
                {name = "Désactiver le chat vocal"},
                {name = "----------------------------------------------------------------------"},
                {name = "Intensité -> ~b~Très basse"},
                {name = "Intensité -> ~g~Normale"},
                {name = "Intensité -> ~r~Très élevée"},
            }
        },

        
        ["réglages affichage"] = {
            b = {
                {name = "Activer le radar"},
                {name = "Désactiver le radar"},
                {name = "----------------------------------------------------------------------"},
                {name = "Activer la vue cinématique"},
                {name = "Désactiver la vue cinématique"},
                {name = "----------------------------------------------------------------------"},
                {name = "Activer les barres de faim/soif"},
                {name = "Désactiver les barres de faim/soif"},
            }
        },

        ["réglages filtres"] = {
            b = {
                {name = "Normal"},
                {name = "Vue & lumières améliorées"},
                {name = "Couleurs amplifiées"},
                {name = "Noir & blanc"},
            }
        },

        ["optimisation"] = {
            b = {
                {name = "Optimiser votre client FiveM"},
                {name = "Conseils d'optimisations pour FiveM"},
            }
        },
    
    }
}



Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, 57) then
            CreateMenu(SettingMenu)
        end  
    end
end)