+++
title = "Efficiently modelling n-grams, skipgrams and flexgrams from large corpora with Colibri Core"
date = 2014-03-31T00:04:34+01:00
draft =true
+++

In this first actual blog post (yes, it was long overdue, I know) I would like to introduce open-source Natural Language Processing software I developed in the scope of my PhD research at Radboud University Nijmegen: Colibri Core.

## Introduction

Colibri Core is software to quickly and efficiently count and extract patterns from large corpus data, to extract various statistics on the extracted patterns, and to compute relations between the extracted patterns. The employed notion of pattern or construction encompasses the following categories:

* **n-gram** -- *n* consecutive words
* **skipgram** -- An abstract pattern of predetermined length with one or multiple gaps (of specific size).
* **flexgram** -- An abstract pattern without predetermined length, with one or more gaps.

N-gram extraction may seem fairly trivial at first, with a few lines in your favourite scripting language, you can move a simple sliding window of size n over your corpus and store the results in some kind of hashmap. This trivial approach however makes an unnecessarily high demand on memory resources, this often becomes prohibitive if unleashed on large corpora. Colibri Core tries to minimise these space requirements in several ways:

* **Binary representation** -- Each word type is assigned a numeric class, which is encoded in a compact binary format in which highly frequent classes take less space than less frequent classes. Colibri core always uses this representation rather than a full string representation, both on disk and in memory.
* **Informed counting** -- Counting is performed more intelligently by iteratively processing the corpus in several passes and quickly discarding patterns that won't reach the desired occurrence threshold.

Skipgram and flexgram extraction are computationally more demanding but have been implemented with similar optimisations. Skipgrams are computed by abstracting over n-grams, and flexgrams in turn are computed either by abstracting over skipgrams, or directly from n-grams on the basis of co-occurrence information (mutual pointwise information).

## Pattern Models

At the heart of the sofware is the notion of pattern models. The core tool, to be used from the command-line, is colibri-patternmodeller which enables you to build pattern models, generate statistical reports, query for specific patterns and relations, and manipulate models.

A pattern model is simply a collection of extracted patterns (any of the three categories) and their counts from a specific corpus. Pattern models come in two varieties:

* **Unindexed Pattern Model** -- The simplest form, which simply stores the patterns and their count.
* **Indexed Pattern Model** -- The more informed form, which retains all indices to the original corpus, at the cost of more memory/diskspace.

The Indexed Pattern Model is much more powerful, and allows more statistics and relations to be inferred.

The generation of pattern models is optionally parametrised by a minimum occurrence threshold, a maximum pattern length, and a lower-boundary on the different types that may instantiate a skipgram (i.e. possible fillings of the gaps).

### Statistics

The statistics that are reported on are:

* Occurrence count -- The absolute number of times a pattern occurs
* Tokens covered -- The absolute number of tokens in the corpus that a pattern covers. Computed as occurrencecount * n.
* Coverage -- The number of covered tokens, as a fraction of the total number of tokens in the original corpus.
* Frequency -- The frequency of the pattern within its category and size class, so for an ngram of size two, the frequency indicates the frequency amongst all bigrams.
* Types -- The number of unique word types covered.

These can be reported afer querying for specific patterns, or for groups (e.g. all bigrams). For unindexed models, coverage computation is a mere approximation. An example output report of a small pattern model from a tiny toy corpus is shown below:

```
REPORT
----------------------------------
                            PATTERNS    TOKENS  COVERAGE     TYPES
Total:                             -       340         -       177
Uncovered:                         -       175    0.5147       136
Covered:                          69       165    0.4853        41

  CATEGORY N (SIZE)   PATTERNS    TOKENS  COVERAGE     TYPES OCCURRENCES
       all       all        69       165    0.4853        41         243
       all         1        40       165    0.4853        40         165
       all         2        11        26    0.0765        13          26
       all         3         7        17    0.0500         9          19
       all         4         5        10    0.0294         9          14
       all         5         5         9    0.0265         9          17
       all         6         1         2    0.0059         6           2
    n-gram       all        62       165    0.4853        40         215
    n-gram         1        40       165    0.4853        40         165
    n-gram         2        11        26    0.0765        13          26
    n-gram         3         5        12    0.0353         8          12
    n-gram         4         3         6    0.0176         6           6
    n-gram         5         2         4    0.0118         6           4
    n-gram         6         1         2    0.0059         6           2
  skipgram       all         7         7    0.0206         6          28
  skipgram         3         2         7    0.0206         4           7
  skipgram         4         2         4    0.0118         4           8
  skipgram         5         3         5    0.0147         5          13
```

Additionally, histograms can be generated and co-occurrence data between patterns can be shown, which is computed using normalised pointwise mutual information.

### Relations

Various relations can be extracted from patterns in an indexed pattern model:

* **Subsumption relations** -- Patterns that are subsumed by larger patterns are called subsumption children, the larger patterns are called subsumption parents. These are the two subsumption relations that can be extracted from an indexed pattern model.
* **Successor relations** -- Patterns that follow eachother are in a left-of/right-of relation.
* **Instantiation relations** -- There is a relation between skipgrams and patterns that instantiate them: to be {*1*} not {*1*} be is instantiated by to {*1*} or.

A web-based tool is available that allows these relations to be visualised and navigated interactively.

### Manipulating models

Models can be actively manipulated by filtering and intersecting them with other models. They can moreover be manipulated at a more finegrained level from Python scripts using the available Python binding.

A very common application of intersecting models is when a first pattern model is generated on a training corpus, and subsequently a second model is generated on test data, but constrained using the training model. This results in a model that contains only all patterns occurring both in training and test data, the coverage metric of such a model thus provides a rough measure of overlap between corpora.

## Implementation

Colibri Core is entirely implemented in C++, to ensure efficiency with regard to speed and memory. A full Python binding, directly interfacing with the native code, is available, allowing you to load, query and manipulate Pattern Models from Python scripts (version 3 is supported).

The software offers a powerful command-line tool, designed for Unix-based systems such as Linux.

### Download & Documentation

Everything is open-source (GPLv3) and can be obtained from: http://github.com/proycon/colibri-core

Documentation is available from http://proycon.github.io/colibri-core/doc/ , which documents installation, usage as well as the Python API. A Python Tutorial is also available, in the form of an ipython notebook (included in the colibri-core source), a read-only version can be found here: http://proycon.github.io/colibri-core/doc/colibricore-python-tutorial.html

### Under the hood

The API of Colibri Core offers an ideal foundation for building NLP software that works on large numbers of patterns, and which seeks to constrain memory usage and attaining high-performance.

In addition to offering a base class that holds a pattern, Colibri Core offers a variety of containers (for C++ programmers; these behave like C++11 STL containers) for storing patterns. The current storage backends are based on hashmaps or ordered maps, but additional storage backends are envisioned for the future, such as prefix tries/suffix tries or suffix arrays.

A schematic overview of the Colibri Core architecture is available below, consult the documentation at https://proycon.github.io/colibri-core/doc/ for more details.

![Image: Schematic overview of colibri core](https://proycon.github.io/colibri-core/doc/images/arch.png)
