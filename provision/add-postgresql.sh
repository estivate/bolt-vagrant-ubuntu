#!/usr/bin/env bash

if ! command -v postgres >/dev/null 2>&1; then
  echo "==> INSTALLING postgresql"
  sudo apt-get -y install postgresql postgresql-contrib libpq-dev
else
  echo "==> postgresql ALREADY INSTALLED"
fi
