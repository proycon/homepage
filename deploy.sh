#!/bin/bash
if [ "$1" != "-n" ]; then
    zola build || exit 1
fi
cp auth* public/
cp key.asc public/
rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
