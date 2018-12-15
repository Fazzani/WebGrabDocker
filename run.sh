#!/bin/bash

cp -rf /defaults/ini/siteini.pack/ /config/

cd /app/wg++/bin || exit

mono WebGrab+Plus.exe  $1

exit 0
