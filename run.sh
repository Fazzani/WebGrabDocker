#!/bin/bash

if [ [ "$DEBUG" == false] ]; then
   git clone "https://Fazzani:${PAT}@github.com/Fazzani/webgrabplus-siteinipack.git" /siteinipack && \
   cp -rf /siteinipack/siteini.pack/ $1
fi

cd /app/wg++/bin || exit

mono WebGrab+Plus.exe $1

exit 0