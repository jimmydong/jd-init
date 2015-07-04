#!/bin/sh

#BACKUP DB
ssh db01 "cd /WORK; /bin/tar -czvf - DB" | cat > /WORK/BACKUP/DB/DB_`date +%Y%m%d`.tar.gz

#BACKUP WWW --> web02
#cd /WORK
#/bin/tar -czvf /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz /home/wwwroot
#scp /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz web02:/WORK/BACKUP
#rm /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz -f

#BACKUP upload
cd /WORK/HTML;tar -czvf /WORK/BACKUP/upload/upload_`date +%Y%m%d`.tar.gz upload

#BACKUP HTML
ssh web02 "cd /WORK;/bin/tar -czvf - HTML" | cat > /WORK/BACKUP/HTML/HTML_`date +%Y%m%d`.tar.gz

#BACKUP SVN
cd /WORK
/bin/tar -czvf /WORK/BACKUP/SVN/SVN_`date +%Y%m%d`.tar.gz /WORK/SVN

#Clean Old
cd /WORK/BACKUP/DB; /bin/find . -ctime +30 | /usr/bin/xargs rm -Rf
cd /WORK/BACKUP/upload; /bin/find . -ctime +6 | /usr/bin/xargs rm -Rf
cd /WORK/BACKUP/HTML; /bin/find . -ctime +6 | /usr/bin/xargs rm -Rf
cd /WORK/BACKUP/SVN; /bin/find . -ctime +6 | /usr/bin/xargs rm -Rf

/WORK/ssh_all.sh "cd /WORK/LOG/xhprof;find . -ctime +2 | /usr/bin/xargs rm -Rf"
/WORK/ssh_all.sh "cd /WORK/LOG; find . -ctime +14 | grep 'debug_' | xargs rm -f"
/WORK/ssh_all.sh "cd /WORK/LOG/apache_logs; find . -ctime +14 | grep 'access' | xargs rm -f"
/WORK/ssh_all.sh "cd /WORK/LOG/xhprof; find . -ctime +1 | xargs rm -f"
/WORK/ssh_all.sh "cd /WORK/HTML/yishengV2/_LOG; find . -ctime +14 | grep 'debug' | xargs rm -f"


