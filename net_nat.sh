#!/bin/sh
echo "1" >/proc/sys/net/ipv4/ip_forward
modprobe ip_tables
modprobe ip_nat_ftp
modprobe ip_conntrack_ftp

iptables -F INPUT
iptables -F FORWARD
iptables -F POSTROUTING -t nat
iptables -F PREROUTING -t nat

iptables -t nat -A POSTROUTING -s 10.0.1.0/24 -j SNAT --to 211.152.14.33

iptables -t nat -A PREROUTING -p tcp -d 211.152.14.33 --dport 80 -j DNAT --to 10.0.1.52:80
