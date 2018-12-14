#!/bin/bash

git config --global user.email "tunisienheni@gmail.com" && git config --global user.name "Fazzani"

git clone "https://${PAT}@github.com/Fazzani/webgrabplus-siteinipack.git" /siteinipack && \

find /config/siteini.pack -iname "*.ini" | while read i
do
  echo "Generating webgrab for updating channels.xml files => $i"
  sed -i 's/^*//' "$i"
done

chmod +x /defaults/update.sh && /defaults/update.sh

for i in /config/*.channels.xml;
do
 file=${i/\/config\//}
 echo "Searching for => $file"
 diff -iBbq $i /config/siteini.pack/International/bein.net.channels.xml && continue
 mv $i $(find /siteinipack/siteini.pack/ -iname $file -print)
done

cd /siteinipack && git status

git add --all && git commit -m "fixing channels indices" && git push

rm -rf /siteinipack

exit 0