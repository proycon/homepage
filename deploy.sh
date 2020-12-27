#!/bin/bash
#use custom hugo
export GOPATH=$(pwd)/go
cp auth* public/
cp key.asc public/
$GOPATH/bin/hugo && rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
