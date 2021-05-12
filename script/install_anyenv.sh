#!/bin/sh

if [ ! -x "$(which anyenv)" ]; then
  brew install anyenv

  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

  anyenv install --init

  exec $SHELL -l
fi

# update
anyenv update
anyenv versions
