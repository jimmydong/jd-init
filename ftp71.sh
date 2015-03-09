#!/bin/sh
localname=`basename "$1"`
remotename=`basename "$2"`
HOSTNAME=`hostname`

if [ "$#" -ne "2" -o "$localname" = "$remotename" -o -d "$1" ]; then
        echo -e "Usage: /WORK/SBIN/ftp.sh /dir1/../dirn/local_file /remote_directory/\neg: /WORK/SBIN/ftp.sh /var/www/bbs/bbs.yoka.c
om/upload/1.png /bbs/attachments/1/"
        exit 1
fi


DATE=`date +%F_%T`

if /usr/local/bin/ncftpput -u www -p aHVsb25nc2hlbmdAeW9rYS5jb20= -P 21 -R -m  10.0.0.71 $2 $1 ;then
        echo "$DATE : from $1 to $2 upload on $HOSTNAME OK" >>/var/log/ncftpput.ok
else
        if /usr/local/bin/ncftpput -u www -p aHVsb25nc2hlbmdAeW9rYS5jb20= -P 21 -R -m  10.0.0.71 $2 $1 ;then
                echo "$DATE : from $1 to $2 upload on $HOSTNAME OK" >>/var/log/ncftpput.ok
        else
                echo "$DATE : from $1 to $2 upload on $HOSTNAME error" >>/var/log/ncftpput.error
                echo "$DATE : from $1 to $2 upload on $HOSTNAME error"|mail -s "$DATE : from $1 to $2 upload on $HOSTNAME error" lon
gsheng@yoka.com
        fi

fi
