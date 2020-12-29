#!/bin/bash
zola build || exit 1
cp auth* public/
cp key.asc public/
rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
