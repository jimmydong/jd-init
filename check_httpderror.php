#!/usr/local/php/bin/php
<?php
/**
 * 分析服务器server-status
 * 必要时添加iptables
 *
 * Only for Apache! Only for club.sohu!
 * by jimmy 20071122
 */
ini_set("display_errors","On");
$directory=$argv[1];
$number_limit=$argv[2];
if(!$number_limit)$number_limit=1000;
$lscmd="/bin/ls  $directory/error*";
#$result=passthru($lscmd);
#$resarray=explode("\r\n",$result);
#var_dump($result);
ob_start();$result=passthru($lscmd);$result=ob_get_contents();ob_end_clean();
$resarray=explode("\n",$result);
#var_dump($resarray);
foreach($resarray as $v) {
$filearray=explode(" ",$v);
	if($filearray[0]) {
	$filenamearray[]= $filearray[0];
	}
}
foreach ($filenamearray as $file) {
	$filesize=0;
	$filesize=filesize($file);
	$offset=204600;
	$stream=fopen($file,"r");
	for($i=0;$i<=$filesize;$i=$i+$offset) {
		$data=stream_get_contents($stream,$offset,$i);
	 	if(!empty($data)) {
		$dataarray=explode("\n",$data);
			foreach ($dataarray as $k) {
			  preg_match_all("/\[(.*)] \[(.*)]\s\[client\s(.*)]\s(.+)/",$k,$res);
			  if(!empty($res[4][0])) {
				$error[$res[4][0]]++;
				if($number_limit < $error_number++)break 3;
			  }
			}
		}
	}
	fclose($stream);
}
asort($error);
var_dump($error);
?>
check_httperror.php. (Uage: ./check_httperror.php  [dir] [Number])Done!
