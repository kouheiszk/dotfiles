# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH:/usr/sbin:/sbin:/usr/local/opt/ruby/bin:$HOME/perl5/bin:/usr/bin:/bin
export PERL5LIB=$PERL5LIB:$HOME/.local/cpanm/lib/perl5

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
alias finda='open .'

alias cpanm='cpanm -l ~/.local/cpanm'

# Git ルートディレクトリ移動
function git-root() {
    if git rev-parse --is-inside-work-tree 2>&1 > /dev/null; then
        cd `git rev-parse --show-toplevel`
    fi
}
alias gr='git-root'

# android
[ -d /Applications/android-sdk ] && export ANDROID_SDK=/Applications/android-sdk
[ -d /Applications/android-sdk/tools ] && export PATH=$PATH:$ANDROID_SDK/tools
[ -d /Applications/android-sdk/platform-tools ] && export PATH=$PATH:$ANDROID_SDK/platform-tools

# .local_profileを読み込む
[ -f ~/.local_profile ] && source ~/.local_profile
