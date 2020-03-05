local isBuy = 0
local money = 0
RegisterServerEvent("corazon_p:getAppart")
AddEventHandler('corazon_p:getAppart', function(name)
	local player = GetPlayerIdentifiers(source)[1]
	local source = source
	local name = name
	local result = MySQL.Sync.fetchAll("SELECT license FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)})
	if (result) then
		count = 0
		for _ in pairs(result) do
			count = count +1
		end
		if count > 0 then
			if (result[1].license == player) then
				TriggerClientEvent('corazon_p:isMine', source, result[1].license)
			else
				TriggerClientEvent('corazon_p:isBuy', source, result[1].license)
			end
		else
			TriggerClientEvent('corazon_p:isNotBuy', source)
		end
	end
end)

RegisterServerEvent("corazon_p:getPlayerisInside")
AddEventHandler('corazon_p:getPlayerisInside', function(player,appartname)
  local source = source
  
  local result2 = MySQL.Sync.fetchAll("SELECT nom,serverid FROM users WHERE license = @license", {['@license'] = player})
  if (result2[1]) then
	else
    TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Le propriétaire n'est pas connecté!~s~")
	end

	local result = MySQL.Sync.fetchAll("SELECT isInside FROM user_appartement WHERE license = @license", {['@license'] = player})
  if result[1].isInside == 0 then
      TriggerClientEvent('nMenuNotif:showNotification', source, "~r~Désolé, aucune personne presente pour vous ouvrir.")
  else
    TriggerClientEvent('nMenuNotif:showNotification', source, "Vous avez sonné à l'appartement")
    TriggerClientEvent('callsystem:ReceiveDringAppart', tonumber(result2[1].serverid), source, GetPlayerName(source), appartname)
  end
end)

RegisterServerEvent("corazon_p:updateIsInside")
AddEventHandler('corazon_p:updateIsInside', function()
  local source = source
  local license = GetPlayerIdentifiers(source)[1]


  local result = MySQL.Sync.fetchAll("SELECT isInside FROM user_appartement WHERE license = @license", {['@license'] = license})
  if result[1].isInside == 0 then
      MySQL.Sync.execute("UPDATE user_appartement SET isInside = 1 WHERE license = @username", {['@username'] = license})
  elseif result[1].isInside == 1 then
      MySQL.Sync.execute("UPDATE user_appartement SET isInside = 0 WHERE license = @username", {['@username'] = license})
  end
end)

RegisterServerEvent("corazon_p:buyAppart")
AddEventHandler('corazon_p:buyAppart', function(name, price)
  local source = source
	local license = GetPlayerIdentifiers(source)[1]
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local name = name
    local price = price
    if (tonumber(user.getMoney()) >= tonumber(price)) then
        user.removeMoney(price)
        MySQL.Sync.execute("INSERT INTO user_appartement (`license`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = license, ['@name'] = name, ['@price'] = price})
        TriggerClientEvent('nMenuNotif:showNotification', source, "Bienvenue dans votre appartement!") --A CHANGER
        TriggerClientEvent('corazon_p:isMine', source)
    else
        TriggerClientEvent('nMenuNotif:showNotification', source, "Vous n\'avez pas assez d\'argent!")
    end
  end)
end)

RegisterServerEvent("corazon_p:sellAppart")
AddEventHandler('corazon_p:sellAppart', function(name, price)
  local source = source
	local license = GetPlayerIdentifiers(source)[1]
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local name = name
    local price = price
    user.addMoney(price)
	  MySQL.Sync.execute("DELETE from user_appartement WHERE license = @username AND name = @name", {['@username'] = license, ['@name'] = name})
    TriggerClientEvent('corazon_p:isNotBuy', source)
  end)
end)



function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end