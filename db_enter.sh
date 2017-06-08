#!/bin/sh
# pip2.7 install mycli

#By jimmydong 20071108
if [ "$1" == "" ]; then
echo -e "Usage: db_enter.sh DBNAME \neg:  db_enter.sh server0 \n!!!Important: DBNAME must be placed in /WORK/DB!!!\n\n"
exit
fi
rundir="/WORK/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /WORK/DB/$1 \n"
exit
fi

echo "Enter mysql at $rundir"
if [ $# -lt 2 ]; then
mycli  --socket="$rundir"/mysql.sock -u root -p`cat $rundir/mysql.security.ini`
#/usr/local/mysql/bin/mysql  --socket="$rundir"/mysql.sock -u root -p`cat $rundir/mysql.security.ini`
#/usr/local/mysql/bin/mysql  --socket="$rundir"/mysql.sock -u root
else
/usr/local/mysql/bin/mysql  --socket="$rundir"/mysql.sock $2 $3 $4
fi
