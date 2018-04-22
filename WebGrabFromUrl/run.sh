#!/bin/bash

cd /app/wg++/bin || exit
curl ${WEBGRAB_CONFIG_URL} --silent  --output /config2/WebGrab++.config.xml
mono WebGrab+Plus.exe  $1
exit 0
