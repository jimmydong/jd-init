#/bin/sh
nowdate=`/bin/date '+%Y%m%d'`
#echo $nowdate
cp /usr/local/apache/conf/httpd_VirtualHost.conf /usr/local/apache/conf/httpd_VirtualHost.conf__neo$nowdate
echo '<VirtualHost *> ' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    DocumentRoot /SOHU/community/club/html' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    DirectoryIndex inc_static/luxuryindex.html' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    ServerName club.luxury.sohu.com' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    #ServerAlias club.luxury.sohu.com' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    #ErrorLog /usr/local/apache/logs/error_log.club' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    #CustomLog /usr/local/apache/logs/access_log.cul combined' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    #CustomLog /usr/local/apache/logs/access_log.club combined' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '    #CustomLog "|usr/local/sbin/cronolog /cache/apachelogs/lz_access%d.log" combined env=!gif-image' >> /usr/local/apache/conf/httpd_VirtualHost.conf
echo '</VirtualHost> ' >> /usr/local/apache/conf/httpd_VirtualHost.conf
/usr/local/apache/bin/apachectl restart
