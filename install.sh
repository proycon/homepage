#!/bin/bash
if ! which go; then
    echo "Install go first">&2
    exit 2
fi
mkdir -p go hugo
git clone https://github.com/gohugoio/hugo.git
cd hugo
git checkout v0.53
export GOPATH=$(pwd)/go
go install --tags extended
