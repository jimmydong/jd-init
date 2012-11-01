#!/bin/sh
(
echo "stats"
sleep 1
echo "quit"
) | telnet 127.0.0.1 8087

