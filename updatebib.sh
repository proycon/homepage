#!/bin/bash
source env/bin/activate || exit 2
academic import  --bibtex proycon.bib --overwrite
bib2xml proycon.bib | xml2ris > proycon.ris #requires bibutils
git add content/publication/*
git commit -a
