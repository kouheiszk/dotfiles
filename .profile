#!/bin/sh

# ~/.profile は複数のログインシェルが実行するファイル
# bashの場合、この ~/.profile は .bash_profile や .bash_login があれば自動で読み込まないので、手動で読み込む必要がある
# bashの場合:
# .bash_profile -> .bashrc -> .profile -> .profile.bash -> .local_profile
# zshの場合:
# .zshrc -> .profile -> .profile.zsh -> .local_profile

# brew
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pyenv
if [ -d "$HOME/.anyenv/envs/pyenv" ]; then
  export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" 2>&1 > /dev/null
  eval "$(pyenv init --path)" 2>&1 > /dev/null
fi

# anyenv
if [ -d "$HOME/.anyenv" ]; then
    eval "$(anyenv init -)"
fi

# asdf
if which asdf > /dev/null 2>&1; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi


# local
export PATH=$PATH:$HOME/.local/bin

# go
export GOPATH=$HOME/workspace
export PATH=$PATH:$GOPATH/bin

# java for android
if [ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
  export PATH=$JAVA_HOME/bin:$PATH
elif java --version &>/dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME/bin:$PATH
fi

# flutter
if [ -d "$GOPATH/src/github.com/flutter/flutter" ]; then
  export FLUTTER_PATH="$GOPATH/src/github.com/flutter/flutter"
  export PATH=$FLUTTER_PATH/bin:$PATH
fi

if [ -d "/usr/local/opt/imagemagick@6" ]; then
  export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
fi

if [ -d "$HOME/Library/Android" ]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
fi

# Suppress +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called. error
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# editor
export EDITOR=vim

if [ -d "$HOME/Library/Application Support/JetBrains/Toolbox/scripts" ]; then
  export PATH=$PATH:$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts
fi

# alias
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'
alias vim='nvim'
alias vi='vim'
alias v='vim'

case $( uname ) in
  "Darwin")
    alias ls='ls -GFh'
    ;;
  *)
    alias ls='ls -Fh --color'
    ;;
esac

alias la='ls -a'
alias ll='ls -l'
alias lsf='ls | grep -v /'
alias lsd='ls | grep /'
alias laf='ls -a | grep -v /'
alias lad='ls -a | grep /'
alias llf='ls -l | grep -v /'
alias lld='ls -l | grep /'
alias llaf='ls -al | grep -v /'
alias llad='ls -al | grep /'
alias ag='ag -aQ --search-binary'
alias g='git'

# preview
alias show='open -a Preview'

# Git ルートディレクトリ移動
function my_cd_gitroot() {
  if `git rev-parse --is-inside-work-tree 2>&1 > /dev/null`; then
    cd `git rev-parse --show-toplevel`
  fi
}

alias gr='my_cd_gitroot'

# ssh-addでキーを読み込んでおく
case $(uname) in
  "Darwin" )
    if [ -d $HOME/.ssh ]; then
      for private_key in $(ls $HOME/.ssh | grep id_rsa | grep -v .pub); do
        ssh-add -K $HOME/.ssh/$private_key >/dev/null 2>&1
      done
    fi
    ;;
  * )
    ;;
esac

if [ -d $HOME/.cargo ]; then
  . "$HOME/.cargo/env"
fi

# シェル固有の設定を読み込む
case $SHELL in
  "/bin/bash" ) [ -f "$HOME/.profile.bash" ] && source $HOME/.profile.bash ;;
  "/bin/zsh" | "/usr/local/bin/zsh" ) [ -f "$HOME/.profile.zsh" ] && source $HOME/.profile.zsh ;;
esac

# .local_profileを読み込む
[ -f "$HOME/.local_profile" ] && source $HOME/.local_profile
