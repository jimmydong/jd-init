#!/bin/sh
/WORK/SBIN/squid_status.sh $1 $2 | grep 'requests received'
echo sleep 1sec ...
sleep 1
/WORK/SBIN/squid_status.sh $1 $2 | grep 'requests received'

/WORK/SBIN/squid_status.sh $1 $2 | grep Ratios
/WORK/SBIN/squid_status.sh $1 $2 | grep KB
ps -aux | grep squid
