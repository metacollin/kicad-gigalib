# #!/bin/bash

git remote remove walter
echo Added: walter
git remote add walter git://smisioto.eu/kicad_libs.git
git fetch walter

git remote remove kicad-lib
echo Added: kicad-lib
git remote add kicad-lib https://github.com/KiCad/kicad-library.git  
git fetch kicad-lib

git merge walter/master
mv library/power.dcm library/w_power.dcm
mv library/power.lib library/w_power.lib
mv library/conn.dcm library/w_conn.dcm
mv library/conn.lib library/w_conn.lib

git merge kicad-lib/master
touch fp-lib-table-backups
cat fp-lib-table >> fp-lib-table-backups

 FPLIBTABLESTRING='(fp_lib_table'
 echo -e "$FPLIBTABLESTRING" > fp-lib-table
 curl -s 'https://api.github.com/orgs/kicad/repos?page=1&per_page=100' \
 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| puts repo["clone_url"] }' \
 | grep pretty | while read -r line ; do
 	git remote remove `basename $line .pretty.git`
 	echo Added: `basename $line .git`
 	git remote add -f `basename $line .pretty.git` $line
 	git subtree add --prefix modules/`basename $line .git` `basename $line .pretty.git` master --squash
 	echo -e "  (lib (name `basename $line .pretty.git`)(type KiCad)(uri \${KISYSMOD}/`basename $line .git`(options "")(descr ""))" >> fp-lib-table
 done 

tail -n +2 fp-lib-table.walter >> fp-lib-table

cat fp-lib-table

echo "Done!"