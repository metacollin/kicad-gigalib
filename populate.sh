#!/usr/bin/bash


curl -s 'https://api.github.com/orgs/kicad/repos?page=1&per_page=100' \
 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| puts repo["ssh_url"] }' \
 | grep pretty | while read -r line ; do
 	basename $line .pretty.git
 	git remote add `basename $line .pretty.git` $line 
 done