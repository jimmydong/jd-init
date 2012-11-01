#/bin/sh
###########################
# name get_host_ip.sh     #
# desc Get Hosts ip       #
# author Lucas Lu         #
# createtime 2008-12-01   #
# updatetime 	          #
###########################
#host=/etc/hosts
host=/YOKA/SBIN/webhost
#cat  $host|grep -v "^#" | grep -v "127.0.0.1"|grep -v "^220.181"|grep -v "^61.135" |grep -v "192.168.132.151" |grep -v "192.168.131.198"|grep -v "192.168.8.252"|grep -v "192.168.1.146"|grep -v "192.168.133.217"|grep -v "192.168.133.217"|grep -v "192.168.133.222"|grep -v "192.168.1.18"|grep -v "192.168.1.146"|grep -v "192.168.103.59"|grep -v "10.10.80.23"|grep -v "192.168.1.210"|grep -v "10.11.3.18"|grep -v "192.168.133.56"|grep -v "10.1.1.58" |grep -v "10.1.1.1"|grep -v "192.168.103.60"|grep -v "10.11.3.50"|grep -v "10.10.80.41"|grep -v "192.168.133.188"|grep -v "10.1.1.47"|grep -v "10.1.1.37"|grep -v "192.168.1.148"|grep -v "10.1.47.47"|awk '{print $1}' 
hosttab=`awk '{print $1}' $host|grep -v "^#"| grep -v "127.0.0.1"|grep -v "^220.181"|grep -v "^61.135" |grep -v "192.168.132.151" |grep -v "192.168.131.198"|grep -v "192.168.8.252"|grep -v "192.168.1.146"|grep -v "192.168.133.217"|grep -v "192.168.133.217"|grep -v "192.168.133.222"|grep -v "192.168.1.18"|grep -v "192.168.1.146"|grep -v "192.168.103.59"|grep -v "10.10.80.23"|grep -v "192.168.1.210"|grep -v "10.11.3.18"|grep -v "192.168.133.56"|grep -v "10.1.1.58" |grep -v "10.1.1.1"|grep -v "192.168.103.60"|grep -v "10.11.3.50"|grep -v "10.10.80.41"|grep -v "192.168.133.188"|grep -v "10.1.1.47"|grep -v "10.1.1.37"|grep -v "192.168.1.148"|grep -v "10.1.47.47"|grep -v "192.168.133.40"|grep -v "192.168.131.122"|grep -v "192.168.103.44"|grep -v "192.168.133.32"|grep -v "192.168.133.18"` 
for ipinfo in $hosttab
do
	echo $ipinfo
	if [ "$ipinfo" ]
	then
	date>>httpdinfo.log
	echo $ipinfo >>httpdinfo.log
	ssh $ipinfo "/usr/local/apache/bin/httpd -V"|grep -v "^ "|grep -v "compiled"|while read httpinfo	
	do
	if [ "$httpinfo" ] 
	then
	echo $ipinfo $httpinfo>>webhostinfos.log
	fi
	done
	fi
done
