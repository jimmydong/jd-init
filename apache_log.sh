#!/bin/sh
if [ "$1" == "" ]; then
log='m'
else
log="$1"
fi

if [ "$2" == "" ]; then
date=".`date +%Y%m%d`"
else
date=""
fi 

log_file="/WORK/LOG/apache_logs/access_log.$log$date"
goaccess -f $log_file --no-color --no-progress
