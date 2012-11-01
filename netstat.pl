#!/usr/bin/perl 
# This script was written on Debian 3.0, it assumes that the command 
# output(df -kl) looks like this: 
# Filesystem           1k-blocks      Used Available Use% Mounted on 
# /dev/md0              95645100  30401312  64272080  33% / 
# /dev/hde1                14119      1159     12231   9% /boot 
# 
# In which case, this script returns : 
# 95659219 
# 30402503 
# when run. 
foreach $iostat (`sar -n DEV 2 | tail -3`) 
{ 
  @io = split(/\s+/,$iostat); 
  $in += $io[4]; 
  $out += $io[5]; 
}
$kin=`echo "$in/1000" | bc -l -s | sed -e 's/^\\(.*\\)\\.\\(.\\).*/\\1.\\2/'`;
$kout=`echo "$out/1000" | bc -l -s | sed -e 's/^\\(.*\\)\\.\\(.\\).*/\\1.\\2/'`; 
print "$kin"; 
print "$kout";
