#!/bin/bash
wget https://raw.githubusercontent.com/TTLMaster/yota-ban-list/master/list.txt -O /tmp/etc/blacklist.txt
while read -r i; do
	[[ "$i" =~ ^#.*$ ]] && continue
	iptables -I FORWARD --destination $i -j REJECT;
done</tmp/etc/blacklist.txt
/etc/init.d/dnsmasq restart
