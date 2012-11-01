#!/bin/sh
#######################################
# Check mysql status
# for club.sohu only!
# by jimmy 20071128
#######################################

if [ $# -lt 2 ]; then
  echo -e "Usage: check_db.sh host port [user] [password]\neg:  check_db.sh club_bbs3 8210\n\n"
  exit
fi

if [ -n "$3" ]; then
  user="$3"
else
  user="yoka"
fi

if [ -n "$4" ]; then
  pass="$4"
else
  pass="yoka.com"
fi

echo $1 $2 $user $pass
/usr/local/mysql/bin/mysql  -h$1 -P$2 -u$user -p$pass -e"show processlist;" 
