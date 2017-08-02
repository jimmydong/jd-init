#!/bin/sh

#pkill mongod

if [ "$1" == "" ]; then
rundir="/WORK/MONGO/"
else
rundir="/WORK/MONGO/$1"
fi
echo -e "Asert mongodb.conf is $rundir/mongodb.conf\n\n"
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory $rundir \n"
exit
fi
echo "Stop MongoDB at $rundir ..."
/usr/local/mongodb/bin/mongod --shutdown -f "$rundir"/mongodb.conf &
echo "/usr/local/mongodb/bin/mongod --shutdown -f $rundir/mongodb.conf &"


#echo -e "It will stop mongodb at $rundir , Please input password:"
#read -s password
#mongo admin /WORK/SBIN/mongodb_shutdown.js

