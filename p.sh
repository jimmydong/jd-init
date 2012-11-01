#!/bin/sh
echo -e `pstree $1 $2 | sed 's/\\(.*\\)/\\1\\\\n/' | sed 's/-httpd/-\\\\E\\[47;31mhttpd\\\\E\\[0m/' | sed 's/-mysqld/-\\\\E\\[47;31mmysqld\\\\E\\[0m/'`

