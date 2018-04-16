FROM linuxserver/webgrabplus
LABEL maintainer="synker-team@synker.ovh" \
      description="WebGrab++ docker run one shot (the container run one and exit)" \
      system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker"
RUN chmod -R 777 /defaults
RUN cp /defaults/WebGrab++.config.xml /config/
RUN cp -R /defaults/ini/siteini.pack /config/
RUN ls /config/
RUN cat << "EOF"  > /config/WebGrab++.config.xml \
<settings> \
    <!-- for detailed info about the settings see http://webgrabplus.com/documentation/configuration/webgrabconfigxml --> \
    <filename>/data/guide.xml</filename> \
    <mode></mode> \
    <postprocess grab="y" run="n">mdb</postprocess> \
    <user-agent>Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0</user-agent> \
    <logging>on</logging> \
    <retry time-out="5">4</retry> \
    <timespan>8</timespan> \
    <update>i</update> \
    <channel update="i" site="bein.net" site_id="mena_sports/News_ar" xmltv_id="News_ar">News_ar</channel> \
    <channel update="i" site="bein.net" site_id="mena_sports/HD1" xmltv_id="HD1">HD1</channel> \
</settings> \
EOF 
ENTRYPOINT [ "/defaults/update.sh" ]