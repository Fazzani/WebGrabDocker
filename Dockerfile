FROM lsiobase/xenial

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL maintainer="synker-team@synker.ovh" \
    description="WebGrab++ docker run one shot (the container run one and exit)" \
    system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker"
VOLUME ["/config","/data"]

# package versions
ARG WEBGRAB_VER="2.1.0"
ARG WGUPDATE_VER="2.1"

# environment variables.
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME /config

ENV PAT xxxxx
ENV TZ Europe/London
ENV DEBUG false
ENV FILE_NAME 2018.12.16_121300
ENV WEBGRAB_URL https://gist.githubusercontent.com/Fazzani/cce67905b458bae3eb5818adeffd2510/raw/WebGrab++.config.xml

RUN \
    echo "**** add mono repository ****" && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | tee /etc/apt/sources.list.d/mono-official.list && \
    echo "**** install packages ****" && \
    apt-get update && \
    apt-get install -y \
    cron \
    libmono-system-data4.0-cil \
    libmono-system-web4.0-cil \
    mono-runtime \
    nano \
    git \
    wget \
    unzip && \
    echo "**** install webgrabplus ****" && \
    WEBGRAB_BRANCH=${WEBGRAB_VER%.*} && \
    mkdir -p \
    /app/wg++ && \
    curl -o /tmp/wg++.tar.gz -L \
    "http://webgrabplus.com/sites/default/files/download/SW/V${WEBGRAB_VER}/WebGrabPlus_V${WEBGRAB_BRANCH}_install.tar.gz" && \
    tar xzf /tmp/wg++.tar.gz -C \
    /app/wg++ --strip-components=1 && \
    echo "**** download siteini.pack ****" && \
    curl -o \
    /tmp/ini.zip -L \
    http://webgrabplus.com/sites/default/files/download/ini/SiteIniPack_current.zip && \
    unzip -q /tmp/ini.zip -d /defaults/ini/ && \
    echo "**** cleanup ****" && \
    rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

# copy files
COPY root/ /
RUN [ -d /app/wg++/siteini.pack.update ] && \
    cp -rf /app/wg++/siteini.pack.update /app/wg++/siteini.pack
RUN cp -rf /app/wg++/bin /config

COPY updateChannels.sh /defaults
COPY run.sh /defaults
RUN chmod -R 777 /defaults && chmod -R +x /defaults/*.sh

ENTRYPOINT [ "/defaults/run.sh" ]
CMD ["/config"]