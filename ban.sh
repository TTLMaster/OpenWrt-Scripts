#!/bin/sh
#wget -O - https://cdn.jsdelivr.net/gh/TTLMaster/yota-ban-list/list.txt | while read -r i; do
wget -O - https://raw.githubusercontent.com/TTLMaster/yota-ban-list/master/list.txt | while read -r i; do
	[ "${i:0:1}" = "#" ] && continue
	iptables -I FORWARD --destination $i -j REJECT;
done
/etc/init.d/dnsmasq restart
