#!/bin/sh
if [ "$1" == "" ]; then
echo -e "!!!\nImportant: be sure binlog_format = 'ROW' and binlog_row_image = full"
echo -e "Usage: ./binlog2sql.sh /WORK/DB/server0/var/mysql-bin.000061 [...]\n"
exit
fi

/usr/local/mysql/bin/mysqlbinlog -v $1 $2 $3 $4 $5 | sed -n 's/^###//p'

