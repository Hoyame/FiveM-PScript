ServerCallbacks = {}

RegisterServerEvent('trigger_server_callback')
AddEventHandler('trigger_server_callback', function(name, requestId, ...)
    local _source = source
    
    TriggerServerCallback(name, requestID, _source, function(...)
        TriggerClientEvent('server_callback', _source, requestId, ...)
    end, ...)
end)

RegisterServerCallback = function(name, cb)
    ServerCallbacks[name] = cb
end

TriggerServerCallback = function(name, requestId, source, cb, ...)
    if ServerCallbacks[name] ~= nil then
        ServerCallbacks[name](source, cb, ...)
    else
    end
end


-------------------------------------------------------------
function lastposplayer(license)
	return MySQL.Sync.fetchScalar("SELECT lastpos FROM users WHERE license = @license", {['@license'] = license})
end

RegisterServerEvent("corazon:SavePos")
AddEventHandler("corazon:SavePos", function(LastPosX, LastPosY, LastPosZ)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local LastPos = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ .. "}"
	MySQL.Sync.execute("UPDATE users SET lastpos = @lastpos WHERE license = @license", {['@license'] = license, ['@lastpos'] = LastPos})
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

