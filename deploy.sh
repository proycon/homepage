#!/bin/bash
#use custom hugo
export GOPATH=~/go
cp auth* public/
$GOPATH/bin/hugo && rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
