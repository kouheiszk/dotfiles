#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
DOTFILES_DIR=$(cd $SCRIPT_DIR/../; pwd)

cd $DOTFILES_DIR

for dotfile in .?*;do
  case "$dotfile" in
    ".." ) continue ;;
    "*.elc" ) continue ;;
    ".git" | ".gitignore" | ".gitmodules" | ".module" ) continue ;;
    * ) ln -Fis $DOTFILES_DIR/$dotfile $HOME ;;
  esac
done
