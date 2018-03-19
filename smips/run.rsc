:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "03.19.2018 Revision 7a (Oreo)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 7a)"
:log warning "Changelog: Updates"
:log info "Fortnite - SEA Server: https://www.epicgames.com/fortnite (Re-Added)"
:log info "PUBG - SEA Server: https://playbattlegrounds.com/ (Re-Added)"
:log info "Rules of Survival: https://www.rulesofsurvivalgame.com/ (Re-Added)"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
:delay 2;
/ip firewall address-list remove [find address=52.16.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.224.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.168.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.248.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.120.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=18.216.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.72.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.64.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=34.200.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.72.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.64.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.192.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.0.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=52.232.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=34.192.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=34.224.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.112.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.232.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.248.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.224.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.176.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.168.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=13.120.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.248.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.176.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.224.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.168.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=54.120.0.0/13 list=AAGamingOTHERS];
/ip firewall address-list remove [find address=112.204.0.0/15 list=AAGamingOTHERS];
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
##:if ([/system routerboard get serial-number] = "\37\42\43\41\30\37\42\34\45\46\43\45") do={
##/ip route
##add distance=1 dst-address=100.100.8.0/22 gateway=VITRO2;
##} else={
##/system logging enable 0
##}
}