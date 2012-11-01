#/bin/sh
###########################
# name dog_magent.sh   #
# desc magent dog      #
# author bergdog            #
# createtime 2008-04-14   #
# updatetime 	          #
###########################
log=/YOKA/important_log
start=/YOKA/Memcached/memagent_start.sh
date=`date`
cat $start | while read magentinfo
do

        str=`echo $magentinfo | grep -v "^#" | grep "magent"`
        if [ "$str" ]
        then
                times=`/bin/ps aux | grep "$str" | awk '{print $11}' | grep -v "grep"`
                echo $times
                if [ -z $times ]
                then
                        echo "magent shutdown at $date $str" >> $log
                        `$str` >> $log
                fi
        fi
done
