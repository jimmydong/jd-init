#!/bin/sh 
idle=`sar  -u 1 2 | grep Average | awk '{print $7}'` 
echo 100 - $idle | bc -l
echo `cat /proc/cpuinfo | grep 'model name' | wc -l` "*" `cat /proc/cpuinfo | grep 'model name' | sed -e 's/^\(.*\):\(.*\)$/\2/' | tail -n 1`  
