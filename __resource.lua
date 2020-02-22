resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

----------------------------------------------------------------
----------------------------------------------------------------
----------------------------------------------------------------

server_script '@mysql-async/lib/MySQL.lua'

-------------------------------- Core

-------- HC

client_script 'core/sh_core.lua'
server_script 'core/sv_core.lua'

client_script 'core/player/cl_skinchanger.lua'
client_script 'core/player/cl_player.lua'
client_script 'core/player/sv_player.lua'

client_script 'core/characters/identity/cl_identity.lua'
server_script 'core/characters/identity/sv_identity.lua'

----------------------------------------

client_script 'core/menu/cl_personalmenu.lua'
server_script 'core/menu/sv_personalmenu.lua'

client_script 'core/admin/cl_admin.lua'

client_script 'core/world/cl_agentimmo.lua'
client_script 'core/world/cl_appartement.lua'
server_script 'core/world/sv_appartement.lua'
-----------------------------------------

client_script 'core/stores/sh_shops.lua'
client_script 'core/stores/sh_lester.lua'
client_script 'core/stores/sh_location.lua'


--[[
dependencies {
	'skinchanger'
}
--]]