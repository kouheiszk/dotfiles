#!/bin/sh

if [ ! -x "$(which anyenv)" ]; then
  if [ ! -d "$HOME/.anyenv" ]; then
    git clone https://github.com/riywo/anyenv "$HOME/.anyenv"

    case $SHELL in
      "/bin/bash" ) source "$HOME/.bashrc" ;;
      "/bin/zsh" ) source "$HOME/.zshrc" ;;
    esac

    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  fi

  mkdir -p $(anyenv root)/envs

  # Install **env
  anyenv install rbenv
  anyenv install pyenv
  anyenv install ndenv
  anyenv install goenv
  anyenv install phpenv

  exec $SHELL -l
fi

if [ ! -d "$HOME/.local/bin" ]; then
  mkdir -p $HOME/.local/bin
fi

if [ -x "$(which anyenv)" ]; then
  # Install new versions at 2017.1.1
  rbenv install 2.3.1
  pyenv install 3.6.0
  ndenv install v6.9.2
  goenv install 1.7.4
  # phpenv install 7.0.15

  # update
  anyenv update
  anyenv versions
fi

# Install pyenv virtualenv
if [ -d "$HOME/.anyenv/envs/pyenv/plugins/pyenv-virtualenv" ]; then
  echo "Install pyenv-virtualenv"
  git clone https://github.com/yyuu/pyenv-virtualenv.git "$HOME/.anyenv/envs/pyenv/plugins/pyenv-virtualenv"
fi

# Install composer
if [ ! -f "$HOME/.local/bin/composer" ]; then
  echo "Install composer"
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar $HOME/.local/bin/composer
fi

