#!/bin/bash

if [ $# -ne 3 ]; then
  echo "usage: bash generate.sh [<filepath>] [<texfilename>] [<pagetitle>]"
  exit 1
fi

FILEPATH=$1
TEXFNAME=$2
PAGETITLE="\\title{$3}"

PATHSTR="${1}*.cpp"
TEXFSTR="${2}.tex"
echo $PATHSTR

sed -i "33c\\\\${PAGETITLE}" tex_head.txt
cat tex_head.txt >> $TEXFSTR

for file in `\find $PATHSTR -maxdepth 1 -type f`; do
    FILENAME="${file##*/}"
    FILESTR=`echo "\subsection*{${FILENAME}}" | sed 's/_/\\\\_/g'`
    echo $FILESTR
    echo $FILESTR >> $TEXFSTR
    cat tex_code_head.txt >> $TEXFSTR
    cat $file >> $TEXFSTR
    cat tex_code_tail.txt >> $TEXFSTR
done

cat tex_tail.txt >> $TEXFSTR

platex $TEXFSTR
dvipdfmx "${TEXFNAME}.dvi"

rm "${TEXFNAME}.aux"
rm "${TEXFNAME}.dvi"
rm "${TEXFNAME}.tex"
rm "${TEXFNAME}.log"