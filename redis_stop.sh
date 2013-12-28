#!/bin/sh
CLIEXEC=/usr/local/bin/redis-cli

if [ "$1" == "" ]; then
echo -e "Usage: redis_stop.sh DBNAME \neg:  redis_stop.sh redis0 \n!!!Important: DBNAME must be placed in /YOKA/DB!!!\n\n"
exit
fi
rundir="/YOKA/DB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/DB/$1 \n"
exit
fi

cd $rundir
PIDFILE=./redis.pid
SOCKFILE=./redis.sock
if [ ! -f $PIDFILE ]
then
    echo "$PIDFILE does not exist, process is not running"
else
    PID=$(cat $PIDFILE)
    echo "Stopping ..."
    $CLIEXEC -s $SOCKFILE shutdown
    while [ -x /proc/${PID} ]
    do
        echo "Waiting for Redis to shutdown ..."
        sleep 1
    done
    echo "Redis stopped"
fi
