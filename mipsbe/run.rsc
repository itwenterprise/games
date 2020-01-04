:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:local scriptversion "01.04.2020 Revision 1 (Cupcake)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Changelog: Added Games (OtherGames) (Revision 1)"
:log warning "Changelog: Updates"
:log info "Crossfire PH New Servers"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
:delay 2;
/ip firewall mangle remove [find comment="BATTLEROYALE"];
/ip firewall mangle remove [find comment="BATTLEROYALETCP"];

:if ([:len [/ip firewall mangle find where comment="BATTLEROYALE"]] > 0) do={
local BATTLEROYALE "24000-26000,7000-8000,9000-9080,9151,4010-4040,5502";
/ip firewall mangle set [find  comment="BATTLEROYALE"] dst-port=$BATTLEROYALE;
:log warning "Battle Royale UDP Games updated!";
} else={
/ip firewall mangle 
 add dst-port="24000-26000,7000-8000,9000-9080,9151,4010-4040" dst-address-list="AAGamingAWS" \
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
##script for VITRO##
:local itw "VITRO"
:if ([:len [/interface find name=$itw]] > 0) do={
/system logging disable 0
:foreach isp in=[/interface find where type="l2tp-out" and disabled=no or type="pptp-out" and disabled=no] do={  	
:local serial	[/system routerboard get serial-number];
/interface sstp-client
 add connect-to=itwmikrotik.dyndns.pro:44300 disabled=no name=VITROISP \
			password=shop user=$serial http-proxy=0.0.0.0:44300 verify-server-certificate=no \
			verify-server-address-from-certificate=no;
/ip route
add distance=1 dst-address=100.100.8.0/22 gateway=VITROISP;
:delay 2;
/ip route remove [/ip route find dst-address=100.100.8.0/22 gateway=VITRO]
/interface l2tp-client remove [/interface find name="VITRO"]
/system logging set 0 topics=info,!pptp,!ppp,!l2tp,!account,!ipsec,!sstp
/system logging set 1 topics=error,!account,!ppp,!pptp,!ipsec,!sstp
/system logging enable 0
} 
} else={
:log info "Config Updated"
}
/system logging disable 0
/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
:delay 1;
:execute script="/system routerboard upgrade"
/system logging enable 0
:delay 1;
}
