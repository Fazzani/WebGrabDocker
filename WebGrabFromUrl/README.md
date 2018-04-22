# Webgrab++ Docker one shot

[![Build Status](https://travis-ci.org/Fazzani/WebGrabDocker.svg?branch=master)](https://travis-ci.org/Fazzani/WebGrabDocker)
[![Docker Stars](https://img.shields.io/docker/stars/synker/webgraboneshoturl.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/synker/webgraboneshoturl.svg)][hub]

>WebGrab++ docker one shot run (the container run only once and exit)
>WebGrab++.Config.xml can be passed by the enviroment variable WEBGRAB_CONFIG_URL, as url
>[Docker image][hub]

## Building docker image command

```sh
docker build -t synker/webgraboneshoturl .
```

## Running docker container command example

```sh
docker run -it --rm -e https://raw.githubusercontent.com/Fazzani/xmltv/master/default.xmltv -v "$(pwd):/data" synker/webgraboneshoturl:latest

docker run -it --rm -v "$(pwd):/data" synker/webgraboneshoturl:latest

# create archive file from result
tar zcvf guide.tar.gz guide.xml
```

[hub]:https://hub.docker.com/r/synker/webgraboneshoturl/