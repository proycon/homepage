#!/bin/bash
if [ "$1" != "-n" ]; then
    zola build || exit 1
fi
cp auth* public/
cp key.asc public/
cp proycon.vcf public/
cp id_ed25519.pub public/
rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
