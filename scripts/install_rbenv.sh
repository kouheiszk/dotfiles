#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
TARGET_DIR="$MAKE_WORK_DIR/.rbenv"

git clone https://github.com/sstephenson/rbenv.git "$TARGET_DIR"
git clone https://github.com/sstephenson/ruby-build.git "$TARGET_DIR"
echo 'export PATH="$$HOME/.rbenv/bin:$$PATH"' >> ~/.local_zshrc_init
echo 'eval "$$(rbenv init -)"' >> ~/.local_zsh_profile

