#!/bin/sh
echo Usage: scp_all.sh 'pathname'
hostlist=('web01' 'web02')

cd /root
for host in ${hostlist[@]};do
echo -======================= [scp $host]  scp "$1" $host:"$1" ========================-
/usr/bin/scp -r "$1" $host:"$1"
done

