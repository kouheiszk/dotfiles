# PATH
# export PATH=/usr/local/sbin:$PATH
export DEFAULT_PATH=$PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/local/opt/ruby/bin:$HOME/perl5/bin:$DEFAULT_PATH

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

# gosh alias
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"

# preview
alias show='open -a Preview'
alias finda='open .'

# Git ルートディレクトリ移動
function git-root() {
    if git rev-parse --is-inside-work-tree 2>&1 > /dev/null; then
        cd `git rev-parse --show-toplevel`
    fi
}
alias gr='git-root'

# android
[ -d /Applications/android-sdk/tools ] && export PATH=$PATH:/Applications/android-sdk/tools
[ -d /Applications/android-sdk/platform-tools ] && export PATH=$PATH:/Applications/android-sdk/platform-tools

# tmuxの開始
#if which tmux 2>&1 >/dev/null; then
#    #if not inside a tmux session, and if no session is started, start a new session
#    [ -z "$TMUX" ] && (tmux attach -d || tmux new-session)
#fi

# ssh-agent

if [ -z "$TMUX" ]; then
    # we're not in a tmux session

    if [ ! -z "$SSH_TTY" ]; then
        # We logged in via SSH

        # if ssh auth variable is missing
        if [ -z "$SSH_AUTH_SOCK" ]; then
            export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
        fi

        # if socket is available create the new auth session
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
            `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
            echo $SSH_AGENT_PID > "$HOME/.ssh/.auth_pid"
        fi

        # if agent isn't defined, recreate it from pid file
        if [ -z $SSH_AGENT_PID ] && [ -f "$HOME/.ssh/.auth_pid" ]; then
            export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
        fi

        # Add all default keys to ssh auth
        ssh-add 2>/dev/null

        # start tmux
        tmux attach
    fi
fi
