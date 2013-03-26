#!/bin/sh
# Fetches the current ip addresses for the configured domains and adds those addresses to the iptables.
# Author: Holger Cremer

IFS='
'

for d in $(cat domains.txt); do
	# skip comments
	if echo "${d}" | grep -qE "^#" ; then
		continue
	fi

	echo "Looking for ip for $d"
	IP=$(nslookup $d | tail -n+5 | grep -E 'Address [0-9]+: [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $3}' | head -1)
	IP_FOUND=$(echo $IP | grep -c -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')

	if [ $IP_FOUND != "1" ]; then
		echo "No IP for $d found!"
	else
		echo "-> $IP"
	fi
done
