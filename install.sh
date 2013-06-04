#!/bin/sh

VIM_DIR=$HOME/.vim
ECLIPSE_DIR=$HOME/.eclipse

if [ ! -d $VIM_DIR ]; then
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    git clone https://github.com/Shougo/vimproc $HOME/.vim/bundle/vimproc
fi

if [ ! -d $ECLIPSE_DIR ]; then
    mkdir -p $HOME/.eclipse
fi

ln -s .bash_profile $HOME
ln -s .bashrc $HOME
ln -s .eclipse/formatter $HOME/.eclipse
ln -s .gitconfig $HOME
ln -s .gitignore_global $HOME
ln -s .gosh_completions $HOME
ln -s .profile $HOME
ln -s .tmux.conf $HOME
ln -s .vimrc $HOME
ln -s .zshrc $HOME
ln -s .zshrc_git $HOME

echo 'Done...'
