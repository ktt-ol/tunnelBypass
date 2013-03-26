#!/bin/sh
# Fetches the current ip addresses for the configured domains and adds those addresses to the iptables.
# Author: Holger Cremer

iptables_add() {
	IP=$1
	echo "TODO: add \"$IP\" to iptables"
}

dns_lookup() {
	DOMAIN=$1

	IP=$(nslookup $d | tail -n+5 | grep -E 'Address [0-9]+: [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $3}' | head -1)
	IP_FOUND=$(echo ${IP} | grep -c -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')

	if [ ${IP_FOUND} != "1" ] ; then
		echo ""
	else
		echo ${IP}
	fi
}

IFS='
'

for d in $(cat domains.txt); do
	# skip comments
	if echo "${d}" | grep -qE "^#" ; then
		continue
	fi

	IP=$(dns_lookup $d)

	if [ "${IP}" != "" ]; then
		iptables_add $IP
	else
		echo "IP for $d not found"
	fi
done
