#!/bin/sh
if [ "$2" == "" ]; then
echo -e "Install: \n1, git clone https://github.com/Meituan-Dianping/MyFlash.git\n2, build and copy bin file to /usr/bin\n"
echo -e "Use: binlog_flashback binlog_file dbname [tablename] [start_datetime]"
exit
fi

if [ "$3" == "" ]; then
/usr/bin/flashback --databaseNames $2 --binlogFileNames $1
/usr/bin/mysqlbinlog -v binlog_output_base.flashback > flashback.sql
echo -e "Done! Output file is flashback.sql\n"
exit
fi

if [ "$4" == "" ]; then
/usr/bin/flashback --databaseNames $2 --tableNames $3 --binlogFileNames $1
/usr/bin/mysqlbinlog -v binlog_output_base.flashback > flashback.sql
echo -e "Done! Output file is flashback.sql\n"
exit
fi

/usr/bin/flashback --databaseNames $2 --tableNames $3 --start-datetime "$4"  --binlogFileNames $1
/usr/bin/mysqlbinlog -v binlog_output_base.flashback > flashback.sql
echo -e "Done! Output file is flashback.sql\n"

