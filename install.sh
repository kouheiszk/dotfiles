#!/bin/sh

SHELL_DIR=$(cd $(dirname $0); pwd)

VIM_DIR="$HOME/.vim"
ECLIPSE_DIR="$HOME/.eclipse"

if [ ! -d "$VIM_DIR" ]; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
    git clone https://github.com/Shougo/vimproc "$HOME/.vim/bundle/vimproc"
fi

if [ ! -d "$ECLIPSE_DIR" ]; then
    mkdir -p "$ECLIPSE_DIR"
fi

ln -s "$SHELL_DIR/.bash_profile" "$HOME"
ln -s "$SHELL_DIR/.bashrc" "$HOME"
ln -s "$SHELL_DIR/.eclipse/formatter" "$ECLIPSE_DIR"
ln -s "$SHELL_DIR/.eclipse/keymap" "$ECLIPSE_DIR"
ln -s "$SHELL_DIR/.gitconfig" "$HOME"
ln -s "$SHELL_DIR/.gitignore_global" "$HOME"
ln -s "$SHELL_DIR/.gosh_completions" "$HOME"
ln -s "$SHELL_DIR/.profile" "$HOME"
ln -s "$SHELL_DIR/.tmux.conf" "$HOME"
ln -s "$SHELL_DIR/.vimrc" "$HOME"
ln -s "$SHELL_DIR/.zshrc" "$HOME"
ln -s "$SHELL_DIR/.zshrc_git" "$HOME"

KEYREMAP4MAC_DIR="$HOME/Library/Application Support/KeyRemap4MacBook"

if [ -d "$KEYREMAP4MAC_DIR" ]; then
    [ -f "$KEYREMAP4MAC_DIR/private.xml" ] && mv "$KEYREMAP4MAC_DIR/private.xml" "$KEYREMAP4MAC_DIR/private.xml.bk"
            
    ln -s "$SHELL_DIR/Library/Application Support/KeyRemap4MacBook/private.xml" "$KEYREMAP4MAC_DIR"
fi

echo 'Done...'
