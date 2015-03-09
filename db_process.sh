#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: db_start.sh DBNAME \neg:  db_start.sh server1 \n!!!Important: DBNAME must be placed in /WORK/DB!!!\n\n"
exit
fi
rundir="/WORK/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /WORK/DB/$1 \n"
exit
fi


echo "Show full processlist at $rundir"
if [ $# -lt 2 ]; then
/usr/local/mysql/bin/mysql --socket="$rundir"/mysql.sock -u yoka2312 -p`cat /home/mysql/mysql.security.ini` -e "show full processlist\G" > /tmp/processlist.status
else
/usr/local/mysql/bin/mysql--socket="$rundir"/mysql.sock $2 $3 $4 -e "show full processlist\G" > /tmp/processlist.status
fi
grep -E '(Time)|(State)|(Info)' /tmp/processlist.status
