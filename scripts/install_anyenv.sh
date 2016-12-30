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
fi

if [ -x "$(which anyenv)" ]; then
  mkdir -p $(anyenv root)/envs

  # Install **env
  anyenv install rbenv
  anyenv install pyenv
  anyenv install ndenv
  anyenv install goenv

  exec $SHELL -l

  # Install new versions at 2017.1.1
  rbenv install 2.3.1
  pyenv install 3.6
  ndenv install v6.9.2
  goenv install 1.7.4

  # update
  anyenv update
  anyenv versions
fi
