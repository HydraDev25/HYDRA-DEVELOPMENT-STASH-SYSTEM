fx_version 'cerulean'
game 'gta5'

author 'z4r3'
description 'Hydra-Development Stash System'
version '1.0.0'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'

dependencies {
    'ox_inventory',
    'oxmysql'
}
