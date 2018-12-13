#!/bin/bash

for i in $(find . -name "*.ini" -type f);
do
  echo "Generating webgrab for updating channels.xml files => $i"
  awk '/@auto_xml_channel_start/{flag=1;next}/@auto_xml_channel_end/{flag=0}flag' $i | sed 's/^.//' > $i.tmp
done

exit 0