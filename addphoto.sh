#!/bin/bash

if [ ! -e "$1" ]; then
    echo "Expected file" >&2;
    exit 2
fi

if [ -z "$2" ]; then
    echo "Caption required" >&2;
    exit 2
fi

BASEDIR=$(dirname $0)
DATEPREFIX=$(date "+%Y-%m-%d:-")
CAPTION="$DATEPREFIX$2"
CAPTION="${CAPTION// /-}"
EXTENSION="${1##*.}"
cp $1 $BASEDIR/static/img/photos/$CAPTION.$EXTENSION
cd $BASEDIR/static/img/photos
../makethumbnails.sh $EXTENSION
git add *.$EXTENSION
git commit
cd -
