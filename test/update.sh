#!/bin/bash

cd /app/wg++/bin || exit

ls /config
ls /defaults/ini/

mono WebGrab+Plus.exe  "/config"

exit 0
