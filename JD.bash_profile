# .bash_profile
# location: /root/.bash_profile
# by jimmy

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/WORK/SBIN
export PATH

# Use hostname to change host's name
ip=`/sbin/ifconfig eth1 | grep -E 'Bcast|broadcast' | sed -e 's/^.* \(addr:\|inet \)\(.*\) \(Bcast\|netmask\).*$/\2/'`
if [ $ip ];then
	PS1="\[\e[32;1m\]\h $ip\[\e[0m\][\W]\$"
else
	ip=`/sbin/ifconfig eth0 | grep -E 'Bcast|broadcast' | sed -e 's/^.* \(addr:\|inet \)\(.*\) \(Bcast\|netmask\).*$/\2/'`
	if [ $ip ];then
		PS1="\[\e[32;1m\]\h $ip\[\e[0m\][\W]\$"
	else
		PS1="\[\e[32;1m\]\h\[\e[0m\][\W]\$ "
	fi	
fi
export PS1

export HISTIGNORE="&:history:ls:ls *:ps:ps -A:df:df *:du:du *:[bf]g:exit"

cd /WORK;echo "[LOAD]";cat /proc/loadavg;echo "[DISK]";df -h;echo "[WORK]";ll -h;
if [ -e important_log ]
then
echo
echo -e "\E[41;34m" '!!!!!!!!!!!!!!!!!!!!!!!!! IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!' "\E[0m";
cat important_log
echo
echo " !After deal, remember delete the file";
fi
echo "----------------------------------------------------------------------"
