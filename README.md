# Webgrab++ Docker one shot

[![Build Status](https://travis-ci.org/Fazzani/WebGrabDocker.svg?branch=master)](https://travis-ci.org/Fazzani/WebGrabDocker)
[![Docker Stars](https://img.shields.io/docker/stars/synker/webgraboneshot.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/synker/webgraboneshot.svg)][hub]

>WebGrab++ docker one shot run (the container run only once and exit)
>[Docker image][hub]

## Example

```sh
# Get PGID and PUID
id $(whoami)
docker run -it --rm -v "$(pwd)/test/config.xml:/config2/WebGrab++.config.xml" \
-v "$(pwd):/data" synker/webgraboneshot:latest

# create archive file from result
tar zcvf guide.tar.gz guide.xml
```

[hub]:https://hub.docker.com/r/synker/webgraboneshot/