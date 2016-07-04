#!/usr/bin/env bash

# set go version
GO_VERSION=1.6.2

# Go workspace set to ~/work, even if you change this remember to compile in
# the vm instead of on the host machine.

# I'm chosing to just install Go here. I install GoFmt, GoDoc, etc. using
# vim-go as I first enter vim with the :GoInstallBinaries command

if ! command -v go >/dev/null 2>&1; then
  echo "==> INSTALLING go"
  wget https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz -O go$GO_VERSION.linux-amd64.tar.gz -q
  sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz

  echo "export PATH=\"\$PATH:/usr/local/go/bin\"" >> ~/.profile

  echo "setting up workspace"
  mkdir -p ~/work
  echo "export GOPATH=\$HOME/work" >> ~/.profile
  echo "export GOBIN=\$HOME/work/bin" >> ~/.profile
  echo "export PATH=\"\$PATH:\$HOME/work/bin\"" >> ~/.profile

  echo "cleaning up"
  rm go$GO_VERSION.linux-amd64.tar.gz

fi
