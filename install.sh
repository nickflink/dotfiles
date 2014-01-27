#!/bin/bash
ROOTDIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${ROOTDIR}
echo "ln -sf ${ROOTDIR}/bin ${HOME}/bin"|bash -x
for dotfile in `git ls-files|grep "^\."|grep -v "^\.gitignore$"`; do
  echo "ln -sf ${ROOTDIR}/${dotfile} ${HOME}/${dotfile}"|bash -x
done
popd #${ROOTDIR}
