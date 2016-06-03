#!/bin/sh
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
echo "Start MongoDB at $rundir ..."
/usr/local/mongodb/bin/mongod -f "$rundir"/mongodb.conf &
echo "/usr/local/mongodb/bin/mongod -f $rundir/mongodb.conf &"
echo "Done!"
