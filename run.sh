#!/bin/bash

if [[ "${DEBUG:-false}" == false ]]; then
   git clone "https://Fazzani:${PAT}@github.com/Fazzani/webgrabplus-siteinipack.git" /siteinipack && \
   cp -rf /siteinipack/siteini.pack/ $1
fi

cd /app/wg++/bin || exit

mono WebGrab+Plus.exe $1

echo "TZ: $TZ"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo $DATE

if [[ -f "${1}/WebGrab++.log.txt" ]]; then
  cat "${1}/WebGrab++.log.txt"
fi

exit 0