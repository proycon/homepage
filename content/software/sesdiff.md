+++
title = "Sesdiff"
date = 2020-09-04T00:04:34+02:00
description = "Generates a shortest edit script (Myers' diff algorithm) to indicate how to get from the strings in column A to the strings in column B. Also provides the edit distance (levenshtein)."

[extra]
url_code = "https://github.com/proycon/sesdiff"
+++

# Sesdiff

This is a small and fast command line tool and Rust library that reads a
two-column tab separated input from standard input and computes the shortest
edit script (Myers' diff algorithm) to go from the string in column A to the
string in column B. It also computed the edit distance (aka levenshtein
distance).
