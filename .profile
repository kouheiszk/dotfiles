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
if [ ! -x "$(which peco)" ]; then
  function peco-src-selection () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }

  zle -N peco-src-selection
  bindkey '^]' peco-src-selection
fi

# Git ルートディレクトリ移動
function gitroot() {
  if `git rev-parse --is-inside-work-tree 2>&1 > /dev/null`; then
    cd `git rev-parse --show-toplevel`
  fi
}

alias gr='gitroot'

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

# .local_profileを読み込む
[ -f "$HOME/.local_profile" ] && source $HOME/.local_profile
