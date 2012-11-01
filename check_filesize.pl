#!/usr/bin/perl
print "Usage: check_filesize.pl path [sizelimit] \n";
if($ARGV[0] != ""){chdir($ARGV[0]);}
if($ARGV[1] > 0){$max_filesize = $ARGV[1];} else {$max_filesize = 1600000;}
#print(`ls -s1U`);
foreach $file_size (`ls -s1U | grep -v total`){
@df = split(/\s+/,$file_size);
if($df[1] > $max_filesize){print "$df[1] \n";print "$folder_path[6]/$df[2] \n";exit;}
}
#print("ls --time-style='+%Y%m%d%H%M%S' -l | grep '^[d|l]'");
#print(`ls --time-style='+%Y%m%d%H%M%S' -l | grep "^[d|l]"`);
foreach $folder (`ls --time-style='+%Y%m%d%H%M%S' -l | grep "^[d|l]"`){
@folder_path = split(/\s+/,$folder);
#print("ls -s1U $folder_path[6] \n");
#print(`ls -s1U $folder_path[6]`);
foreach $file_size (`ls -s1U $folder_path[6] | grep -v total`){
@df = split(/\s+/,$file_size);
if($df[1] > $max_filesize){print "$df[1] \n";print "$folder_path[6]/$df[2] \n";exit;}
}
}
print "1 \n";
print "1 \n";
