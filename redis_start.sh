#!/bin/sh
EXEC=/usr/local/bin/redis-server

if [ "$1" == "" ]; then
echo -e "Usage: redis_start.sh DBNAME \neg:  redis_start.sh redis0 \n!!!Important: DBNAME must be placed in /YOKA/DB!!!\n\n"
exit
fi
rundir="/YOKA/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/DB/$1 \n"
exit
fi

cd $rundir
echo "Starting Redis server at $rundir..."
$EXEC ./redis.conf 

/bin/ps aux  |  grep redis-server
