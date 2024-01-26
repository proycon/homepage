+++
title = "STAM: Stand-off Text Annotation Model"
date = 2023-01-01T00:04:34+01:00
description = "Stand-off Text Annotation Model (STAM) is a data model for stand-off-text annotation where any information on a text is represented as an annotation."

[extra]
url_code = "https://annotation.github.io/stam"
cover =  "/img/covers/stam.png"
+++

# STAM: Stand-off Text Annotation Model

STAM is a data model for **stand-off text annotation**. The underlying premise
is that any information on a text is represented as an *annotation*. We define
an annotation as any kind of remark, classification/tagging on any particular
portion(s) of a text, or on the resource or annotation set as a whole, in which
case we can interpret annotations as *metadata*. Additionally, rather than
reference the text directly, annotations may point to other annotations
(higher-order annotation). Examples of annotation may be linguistic annotation,
structure/layout annotation, editorial annotation, technical annotation, or
whatever comes to mind. Our model does not define any vocabularies whatsoever.

The underlying resource is taken in its most bare form without further
information; e.g. plain text (an ordered sequence of unicode points). *Any*
additional information would be considered an annotation in our model.
Interpreting and supporting particular formats/encodings is up to the
implementations and opaque to the data model.

STAM does not depend on other more complex data models such as RDF, W3C Web
Annotations, TEI, FoLiA or whatever, but instead addresses the problem from a
more functional and pragmatic perspective. We separate pragmatics from
semantics and define a kind of lowest common denominator upon which further
solutions can be built. The user is free, and in fact encouraged, to use
vocabularies that are formalised elsewhere.

STAM is primarily intended as a model for data representation, and less so as a
format for data interchange. It is designed in such as way that an efficient
implementation (both speed & memory) is feasible. The form of such an
implementation either in a relational database, triple store, directly modelled
in memory, is left open to the implementation. Our model should also be
reducible to a more generalised acyclic directed graph model without much
difficulty.

Goals/characteristics of STAM are:

* *Simplicity* - the data model must be easy to understand for a user/developer
  to use and only contain what is needed, not more. We provide a **minimal**
  foundation upon which other projects can build more complex solutions. These
  are deliberately kept out of STAM itself. The notion that *everything is an
  annotation* is at the core of STAM and one of the things that keeps it
  simple.

* *Separation from semantics* - The data model does not commit to any
  vocabulary or annotation paradigm. It must be flexible enough to express
  whatever annotation paradigm a researcher wants to use, yet provide the
  facilities to be specific enough for practical purposes. The model basically
  allows for any kind of directed or undirected graph.

* *Standalone* - No dependency on other data models (e.g. RDF) aside from
  Unicode and JSON for serialisation, no dependency on any software services.

* *Practical* - Rather than provide a theoretical framework, we primarily aim
  to provide a practical specification and actual low-level tooling you can get
  to work with right away.

* *Performant* - The data model is set up in such a way that it allows for
  efficient/performant implementations, with regard to processing requirements
  but especially memory consumption. The model should be suitable for big data
  (millions of annotations). We sit at a point where we deem to have an optimal
  trade-off between simplicity, flexibility and performance.

* *Import & Export* - Reads/writes a simple JSON format. But also designed with
  export to more complex formats in mind (such as W3C Web Annotations / RDF)
  and imports from common formats such as CONLL. Note that although STAM puts
  no constraints on annotation paradigms and vocabularies, higher data models
  may.

The name STAM, an acronym for *"Stand-off Text Annotation Model"*, is Dutch,
Swedish, Afrikaans and Frisian for *"trunk"* (as in the trunk of a tree), the
name itself depicts a solid foundation upon which more elaborate solutions can be built.

For more information see [the STAM website](https://annotation.github.io/stam) and/or the implementations below.

## Implementations

The following implementations are available:

* [stam-rust](https://github.com/annotation/stam-rust) - A STAM library written in Rust, aims to be a *full STAM implementation* with high performance and *memory-based* storage model.
* [stam-python](https://github.com/annotation/stam-python) - A STAM Library for Python. This is not an independent implementation but it is a Python binding to the above Rust library.
* [stam-tools](https://github.com/annotation/stam-tools) - A set of CLI tools for STAM.
