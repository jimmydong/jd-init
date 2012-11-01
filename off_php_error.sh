#!/bin/sh
cd /usr/local/php/lib/;
now_setting=`cat php.ini | grep "^display_errors[ ]*=" | awk '{print $3}'`
if [ "$now_setting" = "Off" ]
then
echo "Setting is Off, Exit."
exit
fi
cp php.ini php.ini__bak
cp php.ini php.ini.tmp
echo "" > php.ini
sed 's/display_errors[ ]*=[ ]*On/display_errors = Off/' php.ini.tmp >> php.ini
echo "Set error display to Off"
cat php.ini | grep "^display_errors[ ]*="
rm php.ini.tmp
echo "Restart Apache ..."
/usr/local/apache/bin/apachectl restart
echo "Done!"
