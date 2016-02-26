#!/bin/sh
echo "please use git stash before this action!"
git reset --hard HEAD
git clean -f -d
git pull
