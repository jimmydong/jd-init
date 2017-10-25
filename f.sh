#/bin/sh

list=('/bin' '/sbin' '/usr/bin' '/usr/sbin' '/usr/local/bin' '/usr/local/sbin' '/WORK/SBIN')

echo
echo -n Find cmd in path:
for path in ${list[@]};do
	echo -n '' $path
done
echo
echo



for path in ${list[@]};do
	echo Find $1 in $path ...
	ls $path | grep $1 | xargs -i ls -lh --color=tty $path/{}
done

