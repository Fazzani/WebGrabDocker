#!/bin/bash

if [[ "${DEBUG:-false}" == false ]]; then
   git clone "https://Fazzani:${PAT}@github.com/Fazzani/webgrabplus-siteinipack.git" /siteinipack && \
   cp -rf /siteinipack/siteini.pack/ $1
fi

cd /app/wg++/bin || exit

mono WebGrab+Plus.exe $1

if [[ "${DEBUG:-false}" == true ]]; then
  echo "TZ: $TZ"
  date
  ls
  cat "${1}/WebGrab++.log.txt"
fi

exit 0