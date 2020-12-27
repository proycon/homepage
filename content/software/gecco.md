+++
title = "Gecco"
date = 2015-01-21T00:04:34+01:00
summary = "Gecco is a generic modular and distributed framework for spelling correction. Aimed to build a complete context-aware spelling correction system given your own data set."
url_code = "https://github.com/proycon/gecco"
draft =false
+++

Gecco is a generic modular and distributed framework for spelling correction. Aimed to build a complete context-aware
spelling correction system given your own data set. Most modules will be language-independent and trainable from a
source corpus. Training is explicitly included in the framework. The framework aims to easily extendible, modules can be
written in Python 3. Moreover, the framework is scalable and can be distributed over multiple servers.

Given an input text, Gecco will add various suggestions for correction.

The system can be invoked from the command-line, as a Python binding, as a RESTful webservice, or through the web
application (two interfaces).
