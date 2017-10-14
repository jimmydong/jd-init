#!/bin/bash
[[ $(type -t cd) == "alias" ]] && unalias cd
if [ $# == 0 ];then
    cd
else
    cd $1
fi
/WORK/SBIN/dcd `pwd`
alias cd='source /WORK/SBIN/dcd.sh'
