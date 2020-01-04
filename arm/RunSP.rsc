:log warning "Importing current GamesList...";
:delay 2;

:if ([:len [/ip firewall mangle find where comment="BATTLEROYALE"]] > 0) do={
local BATTLEROYALE "24000-26000,7000-8000,9000-9080,9151,4010-4040,5502";
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
local BATTLEROYALETCP "9020-9080,5502";
/ip firewall mangle set [find  comment="BATTLEROYALETCP"] dst-port=$BATTLEROYALETCP;
:log warning "Battle Royale TCP Games updated!";
} else={
/ip firewall mangle 
 add dst-port="9020-9080" dst-address-list="AAGamingAWS" \
			chain=prerouting connection-type=!ftp protocol=tcp src-address-list="SHOPLAN" \
			layer7-protocol=!L7-Torrent action=mark-connection new-connection-mark=games-othergames \
			passthrough=yes comment="BATTLEROYALETCP" place-before=[find where connection-mark~"games-othergames" \
			and new-routing-mark~"Gaming"];}

:local gameothers [/ip firewall mangle find where dst-port~"1000-5937,5939-65535" and dst-address-list~"AAGamingOTHERS" and protocol~"udp"];
:local gameothersold [/ip firewall mangle find where dst-port~"1000-5499,5520-5937,5939-65535" and dst-address-list~"AAGamingOTHERS" and protocol~"udp"];
:local gameotherports "1000-5499,5501-5511,5520-5937,5939-65535"

:if ([:len $gameothers] > 0) do={
/ip firewall mangle set [$gameothers] dst-port=$gameotherports;}

:if ([:len $gameothersold] > 0) do={
/ip firewall mangle set [$gameothersold] dst-port=$gameotherports;}


do { /ip firewall address-list add address=128.1.68.0/24 list=AAGamingOTHERS } on-error={}
do { /ip firewall address-list add address=129.227.133.0/24 list=AAGamingCFPH } on-error={}
do { /ip firewall address-list add address=129.227.134.0/24 list=AAGamingCFPH } on-error={}
do { /ip firewall address-list add address=129.227.135.0/24 list=AAGamingCFPH } on-error={}


:delay 2;

/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
:delay 2;
/system logging enable 0
   ## script messages ##
:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:local scriptversion "01.04.2020 Revision 1 (Cupcake)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Changelog: Added Games (OtherGames) (Revision 1)"
:log warning "Changelog: Updates"
:log info "Crossfire PH New Servers"
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