#!/bin/sh
cd   /var/spool/clientmqueue/
/usr/bin/find /var/spool/clientmqueue/  -mtime +3 -exec rm -f {} \;
