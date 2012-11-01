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
foreach $filesystem (`df -kl | grep -v "Filesystem"`) 
{ 
  @df = split(/\s+/,$filesystem); 
  $total += $df[1]; 
  $usage += $df[2]; 
} 
print "$total\n"; 
print "$usage\n";
