#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
TARGET_DIR="$MAKE_WORK_DIR/.vim/bundle"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"
rm -rf neobundle.vim
git clone git://github.com/Shougo/neobundle.vim.git && \
    vim -u "$HOME/.vimrc" +NeoBundleInstall +qa && \
    vim -u "$HOME/.vimrc" +NeoBundleUpdate +qa && \
    vim -u "$HOME/.vimrc" +NeoBundleClean +qa

