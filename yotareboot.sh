#!/bin/sh
for i in 1 2 3 4 5
do
	if wget captive.apple.com -q -O - | grep -q 'tethering.svg'
	then
		usbreset "HUAWEI Mobile"
	fi
	sleep 10
done

