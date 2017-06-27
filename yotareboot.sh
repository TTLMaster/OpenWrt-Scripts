#!/bin/sh
for i in 1 2 3 4 5
do
	content=$(wget -O /dev/null http://captive.apple.com 2>&1)
	if [ `echo $content | grep -c "phone-tethering"` -gt 0 ]
	then
		usbreset "HUAWEI Mobile"
	fi
	sleep 10
done