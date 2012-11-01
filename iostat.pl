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
foreach $iostat (`/usr/bin/iostat`) 
{ 
  @io = split(/\s+/,$iostat); 
  $read += $io[2]; 
  $write += $io[3]; 
}
if($read > 1000000){
  $read = 0;
  $write = 0;
  foreach $iostat2 (`sar -d 3 | grep 'Average'`)
  {
#    print "$iostat2 \n";
    @io = split(/\s+/,$iostat2);
    if($io[3]>0)
    {
      $read += $io[3];
    }
    if($io[4]>0)
    {
      $write += $io[4];
    }
  }
}
print "$read\n"; 
print "$write\n";
