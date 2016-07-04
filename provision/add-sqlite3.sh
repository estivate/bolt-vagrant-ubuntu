#!/usr/bin/env bash

if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "==> INSTALLING sqlite3"
  sudo apt-get -y install sqlite3 libsqlite3-dev
else
  echo "==> sqlite3 ALREADY INSTALLED"
fi
