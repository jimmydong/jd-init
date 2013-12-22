#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: mongodb_stop.sh DBNAME [OTHER...]\neg:  mongodb_stop.sh server1 \n"
echo -e "!!!Important: DBNAME must be placed in /YOKA/MONGODB!!!\n\n"
exit
fi
rundir="/YOKA/MONGODB/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /YOKA/MONGODB/$1 \n"
exit
fi

echo -e "stop mongodb at $rundir"
if [ $# -lt 2 ]; then

else
fi

