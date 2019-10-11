#!/bin/bash
#use custom hugo
$GOPATH/bin/hugo && rsync -avz --delete public/ worker.anaproy.lxd:/home/www/proycon.anaproy.nl/html
exit $?
