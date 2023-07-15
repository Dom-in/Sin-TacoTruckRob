fx_version 'bodacious'

game 'gta5'

description 'Taco Truck Robbery By Sin Store (QBCore & ESX Version)'

shared_scripts {
    'config.lua'
}

server_scripts {
	'server/sv_main.lua'
}

client_scripts {
	'client/cl_main.lua'
}

dependencies {
	'cs_lib'
}

lua54 'yes'