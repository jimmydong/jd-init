#!/bin/bash
#by jimmy 20070927
runcmd="/usr/local/mysql/bin/mysqldumpslow"

echo    "Usage $0 [option]"
echo    "'--v+',       # verbose"
echo    "'--d+',       # debug"
echo    "'--s=s',      # what to sort by (t, at, l, al, r, ar etc)"
echo    "'--r!',       # reverse the sort order (largest last instead of first)"
echo    "'--t=i',      # just show the top n queries"
echo    "'--a!',       # don't abstract all numbers to N and strings to 'S'"
echo    "'--n=i',      # abstract numbers with at least n digits within names"
echo    "'--g=s',      # grep: only consider stmts that include this string"
echo    "'--h=s',      # hostname of db server for *-slow.log filename (can be wildcard)"
echo    "'--i=s',      # name of server instance (if using mysql.server startup script)"
echo    "'--l!',       # don't subtract lock time from total time"
if ! [ -e slow_query.log ] ; then
    echo "Error: Can not find the slow_query.log";
    echo "!You must in the same pwd with slow_query.log"
    exit 0
fi
$runcmd --s=t --t=10 $1 $2 $3 slow_query.log

