---
title: "CLAM"
date: 2010-03-21T00:04:34+01:00
summary: "Quickly turn command-line applications into RESTful webservices with a web-application front-end. You provide a specification of your command line application, its input, output and parameters, and CLAM wraps around your application to form a fully fledged RESTful webservice."
url_project: "https://proycon.github.io/clam"
url_code: "https://github.com/proycon/clam"
url_poster: "https://anaproy.nl/proycon/clam_poster2.pdf"
draft: false
---

CLAM allows you to quickly and transparently transform your application into a RESTful
webservice, with which both human end-users as well as automated clients can interact. CLAM takes a description of your
system and wraps itself around the system, allowing end-users or automated clients to upload input files to your
application, start your application with specific parameters of their choice, and download and view the output of the
application once it is completed.

CLAM is set up in a universal fashion, requiring minimal effort on the part of the service developer. Your actual NLP
application is treated as a black box, of which only the parameters, input formats and output formats need to be
described. Your application itself needs not be network aware in any way, nor aware of CLAM, and the handling and
validation of input can be taken care of by CLAM.

CLAM is entirely written in Python, runs on UNIX-derived systems, and is available as open source under the GNU Public
License (v3). It is set up in a modular fashion, and offers an API, and as such is easily extendable. CLAM communicates
in a transparent XML format, and using XSL transformation offers a full web 2.0 web-interface for human end users.

