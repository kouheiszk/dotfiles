#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
DOTFILES_DIR=$(cd $SCRIPT_DIR/../; pwd)

cd $DOTFILES_DIR

# リンクの切れたシンボリックリンクを削除する
find -L $HOME -mindepth 1 -maxdepth 1 -type l | xargs rm -r

# シンボリックリンクを作成する
for dotfile in .?*; do
  case "$dotfile" in
    ".." ) continue ;;
    ".DS_Store" ) continue ;;
    "*.elc" ) continue ;;
    ".git" | ".gitignore" | ".gitmodules" | ".module" ) continue ;;
    * )
      if [ -f "$HOME/$dotfile" ] || [ -d "$HOME/$dotfile" ]; then
        if [ -L "$HOME/$dotfile" ]; then
          # すでにシンボリックリンクが存在するので、リンク元のファイルをチェックする
          real_file=$( ls -la $HOME/$dotfile | awk '{ print $NF }' )
          if [ "$real_file" != "$DOTFILES_DIR/$dotfile" ]; then
            echo "Wrong symbolic link of ${dotfile} is exist."
          fi
        else
          # シンボリックリンクではないファイルが存在する
          echo "${dotfile} is already exists."
        fi
      else
        # ファイルが存在しないので、シンボリックリンクを作成する
        ln -is $DOTFILES_DIR/$dotfile $HOME
      fi
      ;;
  esac
done
