#!/bin/sh
#wget -O - http://cdn.rawgit.com/TTLMaster/yota-ban-list/master/list.txt | while read -r i; do
wget -O - https://raw.githubusercontent.com/TTLMaster/yota-ban-list/master/list.txt | while read -r i; do
	[ "`echo $i | sed -n '/^#.*$/p'`" ] && continue
	iptables -I FORWARD --destination $i -j REJECT;
done
/etc/init.d/dnsmasq restart
