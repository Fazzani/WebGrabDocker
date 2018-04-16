# Webgrab++ Docker one shot

[![Build Status](https://travis-ci.org/Fazzani/WebGrabDocker.svg?branch=master)](https://travis-ci.org/Fazzani/WebGrabDocker)
[![Docker Stars](https://img.shields.io/docker/stars/_/ubuntu.svg)](https://registry.hub.docker.com/v2/repositories/synker/webgraboneshot/stars/count)

>WebGrab++ docker run one shot (the container run one and exit)
> Docker image: synker/webgraboneshot:latest

## Example

```sh
docker run -it --rm -v test:/config -v test/data:/data synker/webgraboneshot:latest
```

## TODO

- [ ] Add a custom script at the end (for example a script that compress data, push it to github repo and notify the final user)
