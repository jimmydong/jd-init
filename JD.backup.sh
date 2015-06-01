#!/bin/sh

#BACKUP DB --> web01
ssh db01 "cd /WORK;/bin/tar -czvf /WORK/BACKUP/DB_`date +%Y%m%d`.tar.gz DB"
scp db01:/WORK/BACKUP/DB_`date +%Y%m%d`.tar.gz web01:/WORK/BACKUP/
ssh db01 "rm /WORK/BACKUP/DB_`date +%Y%m%d`.tar.gz -f"

#BACKUP WWW --> web02
cd /WORK
/bin/tar -czvf /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz /home/wwwroot
scp /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz web02:/WORK/BACKUP
rm /WORK/BACKUP/WWW_`date +%Y%m%d`.tar.gz -f

#BACKUP upload --> web02
ssh web02 "/bin/tar -czvf /WORK/BACKUP/upload_`date +%Y%m%d`.tar.gz /WORK/HTML/upload"

#BACKUP HTML --> db01
ssh db01 "cd /WORK;/bin/tar -czvf /WORK/BACKUP/HTML_`date +%Y%m%d`.tar.gz HTML"
#scp db01:/WORK/BACKUP/HTML_`date +%Y%m%d`.tar.gz /WORK/BACKUP/
#ssh db01 "rm /WORK/BACKUP/HTML_`date +%Y%m%d`.tar.gz -f"

#BACKUP SVN --> db01
cd /WORK
/bin/tar -czvf /WORK/BACKUP/SVN_`date +%Y%m%d`.tar.gz /WORK/SVN
scp /WORK/BACKUP/SVN_`date +%Y%m%d`.tar.gz web01:/WORK/BACKUP
rm /WORK/BACKUP/SVN_`date +%Y%m%d`.tar.gz -f


#TODO:: apache/php/nginx ...

#Clean Old
cd /WORK/BACKUP
/bin/find . -ctime +14 | /usr/bin/xargs rm -Rf
ssh db01 "cd /WORK/BACKUP;/bin/find . -ctime +4 | /usr/bin/xargs rm -Rf"
ssh web02 "cd /WORK/BACKUP;/bin/find . -ctime +1 | /usr/bin/xargs rm -Rf"

