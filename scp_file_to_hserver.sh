#/bin/sh
###########################
# name get_host_ip.sh     #
# desc Get Hosts ip       #
# author Lucas Lu         #
# createtime 2008-12-01   #
# updatetime 	          #
###########################
host=/YOKA/SBIN/webhost
hosttab=`awk '{print $1}' $host`
for meminfo in $hosttab
do
	if [ "$meminfo" ]
	then
	date>>httpdsync.log
	echo $meminfo >>httpdsync.log
	#echo $2
	/usr/bin/scp  /YOKA/SBIN/check_httpderror.php root@$meminfo:/root >>httpdsync.log
	fi
done
