#/bin/sh
###########################
# name dog_memcached.sh   #
# desc Memcached dog      #
# author caoxd            #
# createtime 2008-07-04   #
# updatetime 	          #
###########################
log=/WORK/important_log
start=/WORK/Memcached/memcached_start.sh
date=`date`
cat $start | while read meminfo
do
	
	str=`echo $meminfo | grep -v "^#" | grep "memcached"`
	if [ "$str" ]
	then
		#times=`/bin/ps aux | grep "$str" | awk '{print $8}' | grep 'Ss\|Rs'`
		times=`/bin/ps aux | grep "$str" | awk '{print $11}' | grep -v "grep"`
		echo $times
		if [ -z $times ]
		then
			echo "memcached shutdown at $date $str" >> $log
			`$str`
		fi
	fi
done
