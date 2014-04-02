#!/bin/bash
ROOTDIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${ROOTDIR}
function link_dotfile() {
    SRC="$1";
    DST="$2";
    DSTDIR="`dirname $DST`"
    #echo "SRC=$SRC"
    #echo "DST=$DST"
    #echo "DSTDIR=$DSTDIR"
    if [ ! -d $DSTDIR ]; then
        echo "need to create $DSTDIR"
        MKDIR_CMD="mkdir -p ${DSTDIR}";
        mkdir -p $DSTDIR
        if [ -d $DSTDIR ]; then
            echo "[OK] ${MKDIR_CMD}";
        else
            echo "[KO] ${MKDIR_CMD}";
        fi
    fi
    LINK_CMD="ln -sf ${SRC} ${DST}";
    $LINK_CMD
    SUCCESS=`ls -la ${DST} | grep -o ${SRC}`;
    if [ "${SUCCESS}" == "${SRC}" ]; then
        echo "[OK] ${LINK_CMD}";
    else
        echo "[KO] ${LINK_CMD}";
    fi
}

for dotfile in `git ls-files|grep -v -E "^(\.gitignore|install.sh)$"`; do
  link_dotfile ${ROOTDIR}/${dotfile} ${HOME}/${dotfile}
done
popd #${ROOTDIR}
