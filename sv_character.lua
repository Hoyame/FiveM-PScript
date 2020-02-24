------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Sauvegarde Perso
------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('corazon_character:savePed')
AddEventHandler('corazon_character:savePed', function(sexeData)
	local license = GetPlayerIdentifiers(source)[1]
	local fakePed = "FakePed"
	--local ptnm = '{"pants_2":0,"hair_color_2":0,"eye_color":0,"beard_4":0,"torso_2":0,"hair_1":0,"beard_1":0,"hair_2":0,"hair_color_1":0,"shoes_1":0,"watches_2":-1,"pants_1":0,"arms_2":0,"ears_2":-1,"complexion_2":1,"face":14,"eyebrows_2":10,"glasses_2":0,"helmet_1":-1,"ears_1":-1,"tshirt_1":0,"moles_1":0,"skin":12,"torso_1":0,"sex":0,"tshirt_2":0,"age_2":0,"chain_2":0,"shoes_2":0,"age_1":0,"beard_2":10,"complexion_1":0,"helmet_2":-1,"arms":0,"eyebrows_1":0,"chain_1":0,"moles_2":1,"glasses_1":0,"watches_1":-1,"beard_3":0}'

	MySQL.Async.execute('UPDATE users SET ped = @sexeData WHERE license = @license', {
		['@sexeData'] = sexeData,
		['@license'] = license
	})

	--MySQL.Async.execute('UPDATE users SET skin = @skin WHERE license = @license', {
	--	['@license'] = license,
	--	['@skin'] = ptnm
	--})

end)

--------------------------------

RegisterServerEvent("corazon:deletePed")
AddEventHandler("corazon:deletePed", function()
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Sync.execute("UPDATE users SET ped=@ped WHERE license=@license", {
		['@license'] = license, 
		['@ped'] = NULL
	})

end)

RegisterServerEvent("corazon:deleteSkin")
AddEventHandler("corazon:deleteSkin", function()
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Sync.execute("UPDATE users SET skin=@skin WHERE license=@license", {
		['@license'] = license, 
		['@skin'] = NULL
	})

end)

----------------------------------------------------------------------------------------------------------------

RegisterServerEvent("corazon:firstConnexionCreate")
AddEventHandler("corazon:firstConnexionCreate", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Sync.execute("UPDATE users SET serverid = @serverid WHERE license = @license", {['@license'] = license, ['@serverid'] = source})

	MySQL.Sync.execute("INSERT INTO user_characters(license) VALUES (@license)",{['@license']=license})
	MySQL.Sync.execute("INSERT INTO user_fakecharacters(license) VALUES (@license)",{['@license']=license})
	MySQL.Sync.execute("UPDATE users SET isFirstConnection = 0 WHERE license = @username", {['@username'] = license})
	
	TriggerClientEvent("corazon:tempChar")
end)

RegisterServerEvent("corazon:LoadNewCharacter")
AddEventHandler("corazon:LoadNewCharacter",function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	
	MySQL.Async.fetchAll("SELECT characterTbl FROM user_characters WHERE license=@license",{['@license']=license}, function(result)
		TriggerClientEvent("corazon:updatePerso",source,{result[1].characterTbl})
	end)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Sauvegarde Position
------------------------------------------------------------------------------------------------------------------------------------------------------------

function lastposplayer(license)
	return MySQL.Sync.fetchScalar("SELECT lastpos FROM users WHERE license = @username", {['@username'] = license})
end

RegisterServerEvent("corazon:SavePos")
AddEventHandler("corazon:SavePos", function( LastPosX , LastPosY , LastPosZ )
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local LastPos = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. "}"
	MySQL.Sync.execute("UPDATE users SET lastpos = @lastpos WHERE license = @username", {['@username'] = license, ['@lastpos'] = LastPos})
end)

RegisterServerEvent("corazon:SpawnPlayerLastPosition")
AddEventHandler("corazon:SpawnPlayerLastPosition", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local lastpos = lastposplayer(license)
	if lastpos ~= "" then
		local ToSpawnPos = json.decode(lastpos)
		TriggerClientEvent("corazon:LastPostClient", source, ToSpawnPos[1], ToSpawnPos[2], ToSpawnPos[3])
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------