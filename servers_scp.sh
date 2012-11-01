#!/bin/sh
server_list=('10.0.1.52' '10.0.1.53' '10.0.1.54')

if [ "$2" == "" ]; then
echo -e "Usage: server_scp.sh '[source]' '[dest]' [other]\neg:  server_scp.sh /YOKA/SBIN /YOKA/SBIN \n\nExit"
exit
fi

for s in "${server_list[@]}"
do
echo -e "\E[37;44m[scp $1 $s:$2]: \E[0m"
scp -r $1 $s:$2
done
