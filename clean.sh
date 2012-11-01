#!/bin/sh
important_logs="/YOKA/important_log"
apache_error_logs="/YOKA/LOGS/apachelog/logs/error_log"
php_error_logs="/YOKA/LOGS/phplog/php_error.log"

echo "Clean important_logs: ... Done!";
echo '' > $important_logs

echo "Clean apache err logs: ..."
if [ -e $apache_error_logs ]
then 
echo "" > $apache_error_logs
echo "Done!"
else echo "Can't find apache logs: $apache_error_logs"
fi

echo "Clean php err logs: ..."
if [ -e $php_error_logs ]
then
echo "" > $php_error_logs
echo "Done!"
else echo "Can't find php logs: $php_error_logs"
fi

