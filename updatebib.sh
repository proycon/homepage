#!/bin/bash
bib2xml proycon.bib | xml2ris > proycon.ris #requires bibutils
pandoc-citeproc --bib2json proycon.bib > proycon.bib.json #requires pandoc-citeproc
