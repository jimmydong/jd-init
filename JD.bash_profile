# .bash_profile
# location: /root/.bash_profile
# by jimmy

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/YOKA/SBIN
ip=`/sbin/ifconfig eth0 | grep Bcast | sed -e 's/^.* addr:\(.*\) Bcast.*$/\1/'`
#if [ $ip ];then PS1="\[\e[32;1m\]$ip\[\e[0m\][\W]\$ "
if [ $ip ];then PS1="\[\e[32;1m\]\h\[\e[0m\][\W]\$ "
else PS1="\[\e[32;1m\]`/sbin/ifconfig eth1 | grep Bcast | sed -e 's/^.* addr:\(.*\) Bcast.*$/\1/'`\[\e[0m\][\W]\$ "
fi
export PATH
export PS1
export HISTIGNORE="&:history:ls:ls *:ps:ps -A:df:df *:du:du *:[bf]g:exit"
unset USERNAME
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
