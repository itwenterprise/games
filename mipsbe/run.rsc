:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "8.26.2017 Revision 23a (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:if ([:len [/ip firewall mangle find where dst-port~"5223,12000" and new-connection-mark~"Games_LOLPH"]] > 0) do={
local LOLPORT "2099,5223,12000";
/ip firewall mangle set [find  protocol="tcp" dst-port="5223,12000" new-connection-mark="Games_LOLPH"] dst-port=$LOLPORT;
} else={
:delay 2;
:log warning "League of Legends Game-Port already updated!";}
:delay 2;
##script for VITRO##
:local itw "VITRO"

:if ([:len [/interface find name=$itw]] > 0) do={

/system logging set 0 topics=info,!pptp,!ppp,!l2tp,!account,!ipsec
/system logging set 1 topics=error,!account,!ppp,!pptp,!ipsec


:if ([:len [/ip firewall filter find where dst-port~"8291" and src-address~"100.100.8.0/22"]] > 0) do={

:if ([:len [/ip firewall filter find where dst-port~"22,23" and src-address~"100.100.8.0/22"]] > 0) do={

local vpnport "22,23";
/ip firewall filter set [find  protocol="tcp" dst-port="22,23" src-address~"100.100.8.0/22"] dst-port=$vpnport;

}
	
} else={

/ip firewall filter
add action=accept chain=input dst-port=22,23 protocol=tcp src-address=\
    100.100.8.0/22 place-before=4;
add action=accept chain=input dst-port=8291 protocol=tcp src-address=\
    100.100.8.0/22 place-before=4;
add action=accept chain=input dst-port=1723 protocol=tcp place-before=4;
add action=accept chain=input protocol=gre place-before=4;
}

:if ([:len [/ip firewall address-list find where list~"SHOPLAN" and address~"100.100.8.0/22"]] > 0) do={

:do {
/ip firewall address-list
add address=100.100.10.0/24 list=SHOPLAN; 
} on-error={};

} else={
/ip firewall address-list
add address=100.100.8.0/22 list=SHOPLAN;
add address=100.100.10.0/24 list=SHOPLAN;
}

:if ([:len [/ip route find where gateway~"VITRO" and dst-address~"100.100.8.0/22"]] > 0) do={

:if ([:len [/ip route rule find where dst-address~"100.100.8.0/22"]] > 0) do={

} else={

/ip route rule
add dst-address=100.100.8.0/22 action=lookup table=main place-before=0; }

} else={

/ip route
add distance=1 dst-address=100.100.8.0/22 gateway=VITRO;
/ip route rule
add dst-address=100.100.8.0/22 action=lookup table=main place-before=0;
}

##Else##

} else={

/system logging set 0 topics=info,!pptp,!ppp,!l2tp,!account,!ipsec
/system logging set 1 topics=error,!account,!ppp,!pptp,!ipsec

/interface pptp-client
add connect-to=itwmikrotik.dyndns.pro disabled=no name=VITRO \
    password=shop user=shop;
:delay 2
/ip firewall filter
add action=accept chain=input dst-port=8291 protocol=tcp src-address=\
    100.100.8.0/22 place-before=4;
:delay 1;
add action=accept chain=input dst-port=1723 protocol=tcp place-before=4;
add action=accept chain=input protocol=gre place-before=4;

/ip firewall address-list
add address=100.100.8.0/22 list=SHOPLAN;

/ip route
add distance=1 dst-address=100.100.8.0/22 gateway=VITRO;
/ip route rule
add dst-address=100.100.8.0/22 action=lookup table=main place-before=0;

/interface disable [/interface find name=$itw];
/interface enable [/interface find name=$itw];

}
##end of script##
:delay 2;
/ip firewall address-list remove [/ip firewall address-list find list="AAGamingOTHERS" address=116.93.119.0/24]
/ip firewall address-list remove [/ip firewall address-list find list="AAGamingOTHERS" address=116.93.120.0/24]
/ip firewall address-list remove [/ip firewall address-list find list="AAGamingOTHERS" address=116.93.97.0/24]
/ip firewall address-list remove [/ip firewall address-list find list="AAGamingOTHERS" address=139.99.113.51]
/ip firewall address-list remove [/ip firewall address-list find list="AAGamingOTHERS" address=139.99.113.24]
:delay 2;
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 23a)"
:log warning "Changelog: Updates"
:log info "Ragnarok Philippines Thor/Loki New Servers: https://ragnarokonline.com.ph"
:log info "Conquer Online"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
}