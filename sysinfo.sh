#!/bin/sh
#all disk
/bin/df | gawk '{sum += $2}; END { print "all disk:" int(sum/1024000) "G" }'
#use disk
#/bin/df | gawk '{sum += $3}; END { print "free disk:" int(sum/1024000) "G" }'
#mem
cat /proc/meminfo | grep "MemTotal:" | awk '{print "mem size:" int($2/1000000) "G"}'
#cpu number
cat /proc/cpuinfo | grep "model name" | awk -F: '{ i++ };END { print "cpu num:",i};'
#cpu
cat /proc/cpuinfo | grep "model name" | awk -F: '{ i=$2 };END { print "cpu type:",i};'
