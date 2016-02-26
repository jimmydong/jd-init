#!/bin/sh
if [ "$1" == "" ]; then
log='m'
else
log="$1"
fi

if [ "$2" == ""]; then
date=".`date +%Y%m%d`"
else
date=""
fi 

goaccess -f /WORK/LOG/apache_logs/access_log.$log$date --no-color --no-progress
