#!/bin/sh
echo -===== system =====-
uname --all
cat /etc/redhat-release
echo 
echo -===== nginx =====-
/usr/local/nginx/sbin/nginx -V
echo
echo -===== apache =====-
/usr/local/apache/bin/httpd -V
cat /usr/local/apache/build/config.nice
echo
echo -===== mysql =====-
cat /usr/local/mysql/bin/mysqlbug | grep CONFIGURE_LINE
echo
echo -===== php =====-
/usr/local/php/bin/php -v
/usr/local/php/bin/php -i | grep configure
