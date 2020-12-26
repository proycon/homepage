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
if [ -z "$BASEDIR" ]; then
    BASEDIR=$(pwd)
fi
EXTENSION="${1##*.}"
EXTENSION="${EXTENSION,,}" #lowercase
if [ ! -z "$3" ]; then
    DATEPREFIX="$3:-"
elif [[ "$EXTENSION" == "jpg" ]] || [[ "$EXTENSION" == "jpeg" ]]; then
    #Get date from EXIF
    DATEPREFIX=$(identify -verbose "$1" | grep --color=never "date:create" | awk '{ print substr($2,1,10); }')
    if [ -z "$DATEPREFIX" ]; then
        DATEPREFIX=$(date "+%Y-%m-%d:-")
    else
        DATEPREFIX="${DATEPREFIX}:-"
    fi
else
    DATEPREFIX=$(date "+%Y-%m-%d:-")
fi
CAPTION="$DATEPREFIX$2"
CAPTION="${CAPTION// /-}"
OLDDIR=$(pwd)
if [[ "$EXTENSION" == "jpg" ]] || [[ "$EXTENSION" == "jpeg" ]]; then
    cp "$1" /tmp/img.jpg
    case `jpegexiforient -n "/tmp/img.jpg"` in
      1) transform="";;
      2) transform="-flip horizontal";;
      3) transform="-rotate 180";;
      4) transform="-flip vertical";;
      5) transform="-transpose";;
      6) transform="-rotate 90";;
      7) transform="-transverse";;
      8) transform="-rotate 270";;
      *) transform="";;
    esac

    if test -n "$transform"; then
      echo Executing: jpegtran -copy all $transform /tmp/img.jpg >&2
      jpegtran -copy all $transform "/tmp/img.jpg" > /tmp/img2.jpg
      if test $? -ne 0; then
        echo Error while transforming - skipped. >&2
      else
        jpegexiforient -1 "/tmp/img2.jpg" > /dev/null
      fi
    else
        mv -f /tmp/img.jpg /tmp/img2.jpg
    fi
    cp /tmp/img2.jpg $BASEDIR/static/img/photos/$CAPTION.$EXTENSION
else
    cp $1 $BASEDIR/static/img/photos/$CAPTION.$EXTENSION
fi
cd $BASEDIR/static/img/photos
../makethumbnails.sh $EXTENSION
git add *.$EXTENSION
git commit
ret=$?
if [ $ret -eq 0 ]; then
    cd $BASEDIR
    ./deploy.sh
fi
cd $OLDDIR

