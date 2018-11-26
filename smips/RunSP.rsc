:log warning "Importing current GamesList...";
:delay 2;

:if ([:len [/ip firewall mangle find where comment="BATTLEROYALE"]] > 0) do={
local BATTLEROYALE "24000-26000,7000-8000,9000-9080,9151,4010-4040";
/ip firewall mangle set [find  comment="BATTLEROYALE"] dst-port=$BATTLEROYALE;
:log warning "Battle Royale UDP Games updated!";
} else={
/ip firewall mangle 
 add dst-port="24000-26000,7000-8000,9000-9080.9151,4010-4040" dst-address-list="AAGamingAWS" \
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

do { /ip firewall address-list add address=18.208.0.0/13 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.232.0.0/14 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=128.1.73.192 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=52.95.212.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.74.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.93.8.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=103.246.148.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.254.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.255.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.228.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.92.56.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.93.19.236/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=175.41.128.0/18 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.76.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.240.199.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.137.192.0/19 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.76.0.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=122.248.192.0/18 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.240.227.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.93.19.237/32 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.51.216.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.35.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=99.82.173.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.220.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.11.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.248.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.40.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.76.128.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.32.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.251.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.255.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.198.96/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.242.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.240.226.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.137.224.0/19 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.169.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.179.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.119.184.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.231.240.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=3.0.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=43.250.193.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.77.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.119.205.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=43.250.192.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.151.128.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.250.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.144.224.128/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.239.0.96/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.136.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=203.83.220.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.255.254.192/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.251.31.128/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.92.56.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.76.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.40.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.219.32.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.231.240.0/22 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.74.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.254.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.255.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.228.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=175.41.128.0/18 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.137.192.0/19 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.76.0.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=122.248.192.0/18 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.51.216.0/21 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.220.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.94.248.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.76.128.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.251.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.255.32/28 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.95.242.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=46.137.224.0/19 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.169.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.179.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=3.0.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.77.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.119.205.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=54.151.128.0/17 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.250.0.0/15 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.136.0.0/16 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.228.69.0/24 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.220.191.0/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=52.221.221.128/29 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.251.113.64/26 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.251.116.0/23 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.250.186.128/27 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=13.250.186.160/27 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=92.223.52.0/24 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=139.99.121.0/24 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=139.99.124.0/24 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=13.251.74.0/24 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=139.99.124.0/24 list=AAGamingOTHERS } on-error={}

:delay 2;

/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
:delay 2;
/system logging enable 0
   ## script messages ##
:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:local scriptversion "11.07.2018 Revision 23 (Oreo)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Changelog: Added Games (OtherGames) (Revision 23)"
:log warning "Changelog: Updates"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite (Updated)"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/ (Updated)"
:log info "Rules of Survival - ASIA Server: https://www.rulesofsurvivalgame.com/ (Updated)"
:log info "Elite Crystal Flyff:"
:log info "DragonNest Mobile:"
:log info "World of Tanks ASIA: (Updated)"
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
## ending script ##
/system logging enable 0
/file remove [find type="script"]
}