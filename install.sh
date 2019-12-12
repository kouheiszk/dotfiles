#!/bin/sh

if command -v git &>/dev/null
then
    echo "git is already exists :)"
else
    echo "git is not exists :("
    exit 1
fi

if [ -d $HOME/.tmp/dotfiles ]; then
  cd $HOME/.tmp/dotfiles/
  git pull origin master
else
  mkdir -p $HOME/.tmp
  git clone https://github.com/kouheiszk/dotfiles.git $HOME/.tmp/dotfiles
  cd $HOME/.tmp/dotfiles/
fi

make install

cd -
