<?
$ip_raw = file('/tmp/n');
foreach($ip_raw as $line){
	$t = preg_split ("/[\s,]+/", $line);
	//var_dump($t[4]);
	$tt = preg_match("/([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)/", $t[4], $m);
	//var_dump($m);
	$ip[$m[0]]++;
	if(trim($m[1]))$sub[$m[1].'.'.$m[2].'.'.$m[3].'*']++;
}
arsort($ip);arsort($sub);
$counter=0;
out("TOP IP", $ip, 20);
out("TOP SubNet", $sub, 10);
function out($title,$result,$max=10){
	echo "<hr>$title<hr>\n";
	foreach($result as $key=> $val){
		if(trim($key)=='')continue;
		if(ereg('59.151',$key))continue;
		if(ereg('123.127',$key))continue;
		if(ereg('10.0',$key))continue;
		if(ereg('119.161',$key))continue;
		if($counter++ > $max)break;
		echo "$key -- $val <br>\n";
	}
}
