:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "11.12.2017 Revision 27c (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 27c)"
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
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
/interface l2tp-client set [find name=VITRO] use-ipsec=no
/interface disable [/interface find name=VITRO];
:delay 2;
/interface enable [/interface find name=VITRO];
/system logging disable 0
/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
/system logging enable 0

:if ([/system routerboard get serial-number] = "\37\42\43\41\30\37\42\34\45\46\43\45") do={
/ip route
add distance=1 dst-address=100.100.8.0/22 gateway=VITRO2;
} else={
/system logging enable 0
}
}
