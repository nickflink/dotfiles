#!/bin/bash
ant generate-classmap
ant generate-rewmap
ant deploy-alpha -Dservers.uselists=true -Dservers.list=/srv/config/alfa_release_server_list -Dalpha.number=release -Dservers.statics=/srv/config/estaticos_list -Dtranslation-tag=release
rsync_custom.php build alpharelease /srv/config/development_server_list < ~/yes_file;
rsync_custom.php build alpharelease /srv/config/alfa_release_server_list < ~/yes_file
