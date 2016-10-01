#!/bin/sh
for i in 1 2 3 4 5
do
	content=$(wget captive.apple.com -q -O -)
	if [ `echo $content | grep -c "tethering.svg" ` -gt 0 ]
	then
		usbreset "HUAWEI Mobile"
	fi
	sleep 10
done

