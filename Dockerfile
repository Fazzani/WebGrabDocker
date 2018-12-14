FROM linuxserver/webgrabplus
LABEL maintainer="synker-team@synker.ovh" \
      description="WebGrab++ docker run one shot (the container run one and exit)" \
      system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker"
VOLUME ["/config","/data"]
ENV PAT xxxxx
RUN apt update -y && apt install -yy nano git
COPY updateChannels.sh /defaults
RUN chmod -R 777 /defaults && chmod -R +x /defaults/*.sh
ENTRYPOINT [ "/defaults/update.sh" ]
CMD ["/config"]