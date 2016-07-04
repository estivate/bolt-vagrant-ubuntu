#!/usr/bin/env bash

# let's sync the time on this server for reals
if ! command -v ntpdate >/dev/null 2>&1; then
  echo "==> INSTALLING ntp"
  sudo apt-get -y install ntp
else
  echo "==> ntp ALREADY INSTALLED"
fi

# set the time zone?
# export TZ=America/New_York

# force ntp to reset faster?
sudo service ntp stop
sudo ntpd -gq
sudo service ntp start

sudo apt-get update

if ! command -v git >/dev/null 2>&1; then
  echo "==> INSTALLING git"
  sudo apt-get -y install git
else
  echo "==> git ALREADY INSTALLED"
fi

if ! command -v wget >/dev/null 2>&1; then
  echo "==> INSTALLING wget"
  sudo apt-get -y install wget
else
  echo "==> wget ALREADY INSTALLED"
fi
