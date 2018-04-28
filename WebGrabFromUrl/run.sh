#!/bin/bash
set -e
cd /app/wg++/bin || exit
curl -fsSL ${WEBGRAB_CONFIG_URL} --output /config2/WebGrab++.config.xml || echo -e "Error while fetching webgrab config file"
if [[ "$DEBUG" = "1" ]]; then 
  ls /config2 && cat /config2/WebGrab++.config.xml 
fi
mono WebGrab+Plus.exe  $1

if [[ "$DEBUG" = "1" ]]; then 
  ls /data &&  ls /data | head -1 | cat
fi
exit 0
