#!/usr/bin/env bash

if ! command -v vim >/dev/null 2>&1; then
  echo "==> INSTALLING vim"

  ## compiling to get YouCompleteMe working
  sudo apt-get install build-essential cmake
  sudo apt-get install python-dev python3-dev
  cd ~
  git clone https://github.com/vim/vim.git
  cd vim
  ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
  make VIMRUNTIMEDIR=/usr/share/vim/vim74
  sudo make install

  mkdir -p ~/.vim/plugged
  cd ~/.vim/plugged
  git clone https://github.com/Valloric/YouCompleteMe.git
  cd YouCompleteMe
  ./install.py
  cd ~

  ## load your preferred vim setup
  wget https://gist.githubusercontent.com/estivate/b429e097809d2800d7eb1bea5fb3ff08/raw/5e493570d1dc3198505630ccbbc2e99914a5bd61/.vimrc -O ~/.vimrc -q

else
  echo "==> vim ALREADY INSTALLED"
fi
