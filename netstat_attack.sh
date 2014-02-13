#!/bin/sh
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -rn
#netstat -nat |awk '{print $6}'|sort|uniq -c|sort -rn 
#netstat -n | awk '/^tcp/ {++S[$NF]};END {for(a in S) print a, S[a]}' 
#netstat -n | awk '/^tcp/ {++state[$NF]}; END {for(key in state) print key,"\t",state[key]}' 
#netstat -n | awk '/^tcp/ {++arr[$NF]};END {for(k in arr) print k,"\t",arr[k]}' 
#netstat -n |awk '/^tcp/ {print $NF}'|sort|uniq -c|sort -rn 
#netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c 
#netstat -anlp|grep 80|grep tcp|awk '{print $5}'|awk -F: '{print $1}'|sort|uniq -c|sort -nr|head -n20 
#netstat -ant |awk '/:80/{split($5,ip,":");++A[ip[1]]}END{for(i in A) print A,i}' |sort -rn|head -n20 
#tcpdump -i eth0 -tnn dst port 80 -c 1000 | awk -F"." '{print $1″."$2″."$3″."$4}' | sort | uniq -c | sort -nr |head -20 
#netstat -n|grep TIME_WAIT|awk '{print $5}'|sort|uniq -c|sort -rn|head -n20 
#netstat -an | grep SYN | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -nr | more 
