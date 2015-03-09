#/bin/sh

###########################
# name dog_nfs.sh         #
# desc NFS dog            #
# author caoxd            #
# createtime 2008-05-23   #
# updatetime 2008-5-26    #
###########################

nfsList=$(cat /etc/fstab | grep nfs $3  | awk '{ print $1}' |grep -v '^\s*#')
log=/WORK/important_log
tmpfile=/WORK/tmp_mount_nfs
nfsNumber=0
for remote in $nfsList
do
        tmp="$tmpfile"_"$nfsNumber"
        status=$(df | grep -x "$remote" $1)
		echo $status
        if [ "$status" == '' ]
        then #失败
                date=`date`
                if [ -e $tmp ] 
                then #错误临时文件不存在
                        num=$(cat $tmp)
                        if [ $num -eq 0  -o  $num -ge 3  ] 
                        then #如果正在MOUNT或MOUNT三次后
                                exit
                        fi
                else
                        num=0
                fi
                #错误处理
                echo 0 > $tmp 
        echo "nfs $remote shutdown at $date" >> $log
        local=$(cat /etc/fstab | egrep -e "^$remote\b" $1 | awk '{print $2}')
		echo "mount -t nfs $remote $local"
        `mount -t nfs $remote $local`
        if [ $? -eq 0 ] 
                then # 如果mount 成功
                echo " nfs $remote restart at $date" >> $log
                `rm -f $tmp`
        else
                echo $(($num+1)) > $tmp
        fi
        else #删除临时文件
                `rm -f $tmp`
        fi
        nfsNumber=$(($nfsNumber+1))
done
