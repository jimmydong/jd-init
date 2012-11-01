#!/bin/sh
# Show squid status
# by jimmydong 20070927
runcmd="/YOKA/SBIN/squidclient"

if [ "$1" == "" ]
then
    for ip in `/sbin/ifconfig | grep 'inet ' | sed -e 's/^.*inet addr:\([^ ]*\) .*$/\1/'`
    do
        echo "Auto Mode, Try the IP $ip ..."
        $runcmd -p 80 -h $ip mgr:info
    done
    echo "----------------------"
    echo "You can special the ip and port , Usage:"
    echo "  $0 ip [port]  (port must be more than 79, default is 80)"
    exit 0
fi
if [ "$2" -lt 80 ] || [ "$2" == "" ] ; then
    echo "Port not define or less than 80, use 80 as default"
    port="80";
else
    port="$2";
fi
echo "$runcmd -p $port -h $1 mgr:info"
$runcmd -p $port -h $1 mgr:info
