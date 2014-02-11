#!/bin/bash
ROOTDIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${ROOTDIR}
function link_dotfile() {
    SRC="$1";
    DST="$2";
    LINK_CMD="ln -sf ${SRC} ${DST}";
    $LINK_CMD
    SUCCESS=`ls -la ${DST} | grep -o ${SRC}`;
    if [ "${SUCCESS}" == "${SRC}" ]; then
        echo "[OK] ${LINK_CMD}";
    else
        echo "[KO] ${LINK_CMD}";
    fi
}

link_dotfile ${ROOTDIR}/bin ${HOME}/bin
for dotfile in `git ls-files|grep "^\."|grep -v "^\.gitignore$"`; do
  link_dotfile ${ROOTDIR}/${dotfile} ${HOME}/${dotfile}
done
popd #${ROOTDIR}
