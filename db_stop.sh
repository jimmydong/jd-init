#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: db_stop.sh DBNAME [OTHER...]\neg:  db_stop.sh server1 \n"
echo -e "eg:  db_stop.sh server1 -umysql -p \n!!!Important: DBNAME must be placed in /YOKA/DB!!!\n\n"
exit
fi
rundir="/YOKA/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/DB/$1 \n"
exit
fi

echo -e "stop mysql at $rundir"
if [ $# -lt 2 ]; then
/usr/local/mysql/bin/mysqladmin shutdown --socket="$rundir"/mysql.sock -u jimmy -p`cat /home/mysql/mysql.security.ini`
else
/usr/local/mysql/bin/mysqladmin shutdown --socket="$rundir"/mysql.sock $2 $3 $4
fi

