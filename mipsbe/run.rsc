:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "6.23.2017 Revision 20c (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:if ([:len [/ip firewall mangle find where dst-port~"5223,12000" and new-connection-mark~"Games_LOLPH"]] > 0) do={
local LOLPORT "2099,5223,12000";
/ip firewall mangle set [find  protocol="tcp" dst-port="5223,12000" new-connection-mark="Games_LOLPH"] dst-port=$LOLPORT;
} else={
:delay 2;
:log warning "League of Legends Game-Port already updated!";}
:delay 2;
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 20c)"
:log info "Ragnarok Philippines Loki Server: https://ragnarokonline.com.ph"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
}