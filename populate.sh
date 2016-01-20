#!/usr/bin/bash


curl -s 'https://api.github.com/orgs/kicad/repos?page=1&per_page=100' \
 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| puts repo["clone_url"] }' \
 | grep pretty | while read -r line ; do
 	git remote remove `basename $line .pretty.git`
 	echo Added: `basename $line .git`
 	git remote add `basename $line .pretty.git` $line 
 done
git remote remove walter
echo Added: walter
git remote add walter git://smisioto.eu/kicad_libs.git

git remote remove kicad-lib
echo Added: kicad-lib
git remote add kicad-lib https://github.com/KiCad/kicad-library.git  