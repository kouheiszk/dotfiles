# PATH

if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH:/usr/sbin:/sbin:/usr/local/opt/ruby/bin:$HOME/perl5/bin:/usr/bin:/bin

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

# gosh alias
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"

# preview
alias show='open -a Preview'

alias cpanm='cpanm -l ~/.local/cpanm'
alias docker='docker --tls'

# Git ルートディレクトリ移動
function gitroot() {
if `git rev-parse --is-inside-work-tree 2>&1 > /dev/null`; then
    cd `git rev-parse --show-toplevel`
fi
}

alias gr='gitroot'

# ssh

AGENT_SOCK_FILE="/tmp/ssh-agent-$USER"
SSH_AGENT_FILE="$HOME/.ssh-agent-info"
if test $SSH_AUTH_SOCK ; then
    if [ $SSH_AUTH_SOCK != $AGENT_SOCK_FILE ] ; then
        ln -sf $SSH_AUTH_SOCK $AGENT_SOCK_FILE
        export SSH_AUTH_SOCK=$AGENT_SOCK_FILE
    fi
else
    test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE
    if ! ssh-add -l >& /dev/null ; then
        ssh-agent > $SSH_AGENT_FILE
        source $SSH_AGENT_FILE
        ssh-add
    fi
fi

# .local_profileを読み込む
[ -f ~/.local_profile ] && source ~/.local_profile
