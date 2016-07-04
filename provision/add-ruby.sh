#!/usr/bin/env bash

# specify version of ruby (installed by rbenv)
RUBY=2.3.1

# comment out if you don't want sinatra
SINATRA=yes

# comment out if you don't want rails
# when using rails, start server with: rails s -b 0.0.0.0
RAILS=4.2.6

# install rbenv
if ! command -v rbenv >/dev/null 2>&1; then
  echo "==> INSTALLING rbenv"
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	cd ~/.rbenv && src/configure && make -C src
	echo "export PATH=\"\$HOME/.rbenv/bin:\$PATH\"" >> ~/.bashrc
	echo "eval \"\$(rbenv init -)\"" >> ~/.bashrc
  export PATH=$HOME/.rbenv/bin:$PATH
  export PATH=$HOME/.rbenv/shims:$PATH
else
  echo "==> rbenv ALREADY INSTALLED"
fi

# install ruby
if [ -f ~/.rbenv/versions/$RUBY/bin/ruby ]; then
	echo "==> Ruby ${RUBY} is already installed..."
else
	echo "==> Installing Ruby ${RUBY}..."
	rbenv install $RUBY
fi

rbenv global $RUBY
rbenv local $RUBY

gem install bundler
rbenv rehash

if [ -n "$SINATRA" ]; then
  echo "==> INSTALLING Sinatra"
  gem install sinatra --no-rdoc --no-ri
fi

# install rails if specified
if [ -n "$RAILS" ]; then

  # rails wants sqlite3 for default new projects
  if ! command -v postgres >/dev/null 2>&1; then
    echo "==> INSTALLING postgresql"
    sudo apt-get -y install postgresql postgresql-contrib libpq-dev
  else
    echo "==> postgresql ALREADY INSTALLED"
  fi

	# rails wants nodejs for asset pipeline
	if ! command -v nodejs >/dev/null 2>&1; then
	  echo "==> INSTALLING nodejs"
	  sudo apt-get -y install nodejs
	else
	  echo "==> nodejs ALREADY INSTALLED"
	fi

  echo "==> INSTALLING bundler & rails"
	gem install bundler --no-rdoc --no-ri
	gem install rails --version $RAILS --no-rdoc --no-ri
	rbenv rehash

fi
