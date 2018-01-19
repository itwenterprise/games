:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "12.05.2017 Revision 29a (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 29a)"
:log warning "Changelog: Updates"
:log info "MU Legend Global: http://mulegend.webzen.com/en"
:log info "DragonNestSea: https://sea.dragonnest.com/main"
:log info "Echo Of Soul Phoenix: http://echoofsoulphoenix.aeriagames.com"
:log info "RF Lockdown: https://www.lockdowngamers.net"
:log info "RF Rhisis: http://rhisis-rf.com/"
:log info "Ran Zurc: http://zurc-gaming.online/"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/"
:log info "Ragnarok Online PH: New Chaos Server Update: https://ragnarokonline.com.ph"
:log info "World Of Warcraft Vanilla: http://vanillagaming.org/"
:log info "RF Fallen: (Private Server)"
:log info "Ran Online: (Private Server) http://www.ep7gaming.com"
:log info "WoW Warmane: (Private Server) https://warmane.com"
:log info "SF 1 Playpark: (Update)"
:log info "Black Squad: (Steam Game)"
:log info "Knives Out: (Battleroyal Game)"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
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
/system logging enable 0



##:if ([/system routerboard get serial-number] = "\37\42\43\41\30\37\42\34\45\46\43\45") do={
##/ip route
##add distance=1 dst-address=100.100.8.0/22 gateway=VITRO2;
##} else={
##/system logging enable 0
##}
}