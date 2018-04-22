#!/bin/bash

cd /app/wg++/bin || exit
curl ${WEBGRAB_CONFIG_URL} --silent  --output /config2/WebGrab++.config.xml
if [[ DEBUG=1 ]]; then 
  ls /config2 && cat /config/WebGrab++.config.xml 
fi
mono WebGrab+Plus.exe  $1
exit 0
