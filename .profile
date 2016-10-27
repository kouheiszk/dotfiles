# PATH
if [ -x /usr/libexec/path_helper ]; then
    export PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH:/usr/local/opt/ruby/bin:/usr/bin:/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# anyenv
if [ -d "$HOME/.anyenv" ]; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in $(/bin/ls $HOME/.anyenv/envs)
    do
        export PATH="$HOME/.anyenv/envs/${D}shims:$PATH"
    done
fi

# cpan
export PATH=$PATH:$HOME/.local/cpanm/bin

# go
export GOPATH=$HOME/Documents/workspace
export PATH=$PATH:$GOPATH/bin

# node
export NODE_PATH=`npm root -g`

# android
[ -d /Applications/android-sdk ] && export ANDROID_SDK=/Applications/android-sdk
[ -d /Applications/android-sdk/tools ] && export PATH=$PATH:$ANDROID_SDK/tools
[ -d /Applications/android-sdk/platform-tools ] && export PATH=$PATH:$ANDROID_SDK/platform-tools

# ENV

export PERL5LIB=$HOME/.local/cpanm/lib/perl5
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH="$HOME/.docker/boot2docker-vm"

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

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

case "$OSTYPE" in
    darwin*)
        alias ls='ls -GFh'
        ;;
    linux*)
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
alias ant='ant -logger org.apache.tools.ant.listener.AnsiColorLogger'
alias ag='ag -aQ --search-binary'
alias g='git'
alias tl='tmux list-sessions'
alias ta='tmux attach-session -t'

alias be='bundle exec'

# gosh alias
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"

# preview
alias show='open -a Preview'

alias cpanm='cpanm -l ~/.local/cpanm'
alias docker='docker --tls'

# brew
alias brew='sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local && brew'

# objc2swift
alias objc2swift='java -jar /Users/kouhei/Documents/workspace/src/github.com/yahoojapan/objc2swift/build/libs/objc2swift-1.0.jar'

# peco

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# Git ルートディレクトリ移動
function gitroot() {
if `git rev-parse --is-inside-work-tree 2>&1 > /dev/null`; then
    cd `git rev-parse --show-toplevel`
fi
}

alias gr='gitroot'

# ssh

SSH_AGENT="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /private/tmp/com.apple.launchd.[0-9a-zA-Z]*/Listeners)
        ln -snf "$SSH_AUTH_SOCK" $SSH_AGENT && export SSH_AUTH_SOCK=$SSH_AGENT
    esac
elif [ -S $SSH_AGENT ]; then
    export SSH_AUTH_SOCK=$SSH_AGENT
else
    test -f $SSH_AGENT && source $SSH_AGENT
    if ! ssh-add -l >& /dev/null; then
        ssh-agent > $SSH_AGENT
        source $SSH_AGENT
        ssh-add
    fi
fi

# .local_profileを読み込む
[ -f ~/.local_profile ] && source ~/.local_profile
