:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "5.24.2017 Revision 18a (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Updating League of Legends......";
:if ([:len [/ip firewall mangle find where dst-port~"5100-5220" and new-connection-mark~"Games_LOLPH"]] > 0) do={
local LOLPORT 5100-5400;
/ip firewall mangle set [find  protocol="udp" dst-port="5100-5220" new-connection-mark="Games_LOLPH"] dst-port=$LOLPORT;
:log warning "League of Legends Update Complete....";
} else={
:delay 2;
:log warning "League of Legends Game-Port already updated!"
:delay 2;
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 18a)"
:log info "WarThunder"
:log info "Heroes and Generals"
:log info "MineCraft MT1 and MT2 (Private)"
:log info "Tantra Sanity (Private)"
:log info "Ran Online PH . Net (Private)"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
}