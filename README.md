
## Run development server

``$ $GOPATH/bin/hugo server -D``

## Versions

using hugo v0.53 and hugo-academic v3.3
(older versions may to break things!)

## Deploy

``$ ./deploy.sh``

## Update submodules

``$ git submodule update --init --recursive``

## Update publications


``$ pip install academic``

``$ academic import  --bibtex proycon.bib --overwrite``

## Add photo

``$ ./addphoto.sh $photo "caption"``
