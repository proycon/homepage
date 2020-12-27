#!/bin/bash
if ! which go; then
    echo "Install go first">&2
    exit 2
fi
mkdir -p go hugo
git clone https://github.com/gohugoio/hugo.git
export GOPATH=$(pwd)/go
cd hugo
git checkout v0.53
go install --tags extended
