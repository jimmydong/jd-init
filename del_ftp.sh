#!/bin/sh


REMOTEHOST="10.0.0.72"
USERNAME="www"
PASSWORD="aHVsb25nc2hlbmdAeW9rYS5jb20="

DIRNAME=`dirname "$1"`
FILENAME=`basename "$1"`

if [ "$#" -ne "1" ]; then
        echo -e "Usage: /WORK/SBIN/rm_attch.sh /dir1/../dirn/remote_file\neg: /WORK/SBIN/rm_attch.sh /bbs/attachments/1/1.png"
        exit 1
fi


ftp -n <<- EOF

open $REMOTEHOST 21

user www aHVsb25nc2hlbmdAeW9rYS5jb20=

cd $DIRNAME

rename $FILENAME __del__"$FILENAME"

bye

EOF

