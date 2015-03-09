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
        then #ʧ��
                date=`date`
                if [ -e $tmp ] 
                then #������ʱ�ļ�������
                        num=$(cat $tmp)
                        if [ $num -eq 0  -o  $num -ge 3  ] 
                        then #�������MOUNT��MOUNT���κ�
                                exit
                        fi
                else
                        num=0
                fi
                #������
                echo 0 > $tmp 
        echo "nfs $remote shutdown at $date" >> $log
        local=$(cat /etc/fstab | egrep -e "^$remote\b" $1 | awk '{print $2}')
		echo "mount -t nfs $remote $local"
        `mount -t nfs $remote $local`
        if [ $? -eq 0 ] 
                then # ���mount �ɹ�
                echo " nfs $remote restart at $date" >> $log
                `rm -f $tmp`
        else
                echo $(($num+1)) > $tmp
        fi
        else #ɾ����ʱ�ļ�
                `rm -f $tmp`
        fi
        nfsNumber=$(($nfsNumber+1))
done
