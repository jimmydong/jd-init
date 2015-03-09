#!/bin/sh

##
# cp every JD.config file to the right location
# by jimmy 2009.05.19

echo "You should install lrz and tsocks first, use the rpm pakage."

#mkdir /root/.ssh
#chmod 700 /root/.ssh
#cp JD.authorized_keys /root/.ssh/authorized_keys
#chmod 600 /root/.ssh/authorized_keys

cp JD.bash_profile /root/.bash_profile
cp JD.colorls.sh /etc/profile.d/colorls.sh
chmod +x /etc/profile.d/colorls.sh
cp JD.jimmy.sh /etc/profile.d/jimmy.sh
chmod +x /etc/profile.d/jimmy.sh
mkdir /etc/snmp
cp JD.snmpd.conf /etc/snmp/snmpd.conf
cp JD.tsocks.conf /etc/tsocks.conf
cp JD.sources.list /etc/apt/sources.list
rm /etc/apt/sources.list.d/* -f
cat /etc/tsocks.conf
cp JD.jimmy.repo /etc/yum.repos.d/jimmy.repo.org
cp JD.geekery.repo /etc/yum.repos.d/geekery.repo.org

mv /bin/vi /bin/vi.org
ln /usr/bin/vim /bin/vi

groupadd www
useradd www
groupadd mysql
useradd mysql

mkdir /WORK/HTML
mkdir /WORK/LOG
mkdir /WORK/LOG/apachelogs
mkdir /WORK/LOG/phplogs
cp JD.security /home/mysql/mysql.security.ini

echo "Remember:"
echo "1, edit /etc/yum.repos.d/jimmy.repo"
echo "2, edit /etc/socks.conf"
echo ""
