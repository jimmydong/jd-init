#!/bin/sh
/YOKA/SBIN/squid_status.sh $1 $2 | grep 'requests received'
echo sleep 1sec ...
sleep 1
/YOKA/SBIN/squid_status.sh $1 $2 | grep 'requests received'

/YOKA/SBIN/squid_status.sh $1 $2 | grep Ratios
/YOKA/SBIN/squid_status.sh $1 $2 | grep KB
ps -aux | grep squid
