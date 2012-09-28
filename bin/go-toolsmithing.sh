#!/bin/bash
if [ -d $HOME -a -d $HOME/tuenti_tools ];then
	echo "PATH=\"$HOME/tuenti_tools/bin:$HOME/tuenti_tools/mercurial/bin:$HOME/tuenti_tools/mercurial/tu-hg-workbench/bin:$HOME/tuenti_tools/bin-dev:/home/release/rm/tools:$PATH\""
	echo "TUENTI_TOOLS_PATH=\"$HOME/tuenti_tools\""
	echo "export PATH"
	echo "export TUENTI_TOOLS_PATH"
else
	echo "you are missing a checkout of tuenti tools, please clone"
	echo "hg clone ssh://code.tuenti.com//srv/hg/devtools/tuenti_tools"
fi
