RegisterServerEvent('corazon:ShowServerMeID')
AddEventHandler('corazon:ShowServerMeID', function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, armePermis, voiturePermis, motoPermis, camionPermis FROM user_characters WHERE license = @license", {['@license'] = player})
	TriggerClientEvent('corazon:ShowClientIDCard', source, result)
end)

RegisterServerEvent('corazon:ShowServerPeopleID')
AddEventHandler('corazon:ShowServerPeopleID', function(NearestPlayerSID)
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT job, nom, prenom, age FROM users WHERE license = @license", {['@license'] = player})
	if NearestPlayerSID ~= 0 then
		TriggerClientEvent('corazon:ShowClientIDCard', NearestPlayerSID, result)
		TriggerClientEvent('corazon:showNotification', NearestPlayerSID, "Une personne vous montre son identité.")
	else
		TriggerClientEvent('corazon:showNotification', source, "Aucune personne devant vous")
	end
end)

--------------------------

RegisterServerEvent('corazon:FakeShowServerMeID')
AddEventHandler('corazon:FakeShowServerMeID', function()
	local player = GetPlayerIdentifiers(source)[1]
	local source = source	
	local result = MySQL.Sync.fetchAll("SELECT nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, armePermis, voiturePermis, motoPermis, camionPermis, jobIdentity FROM user_fakecharacters WHERE license = @license", {['@license'] = player})
	TriggerClientEvent('corazon:FakeShowClientIDCard', source, result)
end)

