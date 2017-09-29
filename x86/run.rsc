:log warning "Removing temp file...";
:log warning "GamesList AutoUpdate Complete."
:delay 5
:local scriptversion "9.9.2017 Revision 24a (HoneyBean)"
:log warning "GamesList AutoUpdate Version: $scriptversion"
/system logging enable 0
:log warning "Changelog: Added Games (OtherGames) (Revision 24a)"
:log warning "Changelog: Updates"
:log info "Ragnarok Philippines Thor/Loki New Servers: https://ragnarokonline.com.ph"
:log info "Conquer Online"
:log info "Dragon Nest Online"
:log warning "Message Us for Games to be ported. Please note that we do not prioritize adding private game servers. Availability of requested games every week. Facebook: https://www.facebook.com/itwcomputersolution"
/system logging enable 0
:delay 2;
/file remove [find type="script"]
/interface l2tp-client set [find name=VITRO] use-ipsec=no on-error={}
/interface disable [/interface find name=VITRO];
:delay 2;
/interface enable [/interface find name=VITRO];
/system routerboard settings
set reformat-hold-button=20
set protected-routerboot=enabled
}