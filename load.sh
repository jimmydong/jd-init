#!/bin/sh 
cat /proc/loadavg |awk '{print $1}'
cat /proc/loadavg |awk '{print $3}'
