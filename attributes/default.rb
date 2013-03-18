# Media Server
node.default[:plex][:media_server][:dmg_volume] = "PlexMediaServer"
node.default[:plex][:media_server][:dmg_url]    = "http://plex.r.worldssl.net/PlexMediaServer/0.9.7.17.469-1f0b170/PlexMediaServer-0.9.7.17.469-1f0b170-OSX.dmg"
node.default[:plex][:media_server][:channels]   = []
# Media Center
node.default[:plex][:media_center][:zip_url]    = "http://plex.r.worldssl.net/plex-laika/0.9.5.4/Plex-0.9.5.4-973998f.zip"
# Silverlight
node.default[:plex][:silverlight][:dmg_url]     =  "http://silverlight.dlservice.microsoft.com/download/5/A/C/5AC56802-B26B-4876-8872-7303C8F27072/20125.00/runtime/Silverlight.dmg"
node.default[:plex][:silverlight][:pkg_id]      =  "com.microsoft.SilverlightInstaller"
# Flash Player
node.default[:plex][:flash_player][:dmg_url]    = "http://aihdownload.adobe.com/bin/live/AdobeFlashPlayerInstaller_11_aih.dmg"
node.default[:plex][:flash_player][:dmg_volume] = "Adobe Flash Player Installer"
