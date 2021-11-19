#!/bin/sh

echo "Starting istallation..."

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

service smb restart
