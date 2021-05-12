#!/bin/sh

# shellをzshに切り替える
if [ $( cat /etc/shells | grep '/usr/local/bin/zsh' ) ]; then
  :
else
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells > /dev/null
fi

case $SHELL in
  "/usr/local/bin/zsh" ) continue ;;
  "/bin/bash" | "/bin/zsh" )
    if [ -f "/usr/local/bin/zsh" ]; then
      echo "Switch shell to /usr/local/bin/zsh"
      chsh -s /usr/local/bin/zsh
    elif [ $SHELL != "/bin/zsh" ] && [ -f "/bin/zsh" ]; then
      echo "Switch shell to /bin/zsh"
      chsh -s /bin/zsh
    fi
    ;;
esac

# zpluginのインストール
if [ ! -d "$HOME/.zplugin" ]; then
  git clone https://github.com/zdharma/zplugin.git $HOME/.zplugin/bin
elif [ -x "$(which zplugin)" ]; then
  zplugin self-update
else
  cd $HOME/.zplugin/bin
  git pull origin master
fi