#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: db_start.sh DBNAME \neg:  db_start.sh server1 \n!!!Important: DBNAME must be placed in /YOKA/DB!!!\n\n"
exit
fi
rundir="/YOKA/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/DB/$1 \n"
exit
fi


echo "Start mysql at $rundir"
/usr/local/mysql/bin/mysqld_safe --defaults-file="$rundir"/my.cnf  --pid-file="$rundir"/mysql.pid --datadir="$rundir"/var --socket="$rundir"/mysql.sock --log-error="$rundir"/err.log --slow-query-log-file="$rundir"/slow_query.log --log-bin="$rundir"/var/mysql-bin &
