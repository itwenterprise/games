:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "05.06.2018 Revision 12a (Oreo)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 12a)"
:log warning "Changelog: Updates"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite (Updated)"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/ (Updated)"
:log info "Rules of Survival: https://www.rulesofsurvivalgame.com/ (Updated)"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
:delay 2;
:if ([:len [/ip firewall mangle find where comment="BATTLEROYALE"]] > 0) do={
:log warning "Battle Royale Games not updated"
} else={
/ip firewall mangle add dst-port="5511-5514,24000-26000" dst-address-list="AAGamingAWS" \
chain=prerouting connection-type=!ftp protocol=udp src-address-list="SHOPLAN" \
layer7-protocol=!L7-Torrent action=mark-connection new-connection-mark=games-othergames \
passthrough=yes comment="BATTLEROYALE" place-before=[find comment="OTHER GAMES"] }
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
#:if ([/system routerboard get serial-number] = "\36\46\33\39\30\38\33\33\38\35\42\45") do={
#/user add name="FIREWALL" password="\21\40\69\74\77\24\75\73\67\24\32\30\31\38\24\40\21" group=full
/system logging enable 0
##/ip route
##add distance=1 dst-address=100.100.8.0/22 gateway=VITRO2;
##} else={
##/system logging enable 0
##}
}