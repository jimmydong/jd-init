#/bin/sh
log=/WORK/important_log
date=`date`
times=`/bin/ps -aux | grep mongod | awk '{print $11}' | grep -v "grep"`
echo "Check Result: $times"
if [ -z $times ]
then
	echo "dog_mongodb: mongodb not run at $date" >> $log
	/WORK/SBIN/mongodb_start.sh	
else
	echo "...ok"
fi
