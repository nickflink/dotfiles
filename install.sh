#!/bin/bash
ROOTDIR="$( cd "$( dirname "$0" )" && pwd )"
pushd ${ROOTDIR}
function link_dotfile() {
    SRC="$1";
    DST="$2";
    TIME_STAMP="$3";
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
    BAK_CMD="cp ${DST} ${DST}.bak.$TIME_STAMP";
    LINK_CMD="ln -sf ${SRC} ${DST}";
    READ_LINK=`readlink ${DST}`
    if [ "${READ_LINK}" != "${SRC}" ]; then
        $BAK_CMD
        echo "[BAK] $BAK_CMD"
    fi
    $LINK_CMD
    SUCCESS=`ls -la ${DST} | grep -o ${SRC}`;
    if [ "${SUCCESS}" == "${SRC}" ]; then
        echo "[OK] ${LINK_CMD}";
    else
        echo "[KO] ${LINK_CMD}";
    fi
}

for dotfile in `git ls-files|grep -v -E "^(\.gitignore|install.sh)$"`; do
  TIME_STAMP=`date +"%s"`;
  link_dotfile ${ROOTDIR}/${dotfile} ${HOME}/${dotfile} $TIME_STAMP
done
popd #${ROOTDIR}
