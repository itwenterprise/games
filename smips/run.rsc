:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "05.28.2018 Revision 14c (Oreo)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 14c)"
:log warning "Changelog: Updates"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite (Updated)"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/ (Updated)"
:log info "Rules of Survival - ASIA Server: https://www.rulesofsurvivalgame.com/ (Updated) (Correction of implemented GamesList AutoUpdate script)"
:log info "Elite Crystal Flyff:"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
:delay 2;
/ip firewall mangle remove [find comment="BATTLEROYALE"];
/ip firewall mangle remove [find comment="BATTLEROYALETCP"];

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

:local gameothers [/ip firewall mangle find where dst-port~"1000-5937,5939-65535" and dst-address-list~"AAGamingOTHERS" and protocol~"udp"];
:local gameothersold [/ip firewall mangle find where dst-port~"1000-65535" and dst-address-list~"AAGamingOTHERS" and protocol~"udp"];
:local gameotherports "1000-5499,5520-5937,5939-65535"

:if ([:len $gameothers] > 0) do={
/ip firewall mangle set [$gameothers] dst-port=$gameotherports;}

:if ([:len $gameothersold] > 0) do={
/ip firewall mangle set [$gameothersold] dst-port=$gameotherports;}

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
##/ip route
##add distance=1 dst-address=100.100.8.0/22 gateway=VITRO2;
##} else={
##/system logging enable 0
##}
}