#!/bin/bash
GITCMD="$@"
git submodule foreach git $GITCMD
echo "Entering '`pwd`'"
git $GITCMD
