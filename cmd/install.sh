#!/usr/bin/env bash

pip3 install jupyterlab
pip3 install --upgrade jupyterlab

#For MAC
mkdir ~/Library/Jupyter/kernels && \
mkdir -p ~/Library/Jupyter/kernels/gophernotes && \
env GO111MODULE=on go get github.com/gopherdata/gophernotes && \
cd ~/Library/Jupyter/kernels/gophernotes && \
cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.4/kernel/*  "." && \
chmod +w ./kernel.json && \
sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json

"$(go env GOPATH)"/bin/gophernotes
