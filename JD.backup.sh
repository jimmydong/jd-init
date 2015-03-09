#!/bin/sh
cd /WORK/HTML

echo 'backup html data ...'
tar czvf redbull_`date +%Y%m%d`.tar.gz redbullsports.cn
scp redbull_`date +%Y%m%d`.tar.gz RD03:/WORK/BACKUP/
rm redbull_`date +%Y%m%d`.tar.gz -f;
ssh rd03 "cd /WORK/BACKUP;find -atime +14 -delete"

echo 'backup mysql data ...'
ssh rd02 "cd /WORK/DB;tar czvf server30_`date +%Y%m%d`.tar.gz server30"
scp rd02:/WORK/DB/server30_`date +%Y%m%d`.tar.gz .
scp server30_`date +%Y%m%d`.tar.gz rd04:/WORK/BACKUP
rm server30_`date +%Y%m%d`.tar.gz -f
ssh rd02 "cd /WORK/DB;rm server30_`date +%Y%m%d`.tar.gz -f"

echo 'backup src data ...'
ssh rd03 "cd /WORK/HTML;tar czvf src_`date +%w`.tar.gz src"
scp rd03:/WORK/HTML/src_`date +%w`.tar.gz /WORK/BACKUP/

