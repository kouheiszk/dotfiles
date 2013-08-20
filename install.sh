#!/bin/sh

SHELL_DIR=$(cd $(dirname $0); pwd)
MODULE_DIR="$SHELL_DIR/.module"

VIM_DIR="$HOME/.vim"
ECLIPSE_DIR="$HOME/.eclipse"

# vim-neobundleを使うために
[ ! -d "$VIM_DIR" ] && mkdir -p "$VIM_DIR"
[ ! -d "$VIM_DIR/bundle/neobundle.vim" ] && git clone https://github.com/Shougo/neobundle.vim "$VIM_DIR/bundle/neobundle.vim"
cd "$VIM_DIR/bundle/neobundle.vim" && git fetch origin && git pull origin master

# vimprocはNeoBundleで管理する
# [ ! -d "$VIM_DIR/bundle/vimproc" ] && git clone https://github.com/Shougo/vimproc "$VIM_DIR/bundle/vimproc" 
# cd "$VIM_DIR/bundle/vimproc" && git fetch && git pull origin master

# vim-solarized-colorをインストール
[ ! -d "$VIM_DIR/colors" ] && mkdir -p "$VIM_DIR/colors"
rm -f "$VIM_DIR/colors/solarized.vim" && ln -s "$MODULE_DIR/solarized/vim-colors-solarized/colors/solarized.vim" "$VIM_DIR/colors"
# [ ! -L "$VIM_DIR/colors/solarized.vim" ] && ln -s "$MODULE_DIR/solarized/vim-colors-solarized/colors/solarized.vim" "$VIM_DIR/colors/solarized.vim"

if [ ! -d "$ECLIPSE_DIR" ]; then
    mkdir -p "$ECLIPSE_DIR"
fi

DOT_FILES=( .bash_profile .bashrc .gitconfig .gitignore_global .gosh_completions .profile .tmux.conf .vimrc .zshrc .zsh.d .jshintrc .eclipse/formatter .eclipse/keymap )
for file in ${DOT_FILES[@]}
do
    if [ -d "$HOME/$file" ]; then
        [ -L "$HOME/$file" ] && continue
        mv -f "$HOME/$file" "$HOME/${file}.bk"
    fi

    if [ -f "$HOME/$file" ]; then
        [ -L "$HOME/$file" ] && continue
        mv "$HOME/$file" "$HOME/${file}.bk"
    fi

    ln -s "$SHELL_DIR/$file" "$HOME/$file"
done

# Keyremapのxml配置
KEYREMAP4MAC_DIR="$HOME/Library/Application Support/KeyRemap4MacBook"
if [ -d "$KEYREMAP4MAC_DIR" ]; then
    [ -f "$KEYREMAP4MAC_DIR/private.xml" ] && mv "$KEYREMAP4MAC_DIR/private.xml" "$KEYREMAP4MAC_DIR/private.xml.bk"
            
    ln -s "$SHELL_DIR/Library/Application Support/KeyRemap4MacBook/private.xml" "$KEYREMAP4MAC_DIR"
fi

# NeoBundleをインストール
vim -u "$SHELL_DIR/.vimrc" +NeoBundleInstall +qa
vim -u "$SHELL_DIR/.vimrc" +NeoBundleUpdate +qa

# vimprocをコンパイル
if [ -d "$VIM_DIR/bundle/vimproc" ]; then
    cd "$VIM_DIR/bundle/vimproc"
    case "${OSTYPE}" in
        darwin*)
            [ -f "make_mac.mak" ] && make -f make_mac.mak
            ;;
        linux*)
            [ -f "make_unix.mak" ] && make -f make_unix.mak
            ;;
    esac
fi

# nodeモジュール
[ ! -d "$HOME/.node" ] && mkdir -p "$HOME/.node"
cd "$HOME/.node" && [ ! -d "$HOME/.node/jshint" ] && npm install -g jshint

echo 'Done...'
