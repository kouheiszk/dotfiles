#!/bin/sh

case $SHELL in
  "/bin/bash" ) chsh -s /bin/zsh ;;
  "/bin/zsh" | "/usr/local/bin/zsh" ) continue ;;
esac

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
