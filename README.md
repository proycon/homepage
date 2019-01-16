
## Run development server

``$ hugo server -D``

## Deploy

``$ ./deploy.sh``

## Update submodules

``$ git submodule update --init --recursive``

## Update publications


``$ pip install academic``

``$ academic import  --bibtex proycon.bib --overwrite``

## Add photo

``$ ./addphoto.sh $photo "caption"``
