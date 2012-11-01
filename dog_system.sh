#!/bin/sh
######################################
# System Watch Dog
# for club.sohu only
# check system important service
# !!! suppose to be run every 5 minutes !!!
# by jimmy 20071023
debug=1
permonth=8640
perweek=2016
perday=288
perhour=12
if [ `date +"%u"` -lt 6 ]; then
  weekend=0
else
  weekend=1
fi
if [ `date +"%k"` -lt 22 -a `date +"%k"` -gt 8 ]; then
  rushhour=0
else
  rushhour=1
fi


###
### Check Basic Service
###
number=$RANDOM
let "number %= $perhour"
if [ $number == 0 ];then
  if [ -n "`/bin/ps -e | grep snmpd`" ]; then
    echo "snmp still going"
  else
    /etc/rc.d/init.d/snmpd start
    date >> /SOHU/important_log
    echo "snmpd stoped, reload snmpd." >> /SOHU/important_log
  fi
  if [ -n "`/bin/ps -e | grep sshd`" ]; then
    echo "sshd still going"
  else
    /usr/local/sbin/sshd
    date >> /SOHU/important_log
    echo "sshd stoped, reload sshd." >> /SOHU/important_log
  fi

fi

###
### Restart Basic Service
###
number=$RANDOM
let "number %= $perweek"
if [ $number == 0 ];then
/etc/rc.d/init.d/snmpd restart
fi

###
# Clean Mail
###
number=$RANDOM
let "number %= $perweek"
if [ $number == 0 ];then
echo "" > /var/spool/mail/root
fi

###
# Clean Error Log
###
number=$RANDOM
let "number %= $perweek"
if [ $number == 0 ];then
  log_path="/SOHU/important_log"
  tail -n 20 $log_path > /tmp/error_log.tmp
  cat /tmp/error_log.tmp > $log_path

  log_path="/SOHU/LOG/apachelogs"
  for file in `ls $log_path | grep error_log`
  do
    if [ -f $log_path/$file ]; then
      tail -n 1000 $log_path/$file > /tmp/error_log.tmp
      cat /tmp/error_log.tmp > $log_path/$file
    fi
  done
  log_path="/SOHU/LOG/phplogs"
  for file in `ls $log_path | grep error_log`
  do
    if [ -f $log_path/$file ]; then
      tail -n 1000 $log_path/$file > /tmp/error_log.tmp
      cat /tmp/error_log.tmp > $log_path/$file
    fi
  done
fi


