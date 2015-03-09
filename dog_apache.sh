#!/bin/sh
# Check apache status
# by jimmy 20070926
# IMPORTANT: 
#   apache must be installed in '/usr/local/apache' and the pid is in '/usr/local/apache/logs/httpd.pid'
runcmd=/usr/local/apache/bin/apachectl
pidfile=/usr/local/apache/logs/httpd.pid
sleeptime=30
errflag=0

#check if apache is alive
if test -r $pidfile; then
  # there is a pid file -- is it current?
  pid=`cat $pidfile`
  if [ "$pid" == "" ]; then
    echo "Could not find apache, start it..."
    echo "Stale $pidfile file (erasing it)"
    rm -f $pidfile
    $runcmd start
  else
  if `kill -CHLD $pid >/dev/null 2>&1`; then
    echo "it's still going"
    # back out quietly
  else
    echo "Could not find apache, restart it..."
    echo "Stale $pidfile file (erasing it)"
    rm -f $pidfile
    $runcmd start
  fi
  fi
else
  echo "Could not find pid file. Maybe apache has gone. Start it.";
  $runcmd start
fi
#check if load too high or thread too much
LOAD=`cat /proc/loadavg | awk '{print \$1}' | awk -F. '{print \$1}'`
if [ $LOAD -ge 60 ] ; then
errflag=1
fi
HTTP=`/bin/ps -ef | grep httpd -c`
if [ $HTTP -ge 1000 ] ; then
errflag=1
fi

if [ "$errflag" = "1" ] ; then
    date >> /WORK/important_log
    echo "too many httpd or too high load: httpd-$HTTP , load-$LOAD" >> /WORK/important_log
    $runcmd stop
    until `kill -CHLD $pid >/dev/null 2>&1`  ; do
        sleep $sleeptime
        $runcmd start
        sleep 1
        pid=`cat /usr/local/apache/logs/httpd.pid`
    done
    /usr/local/php/bin/php -f /WORK/SBIN/iptables.php >> /WORK/important_log
fi

