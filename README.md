tunnelBypass
============

DNS und iptables Update-Skript für spacegate

## Warum
Wir wollen bestimmte Domains nicht über unser VPN tunneln. Wir wollen dazu aber keine extra Hardware bereitstellen, sondern alles mit dem bisherigen Router machen.

## dnsUpdater.sh
Dies Shell-Skript ermittelt für eine Liste von Domains, (genau) eine IP Adresse und diese mittels iptables der Tunnelausnahme hinzu. Außerdem wird der lokale DNS-Server angepasst, so dass nur diese IP-Adresse für die Domains zurückgegeben werden. 

TODO! Soweit ist das Skript noch nicht!
