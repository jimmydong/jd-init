#!/bin/sh
echo Usage: do_all.sh 'some command'

#ALL: userlist=('at01' 'at02' 'at03' 'at04' 'at05' 'at06' 'at07' 'at08' 'at09' 'fan01' 'fan02' 'fan03' 'fan04' 'at10' 'at11' 'at12' 'at13')
userlist=('db01' 'web01' 'web02')

for user in ${userlist[@]};do
echo 
echo 
echo [ssh $user] -======================== $1 ========================-
/usr/bin/ssh $user "$1"
done
