#!/bin/sh

SHELL_DIR=$(cd $(dirname $0); pwd)
MODULE_DIR="$SHELL_DIR/.module"

VIM_DIR="$HOME/.vim"
ECLIPSE_DIR="$HOME/.eclipse"

# vim-neobundleを使うために
[ ! -d "$VIM_DIR" ] && mkdir -p "$VIM_DIR"
[ ! -d "$VIM_DIR/bundle/neobundle.vim" ] && git clone https://github.com/Shougo/neobundle.vim "$VIM_DIR/bundle/neobundle.vim"
[ ! -d "$VIM_DIR/bundle/vimproc" ] && git clone https://github.com/Shougo/vimproc "$VIM_DIR/bundle/vimproc" 
cd "$VIM_DIR/bundle/neobundle.vim"
git fetch && git pull origin master
cd "$VIM_DIR/bundle/vimproc"
git fetch && git pull origin master
case "${OSTYPE}" in
    darwin*)
        [ -f "make_mac.mak" ] && make -f make_mac.mak
        ;;
    linux*)
        [ -f "make_unix.mak" ] && make -f make_unix.mak
        ;;
esac

# vim-solarized-colorをインストール
[ ! -d "$VIM_DIR/colors" ] && mkdir -p "$VIM_DIR/colors"
ln -s "$MODULE_DIR/solarized/vim-colors-solarized/colors/solarized.vim" "$VIM_DIR/colors"

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
