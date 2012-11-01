#!/bin/sh
#check lighttpd by jimmy 20070926
dir="/SOHU/LOG/lighttpdlogs/"
pidname="lighttpd.pid"
runcmd="/etc/init.d/lighttpd restart"

cd $dir
if test -r $pidname; then
  # there is a pid file -- is it current?
  pid=`cat $pidname`
  if `kill -CHLD $pid >/dev/null 2>&1`; then
    echo "it's still going"
    # back out quietly
    exit 0
  fi
  echo ""
  echo "Stale $pidname file (erasing it)"
  rm -f $pidname
fi
echo ""
echo "Couldn't find the ircd running.  Reloading it..."
echo ""
date >> /SOHU/important_log
echo "Lighttpd stopped, Reloading it." >> /SOHU/important_log
$runcmd

