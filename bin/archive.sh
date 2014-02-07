#!/bin/bash
LOGFILE="lc.txt"
if [ -n "$1" ]; then
  LOGFILE="$1"
fi
mv $LOGFILE ar_`date +"%Y_%m_%d_%H_%M_%S"`.txt
