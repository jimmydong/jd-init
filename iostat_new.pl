#!/usr/bin/perl 
# by jimmy 20070926
# only for in which iostat.pl can not run correctly 

#foreach $iostat (`cat /proc/partitions`)
#{
#  @io = split(/\s+/,$iostat);
#  $read1 += $io[8];
#  $write1 += $io[12];
#}
#`sleep 2`;
#foreach $iostat (`cat /proc/partitions`)
#{
#  @io = split(/\s+/,$iostat);
#  $read2 += $io[8];
#  $write2 += $io[12];
#}
#$read3 = ( $read2 - $read1 ) /4 ;
#$write3 = ( $write2 - $write1 ) /4;
#print "$read3 blocks\n";
#print "$write3 blocks\n";
foreach $iostat (`/usr/bin/iostat`)
{
  @io = split(/\s+/,$iostat);
  $r1 += $io[4];
  $w1 += $io[5];
}
sleep 3;
foreach $iostat (`/usr/bin/iostat`)
{
  @io = split(/\s+/,$iostat);
  $r2 += $io[4];
  $w2 += $io[5];
}
$read = int(($r2 - $r1)/3);
$write = int(($w2 - $w1)/3);
print "$read\n";
print "$write\n";

