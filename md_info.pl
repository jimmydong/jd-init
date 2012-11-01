#!/usr/bin/perl 
# Show memcached status
# by jimmy 20080814
if($ARGV[0]){
  $ip=$ARGV[0];
}else{
  $ip='127.0.0.1';
}
if($ARGV[1]){
  $port=$ARGV[1];
}else{
  $port=8087;
}

$cmd = "(echo 'stats';sleep 1;echo 'quit') | telnet $ip $port";
$_ = `$cmd`;
/STAT total_connections ([0-9]*)/;
$connect1=$1;

$_ = `$cmd`;
/STAT total_connections ([0-9]*)/;
$connect2=$1;
$conps=$connect2-$connect1;

/STAT uptime ([0-9]*)/;
$all_sec=$1;
$uphour=int($1/3600);
$upmin=int(($1-$uphour*3600)/60);
$upsec=$1%60;
/STAT cmd_get ([0-9]*)/;
$all_get=$1;
/STAT cmd_set ([0-9]*)/;
$all_set=$1;
$access_avg=int(($all_get+$all_set)/$all_sec);
/STAT cmd_hits ([0-9]*)/;
$all_hit=$1;
/STAT cmd_misses ([0-9]*)/;
$all_miss=$1;
$hit_rate=$all_hit*100/($all_hit+$all_miss);


print "\n\n\n";
print "------------------ Memcached Status ----------------- \n";
print "Usage: md_info.pl [127.0.0.1] [8087] # \n";
print "Run: $uphour hour, $upmin min, $upsec sec\n";
print "Hit rate: $hit_rate% \n";
print "All get: $all_get \n";
print "All get: $all_set \n";
print "Average Access: $access_avg/s \n";
print "Current Access: $conps/s \n";
print "----------------------------------------------------- \n\n";

exit;


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
