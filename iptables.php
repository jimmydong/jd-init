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

$min_threads    = 200;
$ip_rate        = 0.2;
$subnet_rate    = 0.3;
$server_flag    = 1;
$white_list     = '(^127\.0\.0\.1)|(^192\.168\.)|(^10\.0\.)|(^119\.161\.)|(^59\.151\.)';
foreach($argv as $key=> $arg){
    if($key==0)continue;
    if(ereg(".*\..*\..*\..*",$arg)){
        $server_ip=$arg;
    }
    if(ereg('debug',$arg)){
        $debug=1;
    }
}
if(!$server_ip && $argv[1] && $argv[1]!='debug')$server_ip=$argv[1];
if(!$server_ip){
	//$cmd='/sbin/ifconfig | grep inet | sed -e \'s/^.*inet addr:\(.*\) Bcast.*$/\1/\'';
	$cmd='/sbin/ifconfig eth0 | grep Bcast | sed -e \'s/^.* addr:\(.*\) Bcast.*$/\1/\'';
	ob_start();$ifconfig=passthru($cmd);$ifconfig=ob_get_contents();ob_end_clean();
	if(ereg('(192\.168\.[0-9]+\.[0-9]+)|(10\.0\.[0-9]+\.[0-9]+)|(119\.161\.[0-9]+\.[0-9]+)|(59\.151\.[0-9]+\.[0-9]+)',$ifconfig,$result)){
	$server_ip=$result[0];
	}
}
$contents=file_get_contents("http://{$server_ip}/httpd_status");
if($debug){
    echo "[debug]contents:\n".substr($contents,0,100)."\n";
}
if($contents==''){
	echo "iptables.php: Can not get server-status!";
	exit;
}
preg_match_all("|<tr><td><b>[0-9]+-[0-9]+</b></td><td>.*?</td><td>.*?</td><td>.*?</td><td>(.*?)</td><td>.*?</td><td>.*?</td><td>.*?</td><td>.*?</td><td>.*?</td><td>(.*?)</td><td nowrap>(.*?)</td><td nowrap>(.*?)</td></tr>|is",$contents,$result);
if(!is_array($result)){
    echo "Get server-status failed! \n";
    exit;
}
//var_dump($result);
$cpulist=$result[1];
$iplist=$result[2];
$hostlist=$result[3];
$urllist=$result[4];
if($debug){sort($result[4]);print_r($result[4]);}
$all_threads=0;
//var_dump($iplist);
foreach($iplist as $key=> $ip){
    if(ereg($white_list,$ip,$result)){
        if($debug)echo "[debug]skip internal ip: $ip ({$result[0]})\n";
        continue;
    }
    $tmp=explode('.',$ip);
    if(count($tmp)!=4){
        //echo "skip a bad ip: $ip \n";
        continue;
    }
    $all_threads++;
    $subnet="{$tmp[0]}.{$tmp[1]}.{$tmp[2]}.";
    $subnet_info[$subnet]++;
    $ip_info[$ip]++;
}
if(!is_array($ip_info)){
    echo "Can not find outernal links, exit. Please check internal links with 'debug'.\n";
    exit;
}
arsort($ip_info);arsort($subnet_info);
if($debug){
    echo "[debug]ip_info:\n";
    $counter=0;foreach($ip_info as $key=> $val){
	if($counter++ > 10)break;
        echo "    $key => $val \n";
    }
    echo "[debug]subnet_info:\n";
    $counter=0;foreach($subnet_info as $key=> $val){
	if($counter++ > 10)break;
        echo "    $key => $val \n";
    }
}
if($all_threads < $min_threads){
    if($debug)echo "[debug]threads: $all_threads , min_limit: $min_threads \n";
    echo "iptables.php: Apache is not busy. exit. \n";
    exit;
}

exit;

$conn=mysql_connect('59.151.9.87:3306','monitor','yoka.com');
foreach($ip_info as $ip=> $number){
    if($number < $all_threads*$ip_rate) break;
    //add to iptables, report to server, and exit
    $cmd="/sbin/iptables -A INPUT -i eth1 -p TCP -s {$ip} -j DROP ";
    if($server_flag==1) $result=`$cmd`;
    $sql="insert into iptables (filterip,filterdate,remoteAddr) values('$ip',now(),'$server_ip')";
    $result=mysql_db_query('server',$sql,$conn);
    echo "$cmd ? ".($server_flag==1)?" Done!\n":" alert only\n";
    exit;
}
foreach($subnet_info as $subnet=> $number){
    if($number < $all_threads*$subnet_rate) break;
    //add to iptables, report to server, and exit
    $cmd="/sbin/iptables -A INPUT -i eth1 -p TCP -s {$subnet}.0/24 -j DROP ";
    echo "$cmd done!\n";
    if($server_flag==1) $result=`$cmd`;
    $sql="insert into iptables (filterip,filterdate,remoteAddr) values('$subnet',now(),'$server_ip')";
    $result=mysql_db_query('user',$sql,$conn);
    echo "$cmd ? ".($server_flag==1)?" Done!\n":" alert only\n";
    exit;
}
?>
iptables.php: Not found any attack. (Uage: ./iptables.php [ip] [debug])Done!
