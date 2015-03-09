#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: mongodb_start.sh DBNAME \neg:  mongodb_start.sh server0 \n!!!Important: DBNAME must be placed in /WORK/MONGODB!!!\n\n"
exit
fi
rundir="/WORK/MONGODB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /WORK/MONGODB/$1 \n"
exit
fi


echo "Start mysql at $rundir"
/usr/local/mongodb/bin/mongod -f "$rundir"/mongodb.conf &
