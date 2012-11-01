#!/usr/local/php/bin/php
<?php
ini_set("display_errors","On");
$str="[Mon Mar 24 01:57:06 2008] [error] [client 61.135.163.119] PHP Warning:  ereg() [<a href='function.ereg'>function.ereg</a>]: REG_BADRPT in /opt/community/club/html/main.php on line 50";
preg_match_all("/\[(.*)] \[(.*)]\s\[client\s(.*)]\s(.+)/",$str,$res);
echo $str;
var_dump($res);

?>
