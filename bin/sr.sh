#!/bin/bash
if [ $# -ge 2 ]; then
  SRCH="$1";
  REPL="$2"
  FILE_EXT="*.$3"
  if [ "$FILE_EXT" == "" ]; then
    FILE_EXT="*"
  fi
  echo "# find . -type f -name \"$FILE_EXT\" -exec grep -l \"$SRCH\" {} +;";
  for i in `find . -type f -name "$FILE_EXT" -exec grep -l "$SRCH" {} +\;`; do
    echo "sed -i '' 's/$SRCH/$REPL/g' $i";
  done
else
  echo "sr.sh SRCH REPL [FILE_EXT]"
fi
