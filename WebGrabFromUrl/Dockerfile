FROM linuxserver/webgrabplus
ENV WEBGRAB_CONFIG_URL https://raw.githubusercontent.com/Fazzani/xmltv/master/default.xml
ENV DEBUG 0
LABEL maintainer="synker-team@synker.ovh" \
      description="WebGrab++ docker run one shot (the container run one and exit). Volumes was replaced by url. So WebGrab++.config.xml will have Url as source." \
      system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker++url"
VOLUME /data
VOLUME /config2
COPY run.sh /defaults
RUN chmod -R 777 /defaults
RUN chmod -R 777 /config2
RUN cp -R /defaults/ini/siteini.pack /config2/
ENTRYPOINT [ "/defaults/run.sh" ]
CMD [ "/config2" ]