#!/bin/bash

DB='mysql -A -h slavedb'

if [ -n "$1" ]
then
    CONF_FILE=$1
  else
      echo -e "error: usage: $0 <page_id>\n"
        exit 1
      fi

      # assumes my .bashrc...
      $DB --skip-column-names -f < <(echo "use bizeebe; select access_token from fb_objects where fb_object_id=$1 and oauth_is_valid=1 limit 1;")
