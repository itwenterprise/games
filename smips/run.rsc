:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "5.28.2017 Revision 18c (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
:log warning "Updating League of Legends......";
:if ([:len [/ip firewall mangle find where dst-port~"2099,5223,12000" and new-connection-mark~"Games_LOLPH"]] > 0) do={
local LOLPORT "5223,12000";
/ip firewall mangle set [find  protocol="tcp" dst-port="2099,5223,12000" new-connection-mark="Games_LOLPH"] dst-port=$LOLPORT;
:log warning "League of Legends v7.10 Update Complete...."
} else={
:delay 2;
:log warning "League of Legends v7.10 Game-Port already updated!";}
:delay 2;
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 18c)"
:log warning "Changelog: League of Legends (LoL) (Revision 18c) Removed lobby Game-Port in priority list, causing LAG in-game"
:log info "WarThunder"
:log info "Heroes and Generals"
:log info "MineCraft MT1 and MT2 (Private)"
:log info "Tantra Sanity (Private)"
:log info "Ran Online PH . Net (Private)"
:log info "Mobile Legends (Android - iOS)"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
}