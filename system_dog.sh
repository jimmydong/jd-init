#!/bin/sh
errflag=0

LOAD=`cat /proc/loadavg | awk '{print \$1}' | awk -F. '{print \$1}'`
if [ $LOAD -ge 60 ]
then
errflag=1
fi

HTTP=`/bin/ps -ef | grep httpd -c`
if [ $HTTP -ge 1000 ]
then
errflag=1
fi
if [ "$errflag" = "1" ]
then
date >> /SOHU/important_log
echo "too many httpd or too high load: httpd-$HTTP , load-$LOAD" >> /SOHU/important_log
/sbin/ifconfig | awk '/inet/{print $2}' | awk -F: '{print $2}' | xargs /usr/local/php/bin/php -f /SOHU/community/club/html/more/insertServerStatus.php  
/sbin/ifconfig | awk '/inet/{print $2}' | awk -F: '{print $2}' | xargs /usr/local/php/bin/php -f /SOHU/community/club/html/more/analyseServerStatus.php 
/usr/local/apache/bin/apachectl stop
sleep 15
/usr/local/apache/bin/apachectl restart
fi

