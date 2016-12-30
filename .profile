#!/bin/sh

# ~/.profile は複数のログインシェルが実行するファイル
# bashの場合、この ~/.profile は .bash_profile や .bash_login があれば自動で読み込まないので、手動で読み込む必要がある
# bashの場合:
# .bash_profile -> .bashrc -> .profile -> .profile.bash -> .local_profile
# zshの場合:
# .zshrc -> .profile -> .profile.zsh -> .local_profile

# anyenv
if [ -d "$HOME/.anyenv" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# go
export GOPATH=$HOME/workspace
export PATH=$PATH:$GOPATH/bin

# alias
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'
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

# peco
if [ ! -x "$(which zle)" ]; then
  function kouheiszk_peco_src_selection () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }

  zle -N kouheiszk_peco_src_selection
  bindkey '^]' kouheiszk_peco_src_selection
fi

# Git ルートディレクトリ移動
function kouheiszk_gitroot() {
  if `git rev-parse --is-inside-work-tree 2>&1 > /dev/null`; then
    cd `git rev-parse --show-toplevel`
  fi
}

alias gr='kouheiszk_gitroot'

# ssh
# SSH_AGENT="$HOME/.ssh/agent"
# if [ -S "$SSH_AUTH_SOCK" ]; then
#     case $SSH_AUTH_SOCK in
#     /private/tmp/com.apple.launchd.[0-9a-zA-Z]*/Listeners)
#         ln -snf "$SSH_AUTH_SOCK" $SSH_AGENT && export SSH_AUTH_SOCK=$SSH_AGENT
#     esac
# elif [ -S $SSH_AGENT ]; then
#     export SSH_AUTH_SOCK=$SSH_AGENT
# else
#     test -f $SSH_AGENT && source $SSH_AGENT
#     if ! ssh-add -l >& /dev/null; then
#         ssh-agent > $SSH_AGENT
#         source $SSH_AGENT
#         ssh-add
#     fi
# fi

# シェル固有の設定を読み込む
case $SHELL in
  "/bin/bash" ) [ -f "$HOME/.profile.bash" ] && source $HOME/.profile.bash ;;
  "/bin/zsh" | "/usr/local/bin/zsh" ) [ -f "$HOME/.profile.zsh" ] && source $HOME/.profile.zsh ;;
esac

# .local_profileを読み込む
[ -f "$HOME/.local_profile" ] && source $HOME/.local_profile
