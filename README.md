# Webgrab++ Docker one shot

[![Build Status](https://travis-ci.org/Fazzani/WebGrabDocker.svg?branch=master)](https://travis-ci.org/Fazzani/WebGrabDocker)
[![Docker Stars](https://img.shields.io/docker/stars/synker/webgraboneshot.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/synker/webgraboneshot.svg)][hub]

>WebGrab++ docker run one shot (the container run one and exit)
>[Docker image][hub]

## Example

```sh
# Get PGID and PUID
id $(whoami)
docker run -it --rm -v "$(pwd)/test/config.xml:/config/WebGrab++.config.xml" -v test:/data -e PGID=197609 -e PUID=197609 synker/webgraboneshot:latest
```

## TODO

- [ ] Add a custom script at the end (for example a script that compress data, push it to github repo and notify the final user)

[hub]:https://hub.docker.com/r/synker/webgraboneshot/