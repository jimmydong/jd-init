<?
/**
 * Loop a cmd timely
 * by jimmy 20070726
 *
 */

$usage="
JD_kits(http://www.jimmydong.com) by jimmy 2006.12
[as cmd]:  /path_to_php/php loop.php \"the_command\" [internal_seconds] [loop_times]
[as url]:  http://root_url/loop.php?command=the_command&sleep=internal_seconds&loops=loop_times
";
$command=$_GET[command];
$sleep=$_GET[sleep];
$loops=$_GET[loops];
if($argv[1])$command=$argv[1];
if($argv[2])$sleep=$argv[2];
if($argv[3])$loops=$argv[3];
if(!$command){
echo "input error! Usage: $usage";
exit;
}
if($sleep<1)$sleep=3;
if($loops<1)$loops=99;
for($i=0;$i<$loops;$i++){
echo "[".date("Y-m-d H:i:s")."] Loop $i / $loops: \n";
passthru($command);
sleep($sleep);
}
?>
