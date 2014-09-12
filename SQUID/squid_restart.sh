#!/bin/sh
/usr/local/squid/sbin/squid -k shutdown -f /CM/SQUID/www.citymake.com_squid.conf;
sleep 2;
type=$1;
if [ "$type" == "clear_all" ]
then
echo "clearing disk cache......";
cd /opt/squid_cache/;
rm -fr *;
/usr/local/squid/sbin/squid -z -f /CM/SQUID/www.citymake.com_squid.conf;
fi
/CM/squid_start.sh;
echo "done!";
