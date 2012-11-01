#!/bin/sh 
# first the load 5 and 15 min avg 
# multiply * 100 to avoid floats 
# it helps if mrtg "period" is a multiple of 5 mins 
uptime | sed -e 's/^.*average.*: \(.*\)$/\1/' -e 's/ //g' | awk -F, '{ printf("%.0f\n",$2*100); printf("%.0f\n",$3*100) }' 
# the uptime 
#uptime | sed 's:^.* up \(.*\), [0-9][0-9]* users.*$:\1:' 
# my name 
#uname -n 

