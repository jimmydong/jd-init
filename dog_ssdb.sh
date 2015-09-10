#!/bin/sh
runcmd="/usr/local/ssdb/ssdb-server -d /usr/local/ssdb/ssdb.conf -s restart"
pidfile=/usr/local/ssdb/var/ssdb.pid

#check if apache is alive
if test -r $pidfile; then
  # there is a pid file -- is it current?
  pid=`cat $pidfile`
  if [ "$pid" == "" ]; then
    echo "Could not find server, start it..."
    echo "Stale $pidfile file (erasing it)"
    rm -f $pidfile
    echo "Start server ..."
    $runcmd
  else
    if `kill -0 $pid >/dev/null 2>&1`; then
      echo "it's still going"
    else
      echo "Could not find server, start it..."
      echo "Stale $pidfile file (erasing it)"
      rm -f $pidfile
      echo "Start server ..."
      $runcmd
    fi
  fi
else
  echo "Could not find pid file. Maybe server has gone. Start it ...";
  $runcmd
fi
