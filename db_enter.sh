#!/bin/sh
#By jimmydong 20071108
if [ "$1" == "" ]; then
echo -e "Usage: db_enter.sh DBNAME \neg:  db_enter.sh server0 \n!!!Important: DBNAME must be placed in /SOHU/DB!!!\n\n"
exit
fi
rundir="/YOKA/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/DB/$1 \n"
exit
fi

echo "Enter mysql at $rundir"
if [ $# -lt 2 ]; then
/usr/local/mysql/bin/mysql  --socket="$rundir"/mysql.sock -u jimmy -p`cat /home/mysql/mysql.security.ini`
else
/usr/local/mysql/bin/mysql  --socket="$rundir"/mysql.sock $2 $3 $4
fi
