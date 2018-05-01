FROM ubuntu:latest
LABEL maintainer="synker-team@synker.ovh" \
    description="Git in docker container with ssh" \
    system.dist="linux" system.arch="$arch" multi.name="docker git"

# Add git client
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
    curl \
    ca-certificates \
    git \
    openssh-client

RUN echo 'nameserver 8.8.8.8 nameserver 8.8.4.4' > /etc/resolv.conf