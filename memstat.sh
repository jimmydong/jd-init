#!/bin/sh 
free=`/usr/bin/free -m | grep Mem |awk '{print $4}'`
all=`/usr/bin/free -m | grep Mem |awk '{print $2}'` 

/usr/bin/free -m | grep Swap | awk '{print $3}'
echo "F$free(M)A$all(M)"

