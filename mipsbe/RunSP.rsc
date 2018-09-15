:log warning "Importing current GamesList...";
:delay 2;

:if ([:len [/ip firewall mangle find where comment="BATTLEROYALE"]] > 0) do={
local BATTLEROYALE "24000-26000,7000-8000,9000-9050,4010-4040";
/ip firewall mangle set [find  comment="BATTLEROYALE"] dst-port=$BATTLEROYALE;
:log warning "Battle Royale UDP Games updated!";
} else={
/ip firewall mangle 
 add dst-port="24000-26000,7000-8000,9000-9050,4010-4040" dst-address-list="AAGamingAWS" \
			chain=prerouting connection-type=!ftp protocol=udp src-address-list="SHOPLAN" \
			layer7-protocol=!L7-Torrent action=mark-connection new-connection-mark=games-othergames \
			passthrough=yes comment="BATTLEROYALE" place-before=[find where connection-mark~"games-othergames" \
			and new-routing-mark~"Gaming"];}
:delay 2;

:if ([:len [/ip firewall mangle find where comment="BATTLEROYALETCP"]] > 0) do={
local BATTLEROYALETCP "9020-9080";
/ip firewall mangle set [find  comment="BATTLEROYALETCP"] dst-port=$BATTLEROYALETCP;
:log warning "Battle Royale TCP Games updated!";
} else={
/ip firewall mangle 
 add dst-port="9020-9080" dst-address-list="AAGamingAWS" \
			chain=prerouting connection-type=!ftp protocol=tcp src-address-list="SHOPLAN" \
			layer7-protocol=!L7-Torrent action=mark-connection new-connection-mark=games-othergames \
			passthrough=yes comment="BATTLEROYALETCP" place-before=[find where connection-mark~"games-othergames" \
			and new-routing-mark~"Gaming"];}

{


do { /ip firewall address-list add address=35.180.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.64.0/20 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.80.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.88.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.92.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.47.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.16.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.249.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.154.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.156.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.254.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.209.128/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.210.64/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.1.16/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.154.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.156.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.180.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.47.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.249.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.254.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.47.139.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.47.73.72/29 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.153.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.184.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.194.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.196.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.156.0.0/14 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.28.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.29.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.184.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.57.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.58.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.92.68.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.93.48.22/31 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.17.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.69.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.198.48/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.204.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.248.112/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.248.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.255.128/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.119.188.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.209.0/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.210.192/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.211.0/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.44.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.72.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.93.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.231.192.0/20 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.0.160/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.4.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.54.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.56.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.106.252/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.106.253/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.107.252/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.107.253/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.92.68.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.44.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.72.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.231.192.0/20 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.153.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.184.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.194.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.196.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.156.0.0/14 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.28.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.29.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.46.184.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.57.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.58.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.248.112/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.248.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.255.128/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.93.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.158.136.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.57.254.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.157.127.248/29 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.184.2.128/25 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=35.158.127.64/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.208.0.0/13 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.232.0.0/14 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=128.1.73.192 list=AAGamingOTHERS } on-error={}

:delay 2;

/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
:delay 2;
/system logging enable 0
   ## script messages ##
:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:local scriptversion "09.06.2018 Revision 18 (Oreo)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Changelog: Added Games (OtherGames) (Revision 18)"
:log warning "Changelog: Updates"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite (Updated)"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/ (Updated)"
:log info "Rules of Survival - ASIA Server: https://www.rulesofsurvivalgame.com/ (Updated)"
:log info "Elite Crystal Flyff:"
:log info "DragonNest Mobile:"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Facebook: https://www.facebook.com/itwcomputersolution"

## RouterOS latest, checking for firmware updates
:log warning "Checking for Routerboard firmware upgrade...";
/system routerboard
:if ([get current-firmware] != [get upgrade-firmware]) do={ 
  ## New version of firmware available, let's upgrade
  :log info "Upgrading firmware on router $[/system identity get name] from $[/system routerboard get current-firmware] to $[/system routerboard get upgrade-firmware]"
  ## Wait for mail to be send & upgrade
  :delay 3s;
  upgrade
  :log info "Upgrade Complete! Reboot Mikrotik Routerboard to take effect"
  } else={
  	:log warning "No Routerboard firmware upgrade found"
   }
   :delay 1;
 ## end script ##
/system logging enable 0
/file remove [find type="script"]
}