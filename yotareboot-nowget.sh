#!/bin/sh
while true; do
        content=$(echo -e "GET / HTTP/1.1\nHost: captive.apple.com\n" | nc captive.apple.com 80 2>&1)
        if [ `echo $content | grep -cE "(phone-tethering|tablet-tethering)"` -gt 0 ]
        then
                reboot
        fi
        sleep 10
done &