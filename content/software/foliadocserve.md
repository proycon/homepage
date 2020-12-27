+++
title = "foliadocserve"
date = 2015-02-08T00:04:34+01:00
summary = "FoLiA Document Server - HTTP webservice backend for serving and annotating FoLiA documents using the FoLiA Query Language (FQL). Used by FLAT. "
url_code = "https://github.com/proycon/foliadocserve"
draft =false
+++

# FoLiA Document Server

The FoLiA Document Server is a backend HTTP service to interact with documents
in the FoLiA format, a rich XML-based format for linguistic annotation
(http://proycon.github.io/folia). It provides an interface to efficiently edit
FoLiA documents through the FoLiA Query Language (FQL).  However, it is not
designed as a multi-document search tool.

The FoLiA Document server is used by FLAT (https://github.com/proycon/flat)

The FoLiA Document Server is written in Python 3, using the FoLiA library in
pynlpl and cherrypy.


## Architecture

The FoLiA Document Server consists of a document store that groups documents
into namespaces, a namespace can correspond for instance to a user ID or a
project.

Documents are automatically loaded and unloaded as they are requested and
expire. Loaded documents are kept in memory fully to facilitate rapid access
and are serialised back to XML files on disk when unloaded.

The document server is a webservice that receives requests over HTTP. Requests
interacting with a FoLiA document consist of statements in FoLiA Query Language
(FQL). For some uses the Corpus Query Language (CQL) is also supported.
Responses are FoLiA XML or parsed into JSON (may contain HTML excerpts too), as
requested in the FQL queries themselves.

Features:

* webservice
* queries using FQL,  or alternatively CQL (limited)
* multiple return formats (FoLiA XML, JSON, FLAT)
* versioning control support using git
* full support for corrections, alternatives!
* support for concurrency

Note that this webservice is *NOT* intended to be publicly exposed, but rather
to be used as a back-end by another system. The document server does support
constraining namespaces to certain session ids, constraining FQL queries to not
violate their namespace, and constraining uploads by session id or namespace.
This is secure for public exposure only when explicitly enabled and used over
HTTPS.

If you are looking for a command line tool that interprets FQL/CQL and queries
FoLiA documents, use the ``foliaquery`` tool from the FoLiA-tools package
rather than this document server, see https://github.com/proycon/folia
