o "Starting istallation..."

DIR1="/etc/smbvaluedat"
DIR2="/etc/valuedat"

if [ ! -d "$DIR1" ] 
then
echo "installing /etc/smbvaluedat"
mkdir /etc/smbvaluedat
echo "changing mode to 0777"
chmod 0777 /etc/smbvaluedat

else
echo "Error installing smbvaluedat"
fi

if [ ! -d "$DIR2" ] 
then
echo "installing /etc/valuedat"
mkdir /etc/valuedat
echo "installing /etc/valuedat/script"
mkdir /etc/valuedat/script

else
echo "Error installing valuedat"
fi

if grep -q "[SMBValueShare]" /etc/samba/smb.conf
then
echo "SMBValueShare exists already"

else 
echo "writing samba share for /etc/smbvaluedat"
echo "[SMBValueShare]" >> /etc/samba/smb.conf
echo "	comment = Share as API" >> /etc/samba/smb.conf
echo "	path = /etc/smbvaluedat" >> /etc/samba/smb.conf
echo "	read only = yes" >> /etc/samba/smb.conf
echo "	guest ok = yes" >> /etc/samba/smb.conf
service smb restart
fi

FILE1 = "/etc/valuedat/script//etc/valuedat/script/serviceStatus.sh"

if [ ! -f "$FILE1" ]
then
echo "Install script for Status Tests"

echo "#!/bin/sh" >> /etc/valuedat/script/serviceStatus.sh
echo "while true" >> /etc/valuedat/script/serviceStatus.sh
echo "do" >> /etc/valuedat/script/serviceStatus.sh
echo "rcnovell-ipsmd status | grep -q \"active (running)\"; dsvipsmd=\$(echo \\$? | bc -l)" >> /etc/valuedat/script/serviceStatus.sh
echo "rcnovell-dhcpd status | grep -q \"active (running)\"; dsvdhcpd=\$(echo \$? | bc -l)" >> /etc/valuedat/script/serviceStatus.sh
echo "rcnovell-named status | grep -q \"active (running)\"; dsvnamed=\$(echo \$? | bc -l)" >> /etc/valuedat/script/serviceStatus.sh
echo "rcnovell-tomcat status | grep -q \"active (running)\"; dsvtomcat=\$(echo \$? | bc -l)" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvipsmd -eq 0 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ ! -f /etc/smbvaluedat/ipsmdonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		touch /etc/smbvaluedat/ipsmdonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvipsmd -eq 1 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ -f /etc/smbvaluedat/ipsmdonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		rm /etc/smbvaluedat/ipsmdonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvdhcpd -eq 0 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ ! -f /etc/smbvaluedat/dhcpdonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		touch /etc/smbvaluedat/dhcpdonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvdhcpd -eq 1 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ -f /etc/smbvaluedat/dhcpdonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		rm /etc/smbvaluedat/dhcpdonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvnamed -eq 0 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ ! -f /etc/smbvaluedat/namedonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		touch /etc/smbvaluedat/namedonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvnamed -eq 1 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ -f /etc/smbvaluedat/namedonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		rm /etc/smbvaluedat/namedonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvtomcat -eq 0 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ ! -f /etc/smbvaluedat/tomcatonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		touch /etc/smbvaluedat/tomcatonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "if [ \$dsvtomcat -eq 1 ]" >> /etc/valuedat/script/serviceStatus.sh
echo "then" >> /etc/valuedat/script/serviceStatus.sh
echo "	if [ -f /etc/smbvaluedat/tomcatonline ]" >> /etc/valuedat/script/serviceStatus.sh
echo "	then" >> /etc/valuedat/script/serviceStatus.sh
echo "		rm /etc/smbvaluedat/tomcatonline" >> /etc/valuedat/script/serviceStatus.sh
echo "	fi" >> /etc/valuedat/script/serviceStatus.sh
echo "fi" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "sleep 5" >> /etc/valuedat/script/serviceStatus.sh
echo "done" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh
echo "" >> /etc/valuedat/script/serviceStatus.sh

else
echo "Error"

fi


echo service smb restart

