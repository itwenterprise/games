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

do { /ip firewall address-list add address=18.208.0.0/13 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=18.232.0.0/14 list=AAGamingAWS } on-error={}
do { /ip firewall address-list add address=128.1.73.192 list=AAGamingOTHERS } on-error={}

:delay 2;

/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled

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
  } else={
  	:log warning "No Routerboard firmware upgrade found"
   }
   :delay 1;
 ## end script ##
/system logging enable 0
/file remove [find type="script"]
}