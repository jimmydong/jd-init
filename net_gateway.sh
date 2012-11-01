#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward

modprobe iptable_nat
modprobe ip_conntrack
#modprobe ip_conntract_ftp

iptables -F INPUT
iptables -F FORWARD
iptables -F POSTROUTING -t nat
iptables -P FORWARD DROP
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -j MASQUERADE
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT

