#!/bin/sh

if [ ! -d "$HOME/.anyenv" ]; then
    git clone https://github.com/riywo/anyenv "$HOME/.anyenv"

    case $SHELL in
        "/bin/bash" ) source "$HOME/.bashrc" ;;
        "/bin/zsh" ) source "$HOME/.zshrc" ;;
    esac

    mkdir -p $(anyenv root)/plugins
    git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

# install **env
anyenv install rbenv
anyenv install plenv
anyenv install pyenv
anyenv install phpenv
anyenv install ndenv
anyenv install luaenv

exec $SHELL -l

rbenv install 2.1.0
plenv install 5.16.3
pyenv install 2.7.6
pyenv install 3.3.3
phpenv install 5.4
ndenv install v0.10.25

# update
anyenv update
anyenv versions

