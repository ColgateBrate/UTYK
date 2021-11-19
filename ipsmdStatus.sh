#!/bin/sh
while true
do
rcnovell-ipsmd status | grep -q "active (running)"; dsv=$(echo $? | bc -l)

if [ $dsv -eq 0 ]
then
	if [ ! -f /etc/smbvaluedat/ipsmdonline ]
	then
		touch /etc/smbvaluedat/ipsmdonline
	fi
fi

if [ $dsv -eq 1 ]
then
	if [ -f /etc/smbvaluedat/ipsmdonline ]
	then
		rm /etc/smbvaluedat/ipsmdonline
	fi
fi
sleep 5
done
