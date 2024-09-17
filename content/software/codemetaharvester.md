+++
title = "codemeta-harvester"
date = 2022-05-17T00:04:34+02:00
description = "Harvest and aggregate codemeta/schema.org software metadata from source repositories and service endpoints, automatically converting from known metadata schemes in the process "

[extra]
url_code = "https://github.com/proycon/codemeta-harvester"
+++

# Codemeta Harvester
 
This is a harvester for software metadata. It actively attempts to detect and
convert software metadata in source code repositories and converts this to a
unified [codemeta](https://codemeta.github.io) representation.
 
The tool is implemented as a simple POSIX shell script that in turn invokes a number of tools to
do the actual work:

* [codemetapy](https://github.com/proycon/codemetapy) - Conversion to codemeta from various other metadata formats
* [cffconvert](https://github.com/citation-file-format/cff-converter-python) - Conversion from CITATION.cff to codemeta

A few simple additional metadata extractions methods, as simple shell scripts, have been implemented alongside the main script.

This harvester can be used for two purposes:

1. to harvest a possibly large number of software projects, for instance to make them available in some kind of search portal.
2. as a means to produce a `codemeta.json` file for your own project

## Presentation

A presentation recorded presentation about the whole tool discovery pipeline, developed in the scope of the CLARIAH project, is available [here](https://video.anaproy.nl/w/tKbjBLjtNvLZ11TsL9YHdu).



