#!/bin/sh
if [ "$1" == "" ]; then
echo "! Error: No ip \n";
echo "  Usage: /YOKA/SBIN/topip.sh 10.0.0.196 \n";
exit
fi
ssh $1 '/bin/netstat -ne > /tmp/n'
scp $1:/tmp/n /tmp/n
/usr/local/php/bin/php /YOKA/SBIN/topip_out.php

