#!/bin/sh
# Fetches the current ip addresses for the configured domains and adds those addresses to the iptables.
# Author: Holger Cremer

MEDIATHEK="mvideos.daserste.de www.daserste.de www.ard.de www.ardmediathek.de media.tagesschau.de www.zdf.de"
DOMAINS="youtube.de www.spotify.de www.spotify.com $MEDIATHEK"

for d in $DOMAINS; do 
	echo "Looking for ip for $d"
  IP=$(nslookup $d | tail -n+5 | grep -E 'Address [0-9]+: [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $3}' | head -1)
  IP_FOUND=$(echo $IP | grep -c -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')
  if [ ! $IP_FOUND == "1" ]; then
  	echo "No IP for $d found!"
  else
  	echo "-> $IP"
  fi
done



