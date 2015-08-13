#!bin/bash
if [ 2 -ge $# ]; then
  SRCH="$1";
  REPL="$2"
  FILE_TYPE="$3"
  if [ "$FILE_TYPE" == "" ]; then
    FILE_TYPE="*"
  fi
  for i in `find . -type f -name "$FILETYPE" -exec grep -l "$SRCH" {} +\;`; do
    echo "sed -i '' 's/$SRCH/$REPL/g' $i";
  done
else
  echo "sr.sh SRCH REPL [FILE_TYPE]"
fi
