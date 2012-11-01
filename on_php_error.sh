#!/bin/sh
cd /usr/local/php/lib/;
now_setting=`cat php.ini | grep "^display_errors[ ]*=" | awk '{print $3}'`
echo $now_setting
if [ "$now_setting" = "On" ]
then
echo "Setting is On, Exit."
exit
fi
cp php.ini php.ini__bak
cp php.ini php.ini.tmp
echo "" > php.ini
sed 's/display_errors[ ]*=[ ]*Off/display_errors = On/' php.ini.tmp >> php.ini
echo "Set error display to On"
cat php.ini | grep "^display_errors[ ]*="
rm php.ini.tmp
echo "Restart Apache ..."
/usr/local/apache/bin/apachectl restart
echo "Remember to Run off_php_error.sh after your debug!"
