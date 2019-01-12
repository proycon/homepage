#!/bin/bash
ext=$1
for f in *.$ext; do
    if [ -e "$f" ] && [[ "$f" != *"_thumb"* ]] && [ ! -e "${f%.$ext}_thumb.jpg" ]; then
        echo $f;
        convert -thumbnail 200 $f ${f%.$ext}_thumb.jpg
    fi
done

