local corazon = {}

Cora = {}
-------------------------------------------------------------------------------------------------------------------------------------------------
Cora.playerName = ""
Cora.playerJob = ""
-------------------------------------------------------------------------------------------------------------------------------------------------
Cora.playerMoney = ""
Cora.playerBank = ""
Cora.playerSale = ""
-------------------------------------------------------------------------------------------------------------------------------------------------
Cora.playerLevel = ""
Cora.playerGroup = ""

local playerName = ""
-------------------------------------------------------------------------------------------------------------------------------------------------
local playerData = {}
-------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

function callEventPlayerName()
    TriggerServerEvent("corazon_core:goGetNamePlayer")
end

RegisterNetEvent("corazon_core:getNamePlayer")
AddEventHandler("corazon_core:getNamePlayer", function(result)
    playerName = tostring(result[1].nameIdentity)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le job du joueur

function callEventPlayerJob()
    TriggerServerEvent("corazon_core:goGetJobPlayer")
end

RegisterNetEvent("corazon_core:getJobPlayer")
AddEventHandler("corazon_core:getJobPlayer", function(result)
    Cora.playerJob = tostring(result[1].job)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le job du joueur

function callEventPlayerMoney()
    TriggerServerEvent("corazon_core:goGetMoneyPlayer")
end

RegisterNetEvent("corazon_core:getMoneyPlayer")
AddEventHandler("corazon_core:getMoneyPlayer", function(result)
	Cora.playerMoney = tostring(result[1].money)
    Cora.playerBank = tostring(result[1].bank)
    Cora.playerSale = tostring(result[1].sale)
end)

-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

function callEventPlayerisAdmin()
    TriggerServerEvent("corazon_core:goGetPlayerisAdmin")
end

----------------------------------------------------------------------------------------
-- Evenement a appeler quand le joueur rejoint le serveur

RegisterNetEvent("corazon_core:getPlayerData")
AddEventHandler("corazon_core:getPlayerData", function()
    callEventPlayerName()
    callEventPlayerJob()
    callEventPlayerMoney()
    callEventPlayerisAdmin()
end)


RegisterCommand("buff", function()
    TriggerEvent("corazon_core:getPlayerData")
    --print(Cora.playerName)
end)

RegisterCommand("bufff1", function()
    --TriggerEvent("corazon_core:getPlayerData")
    print(playerName)
end)

-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

