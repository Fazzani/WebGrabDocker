FROM linuxserver/webgrabplus
LABEL maintainer="synker-team@synker.ovh" \
      description="WebGrab++ docker run one shot (the container run one and exit)" \
      system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker"
VOLUME ["/config","/data"]
ENV PAT xxxxx
ENV TZ Europe/London
ENV DEBUG false
ENV FILE_NAME 2018.12.16_121300
ENV WEBGRAB_URL https://gist.githubusercontent.com/Fazzani/cce67905b458bae3eb5818adeffd2510/raw/WebGrab++.config.xml
RUN apt update -y && apt install -yy nano git
COPY updateChannels.sh /defaults
COPY run.sh /defaults
RUN chmod -R 777 /defaults && chmod -R +x /defaults/*.sh
ENTRYPOINT [ "/defaults/run.sh" ]
CMD ["/config"]