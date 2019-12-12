#!/bin/sh

if [ ! -x "$(which anyenv)" ]; then
  brew install anyenv
fi

if [ -x "$(which anyenv)" ]; then
  anyenv init
  anyenv install --init

  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

  # Install new versions at 2019.12.12
  rbenv install 2.6.4
  nodenv install v13.3.0

  # update
  anyenv update
  anyenv versions
fi
