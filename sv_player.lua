local corazon = {}

Cora = {}
Cora.Player = {}

----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

RegisterNetEvent("corazon_core:goGetNamePlayer")
AddEventHandler("corazon_core:goGetNamePlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT nameIdentity FROM user_characters WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getNamePlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir le nom du joueur

RegisterNetEvent("corazon_core:goGetJobPlayer")
AddEventHandler("corazon_core:goGetJobPlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT job FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getJobPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour avoir l'argent du joueur

RegisterNetEvent("corazon_core:goGetMoneyPlayer")
AddEventHandler("corazon_core:goGetMoneyPlayer", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT money, bank, sale FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getMoneyPlayer", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour savoir si le joueur est staff

RegisterNetEvent("corazon_core:goGetPlayerisAdmin")
AddEventHandler("corazon_core:goGetPlayerisAdmin", function()
	local source = source	
	local player = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT permission_level, permission_group FROM users WHERE license = @license", {['@license'] = player})
    
	TriggerClientEvent("corazon_core:getPlayerisAdmin", source, result)
end)

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en cash

function functionsAddMoney(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT money FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET money = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money + amount)
	})

	--local soldActu = math.abs(result[1].money + amount)

	--TriggerClientEvent("corazon:ShowAboveRadarMessage", "Argent Reçu :"..amount.." ")
	--TriggerClientEvent("corazon:ShowAboveRadarMessage", "Solde Actuel :"..soldActu.." ")

end

RegisterNetEvent("corazon_core:functionAddMoney")
AddEventHandler("corazon_core:functionAddMoney", function(amount)
	functionsAddMoney(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en cash

function functionsRemoveMoney(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT money FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET money = @money WHERE license = @license', {
		['@license'] = license, 
		['@money'] = math.abs(result[1].money - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveMoney")
AddEventHandler("corazon_core:functionRemoveMoney", function(amount)
	functionsRemoveMoney(amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en banque

function functionsAddBank(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT bank FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET bank = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddBank")
AddEventHandler("corazon_core:functionAddBank", function(amount)
	functionsAddBank(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en banque

function functionsRemoveBank(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT bank FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET bank = @bank WHERE license = @license', {
		['@license'] = license, 
		['@bank'] = math.abs(result[1].bank - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveBank")
AddEventHandler("corazon_core:functionRemoveBank", function(amount)
	functionsRemoveBank(amount)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Fonction pour ajouter l'argent en sale

function functionsAddSale(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT sale FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET sale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale + amount)
	})

end

RegisterNetEvent("corazon_core:functionAddSale")
AddEventHandler("corazon_core:functionAddSale", function(amount)
	functionsAddSale(amount)
end)

----------------------------------------------------------------------------------------
-- Fonction pour retirer de l'argent en sale

function functionsRemoveSale(amount)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchAll('SELECT sale FROM users WHERE license = @license', {['@license'] = license})
		
	MySQL.Async.execute('UPDATE users SET sale = @sale WHERE license = @license', {
		['@license'] = license, 
		['@sale'] = math.abs(result[1].sale - amount)
	})

end

RegisterNetEvent("corazon_core:functionRemoveSale")
AddEventHandler("corazon_core:functionRemoveSale", function(amount)
	functionsRemoveSale(amount)
end)



