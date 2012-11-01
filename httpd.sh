#!/bin/sh
export LANG=""
pstree | grep '\*\[httpd\]' | sed -e 's/^.*-\(.*\)\*\[httpd\]$/\1/' -e 's/ //g'
