+++
title = "Colibri Core"
date = 2013-09-15T00:04:34+01:00
description = "Colibri Core is software to quickly and efficiently count and extract patterns from large corpus data, to extract various statistics on the extracted patterns, and to compute relations between the extracted patterns. "

[extra]
url_project = "https://proycon.github.io/colibri-core"
url_code = "https://github.com/proycon/colibri-core"
url_slides = "https://proycon.anaproy.nl/pubs/colibri_pres_201409.pdf"
url_pdf = "https://openresearchsoftware.metajnl.com/articles/10.5334/jors.105/"
+++

# Colibri Core

Colibri Core is software to quickly and efficiently count and extract patterns
from large corpus data, to extract various statistics on the extracted
patterns, and to compute relations between the extracted patterns. The employed
notion of pattern or construction encompasses the following categories:

* **n-gram** -- *n* consecutive words
* **skipgram** -- An abstract pattern of predetermined length with one or multiple gaps (of specific size).
* **flexgram** -- An abstract pattern with one or more gaps of variable-size.

N-gram extraction may seem fairly trivial at first, with a few lines in your
favourite scripting language, you can move a simple sliding window of size **n**
over your corpus and store the results in some kind of hashmap. This trivial
approach however makes an unnecessarily high demand on memory resources, this
often becomes prohibitive if unleashed on large corpora. Colibri Core tries to
minimise these space requirements in several ways:

* **Compressed binary representation** -- Each word type is assigned a numeric class, which is encoded in a compact binary format in which highly frequent classes take less space than less frequent classes. Colibri core always uses this representation rather than a full string representation, both on disk and in memory.
* **Informed iterative counting** -- Counting is performed more intelligently by iteratively processing the corpus in several passes and quickly discarding patterns that won't reach the desired occurrence threshold.

Skipgram and flexgram extraction are computationally more demanding but have
been implemented with similar optimisations. Skipgrams are computed by
abstracting over n-grams, and flexgrams in turn are computed either by
abstracting over skipgrams, or directly from n-grams on the basis of
co-occurrence information (mutual pointwise information).

At the heart of the sofware is the notion of pattern models. The core tool, to
be used from the command-line, is ``colibri-patternmodeller`` which enables you
to build pattern models, generate statistical reports, query for specific
patterns and relations, and manipulate models.

A pattern model is simply a collection of extracted patterns (any of the three
categories) and their counts from a specific corpus. Pattern models come in two
varieties:

* **Unindexed Pattern Model** -- The simplest form, which simply stores the patterns and their count.
* **Indexed Pattern Model** -- The more informed form, which retains all indices to the original corpus, at the cost of more memory/diskspace.

The Indexed Pattern Model is much more powerful, and allows more statistics and
relations to be inferred.

The generation of pattern models is optionally parametrised by a minimum
occurrence threshold, a maximum pattern length, and a lower-boundary on the
different types that may instantiate a skipgram (i.e. possible fillings of the
gaps).

## Technical Details

Colibri Core is available as a collection of **standalone command-line tools**,
as a **C++ library**, and as a **Python library**.

Please consult the full documentation at https://proycon.github.io/colibri-core

Installation instructions are here:  https://proycon.github.io/colibri-core/doc/#installation

## Demo

![Colibri Core Demo](https://raw.githubusercontent.com/CLARIAH/wp3-demos/master/colibri-core.gif)


## Publication

This software is extensively described in the following peer-reviewed publication:

 van Gompel, M and van den Bosch, A (2016)
 Efficient n-gram, Skipgram and Flexgram Modelling with Colibri Core.
 *Journal of Open Research Software*
 4: e30, DOI: http://dx.doi.org/10.5334/jors.105

Click the link to access the publication and please cite it if you make use of
Colibri Core in your work.



