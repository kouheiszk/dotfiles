#!/bin/sh

if command -v git &>/dev/null
then
    echo "git is already exists :)"
else
    echo "git is not exists :("
    exit 1
fi

mkdir -p ~/tmp
git clone https://github.com/kouheiszk/dotfiles.git ~/tmp/dotfiles
cd ~/tmp/dotfiles/
make install
cd -

