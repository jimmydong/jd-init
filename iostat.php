#!/usr/local/php/bin/php
<?
$second=2;
ob_start();
passthru("cat /proc/partitions");
$raw_result=ob_get_clean();
$info=explode("\n", $raw_result);
foreach($info as $line){
if(trim($line)=='')continue;
$dinfo=preg_split("/[\s,]+/", $line);
if($dinfo[4]=='rio')continue;
$p1[$dinfo[4]][ruse]=$dinfo[7];
$p1[$dinfo[4]][wuse]=$dinfo[11];
}
sleep($second);
ob_start();
passthru("cat /proc/partitions");
$raw_result=ob_get_clean();
$info=explode("\n", $raw_result);
foreach($info as $line){
if(trim($line)=='')continue;
$dinfo=preg_split("/[\s,]+/", $line);
if($dinfo[4]=='rio')continue;
$p2[$dinfo[4]][ruse]=$dinfo[7];
echo "{$dinfo[4]} read: ".($dinfo[7]-$p1[$dinfo[4]][ruse])/4 ."k";
$p2[$dinfo[4]][wuse]=$dinfo[11];
echo " write: ". ($dinfo[11]-$p1[$dinfo[4]][wuse])/4 ."k\n";
}
?>
