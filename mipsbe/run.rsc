:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "4.21.2017 Revision 15c (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Updating League of Legends......";
:if ([:len [/ip firewall mangle find where dst-port~"5100-5220" and new-connection-mark~"Games_LOLPH"]] > 0) do={
local LOLPORT 5100-5400;
/ip firewall mangle set [find  protocol="udp" dst-port="5100-5220" new-connection-mark="Games_LOLPH"] dst-port=$LOLPORT;
:log warning "League of Legends Update Complete....";
} else={
:delay 2;
:log warning "League of Legends Game-Port already updated!"
/system logging enable 0
}