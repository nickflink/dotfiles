REMOTE_PATH="$1"
while :; do
  OUT=`hg out $REMOTE_PATH -l1`
  REV=`echo "$OUT"|grep ^changeset|awk '{gsub(":"," ");print $3}'`;
  if ["$REV" == ""]; then
    break;
  else
    echo "$OUT"
    echo "hg strip $REV;"|bash -x
  fi
done
