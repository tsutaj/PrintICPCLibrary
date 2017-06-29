#!/bin/bash

if [ $# -ne 3 ]; then
  echo "usage: bash generate.sh <filepath> <texfilename> <pagetitle>"
  exit 1
fi

TEXFNAME=$2
PAGETITLE="\\\\title{$3}"

SCRIPTDIR=$(dirname $0)
PATHSTR="${1}/*.cpp"
TEXFSTR="${SCRIPTDIR}/${2}.tex"

sed "s/\\\\title{}/${PAGETITLE}/" $SCRIPTDIR/tex_head.txt >> $TEXFSTR

for file in `\find $PATHSTR -maxdepth 1 -type f`; do
    FILENAME="${file##*/}"
    FILESTR=`echo "\subsection*{${FILENAME}}" | sed 's/_/\\\\_/g'`
    echo $FILESTR >> $TEXFSTR
    cat $SCRIPTDIR/tex_code_head.txt $file $SCRIPTDIR/tex_code_tail.txt >> $TEXFSTR
done

cat $SCRIPTDIR/tex_tail.txt >> $TEXFSTR

platex -output-directory=$SCRIPTDIR $TEXFSTR
dvipdfmx -o $SCRIPTDIR/$TEXFNAME.pdf $SCRIPTDIR/$TEXFNAME.dvi

for ext in aux dvi tex log; do
    rm $SCRIPTDIR/$TEXFNAME.$ext
done