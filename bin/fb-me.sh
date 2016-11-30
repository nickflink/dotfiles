#!/bin/bash

DB='mysql -A -h slavedb'

# assumes my .bashrc...
$DB --skip-column-names -f < <(echo "use bizeebe; select profile_access_token from fb_objects where fb_object_id=537208670 and oauth_is_valid=1 limit 1;")
