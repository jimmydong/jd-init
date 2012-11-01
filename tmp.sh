#/bin/sh
ftp -n <<- EOF

open 10.0.0.72 21

user www aHVsb25nc2hlbmdAeW9rYS5jb20=

bin

cd /bbs/attachments/1

rename tsocks-1.8-6.beta5.2.el4.rf.x86_64.rpm __del__tsocks-1.8-6.beta5.2.el4.rf.x86_64.rpm

bye

EOF


