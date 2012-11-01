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
#print "$df[4]"; 
  if($df[5]=='98%' || $df[5]=='99%' || $df[5]=='100%' ){ print "$df[4]\n"; print "$df[3] -> $df[6]\n";exit; }
} 
print "1\n"; 
print "1\n";
