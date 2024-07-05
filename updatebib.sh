#!/bin/bash
bib2xml proycon.bib | xml2ris > proycon.ris #requires bibutils
pandoc proycon.bib -t csljson -o proycon.bib.json
