# PATH
# export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin

# alias
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'
alias vi='vim'

case "${OSTYPE}" in
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

# gosh alias
alias gosh="rlwrap -b '(){}[],#\";| ' gosh"

# preview
alias show="open -a Preview"
alias finda="open ."

# android
[ -d /Applications/android-sdk/tools ] && export PATH=$PATH:/Applications/android-sdk/tools
[ -d /Applications/android-sdk/platform-tools ] && export PATH=$PATH:/Applications/android-sdk/platform-tools

