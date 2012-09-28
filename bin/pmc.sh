#!/bin/bash
#would be cool if this worked from other config locations
echo "running the following commands..."
echo "pushd /home/release/configuration/"
echo "hg pull ~/configuration/ -u"
echo "/home/release/bin/update_configuration -H"
echo "popd"

pushd /home/release/configuration/;hg pull ~/configuration/ -u;/home/release/bin/update_configuration -H;popd
