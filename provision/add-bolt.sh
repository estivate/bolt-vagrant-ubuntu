#!/usr/bin/env bash

BOLT=1.1.0

if ! command -v rabbitmqctl >/dev/null 2>&1; then
  echo "==> INSTALLING rabbitmq"
  sudo apt-get -y install rabbitmq-server
fi


if ! command -v boltengine >/dev/null 2>&1; then   ## no path, this always fails
  echo "==> INSTALLING bolt"
  mkdir boltengine
  cd boltengine
  wget https://github.com/TeamFairmont/boltengine/releases/download/v$BOLT/boltengine-$BOLT.tar.gz -O boltengine-$BOLT.tar.gz -q
  tar -xzf boltengine-$BOLT.tar.gz
  rm boltengine-$BOLT.tar.gz
  sudo mkdir /etc/bolt
  sudo cp etc/bolt/config.json /etc/bolt/
  sudo cp etc/systemd/system/bolt.service /etc/systemd/system/
  sudo ed -s /etc/systemd/system/bolt.service <<< $',s/\[username\]/vagrant/g\nw'
  sudo ed -s /etc/systemd/system/bolt.service <<< $',s/go\/src\/github.com\/TeamFairmont\///g\nw'
  sudo systemctl enable bolt
  sudo systemctl start bolt
fi
