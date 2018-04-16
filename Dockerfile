FROM linuxserver/webgrabplus
LABEL maintainer="synker-team@synker.ovh" \
      description="WebGrab++ docker run one shot (the container run one and exit)" \
      system.dist="linux" system.arch="$arch" multi.name="WebGrab++docker"
RUN chmod -R 777 /defaults
COPY /defaults/WebGrab++.config.xml /config/
COPY cp -R /defaults/ini/siteini.pack /config/
RUN  ls /config
RUN echo $'<settings> \n\
    <!-- for detailed info about the settings see http://webgrabplus.com/documentation/configuration/webgrabconfigxml --> \n\
    <filename>/data/guide.xml</filename> \n\
    <mode>m</mode> \n\
    <postprocess grab="y" run="n">mdb</postprocess> \n\
    <user-agent>Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0</user-agent> \n\
    <logging>on</logging> \n\
    <retry time-out="5">4</retry> \n\
    <timespan>8</timespan> \n\
    <update>i</update> \n\
    <channel update="i" site="bein.net" site_id="mena_sports/News_ar" xmltv_id="News_ar">News_ar</channel> \n\
    <channel update="i" site="bein.net" site_id="mena_sports/HD1" xmltv_id="HD1">HD1</channel> \n\
</settings>\n' > /config/WebGrab++.config.xml 

ENTRYPOINT [ "/defaults/update.sh" ]