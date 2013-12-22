#!/bin/sh
cd /YOKA/HTML

echo 'backup html data ...'
tar czvf redbull_`date +%Y%m%d`.tar.gz redbullsports.cn
scp redbull_`date +%Y%m%d`.tar.gz RD03:/YOKA/BACKUP/
rm redbull_`date +%Y%m%d`.tar.gz -f;
ssh rd03 "cd /YOKA/BACKUP;find -atime +14 -delete"

echo 'backup mysql data ...'
ssh rd02 "cd /YOKA/DB;tar czvf server30_`date +%Y%m%d`.tar.gz server30"
scp rd02:/YOKA/DB/server30_`date +%Y%m%d`.tar.gz .
scp server30_`date +%Y%m%d`.tar.gz rd04:/YOKA/BACKUP
rm server30_`date +%Y%m%d`.tar.gz -f
ssh rd02 "cd /YOKA/DB;rm server30_`date +%Y%m%d`.tar.gz -f"

echo 'backup src data ...'
ssh rd03 "cd /YOKA/HTML;tar czvf src_`date +%w`.tar.gz src"
scp rd03:/YOKA/HTML/src_`date +%w`.tar.gz /YOKA/BACKUP/

