#!/bin/bash
set -e
cd /app/wg++/bin || exit
curl -fsSL ${WEBGRAB_CONFIG_URL} --output /config2/WebGrab++.config.xml || echo -e "Error while fetching webgrab config file"
if [[ "$DEBUG" = "1" ]]; then 
  ls /config2 && cat /config2/WebGrab++.config.xml 
fi
mono WebGrab+Plus.exe  $1
sudo wget https://api.pushover.net/1/messages.json --post-data="token=a1zc9d81aw14ezws414n7uvsnz2xio&user=uxepp2gjx5ch4eveufj8fo8jmcm6we&device=sm-g935f&title=WebGrabber+message&message=$1."  -qO-  > /dev/null 2>>4 &

if [[ "$DEBUG" = "1" ]]; then 
  ls /data &&  ls /data | head -1 | cat
fi
exit 0
