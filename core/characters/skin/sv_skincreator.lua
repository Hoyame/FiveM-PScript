


RegisterServerEvent('corazon_character:save')
AddEventHandler('corazon_character:save', function(skin)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.execute('UPDATE users SET `skin` = @skin WHERE license = @license',
	{
		['@skin'] = json.encode(skin),
		['@license'] = license
	})
end)


RegisterServerEvent('corazon_character:responseSaveSkin')
AddEventHandler('corazon_character:responseSaveSkin', function(skin)
	local file = io.open('resources/[esx]/corazon_character/skins.txt', "a")

	file:write(json.encode(skin) .. "\n\n")
	file:flush()
	file:close()
end)

RegisterServerCallback('corazon_character:getPlayerSkin', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM users WHERE license = @license', {
		['@license'] = license
	}, function(users)
		local user = users[1]
		local skin = nil
		local ped = nil

		if user.skin ~= nil then
			skin = json.decode(user.skin)
		end
		
		if user.ped ~= nil then
			ped = user.ped
		end

		cb(skin, ped)
	end)
end)


--[[
-- Commands
TriggerEvent('corazon_data:addGroupCommand', 'skin', 'admin', function(source, args, user)
	TriggerClientEvent('corazon_character:openSaveableMenu', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Changer de skin'})

TriggerEvent('corazon_data:addGroupCommand', 'skinsave', 'admin', function(source, args, user)
	TriggerClientEvent('corazon_character:requestSaveSkin', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Sauvegarder skin dans un fichier'})
--]]