+++
title = "Analiticcl"
date = 2021-09-25T00:04:34+02:00
description = "An approximate string matching or fuzzy-matching system for spelling correction, normalisation or post-OCR correction "

[extra]
url_project = "https://github.com/proycon/analiticcl"
url_code = "https://github.com/proycon/analiticcl"
+++

# Analiticcl

Analiticcl is an approximate string matching or fuzzy-matching system that can
be used for spelling correction or text normalisation (such as post-OCR
correction or post-HTR correction). Texts can be checked against a validated or
corpus-derived lexicon (with or without frequency information) and spelling
variants will be returned.

The distinguishing feature of the system is the usage of anagram hashing to
drastically reduce the search space and make quick lookups possible even over
larger edit distances. The underlying idea is largely derived from prior work
TICCL (Reynaert 2010; Reynaert 2004), which was implemented in
[ticcltools](https://github.com/languagemachines/ticcltools). This analiticcl
implementation attempts to re-implement the core of these ideas from scratch,
but also introduces some novelties, such as the introduction of prime factors
for improved anagram hashing. We aim at a high-performant implementation
  written in Rust.

Aside from reading [the
documentation](https://github.com/proycon/analiticcl/blob/master/README.md),
you can also view an in-depth [presentation
video](https://video.anaproy.nl/w/rBeL5KEGdag1N2KVb8JkTe) that was presented at the
KNAW Humanities Cluster in January 2022.

## Demo

![Analiticcl demo](https://raw.githubusercontent.com/CLARIAH/wp3-demos/master/analiticcl.gif)
