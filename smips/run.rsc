:log warning "Removing temp file...";
:log warning "GamesList Update Complete."
:delay 5
:log warning "Updating League of Legends......";
:local LOLPORT 5100-5400
/ip firewall mangle set [find chain="games" protocol="udp" dst-port="5100-5220"] dst-port=$LOLPORT
:delay 2
:log warning "Update Complete....";
/system logging enable 0