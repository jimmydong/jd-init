#!/bin/sh
if [ "$1" == "" ]; then
echo -e "Usage: rsync.sh DIR_NAME\n\n"
exit
fi
rundir="/WORK/HTML/$1";
if [ ! -d $rundir ];then
echo -e "Error: Can not find the directory /WORK/HTML/$1 \n"
exit
fi

/usr/bin/rsync -avz --exclude "local.inc.php" --exclude "WORK-ENV.ini" --exclude "_LOG" --exclude "_TEMPLATE_C" --exclude ".svn" --password-file=/etc/rsync.yisheng yisheng@10.173.18.230::$1 /WORK/HTML/$1
echo "Rsync Done!"


