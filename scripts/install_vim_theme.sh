#!/bin/sh

rm -rf .vim/colors/solarized.vim
mkdir -p .vim/colors && \
    ln -s .modules/solarized/vim-colors-solarized/colors/solarized.vim .vim/colors
