#!/bin/sh
server_list=('10.0.1.51' '10.0.1.52' '10.0.1.53' '10.0.1.54')

if [ "$1" == "" ]; then
echo -e "Usage: servers_ssh.sh '[command]' \neg:  servers_ssh.sh 'df -h' \n\nExit"
exit
fi

for s in "${server_list[@]}"
do
echo -e "\E[37;44m[ssh $s $1] ... \E[0m"
ssh $s "$1"
done
