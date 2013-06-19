# COLOR
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='GxBxCxfxcxdxdxhbadbxbx'

# promptを変更
export PS1="\033[1;37m[\u@\h \w]\$ \033[0m"

# .profileを読み込む
[ -f ~/.profile ] && source ~/.profile

# .local_profileを読み込む
[ -f ~/.local_profile ] && source ~/.local_profile

# HISTORY
function share_history {  # 以下の内容を関数として定義
    history -a  # .bash_historyに前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
export HISTSIZE=10000  # 履歴のMAX保存数
shopt -u histappend
shopt -s histverify
export HISTCONTROL=ignoredups
HISTIGNORE="ls:cd"
export HISTTIMEFORMAT="%y/%m/%d %H:%M:%S: "

# GIT SETTINGS
if [ -f $HOME/tmp/git/contrib/completion/git-completion.bash ]; then
    source $HOME/tmp/git/contrib/completion/git-completion.bash
    export GIT_PS1_SHOWUPSTREAM=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWDIRTYSTATE=1
    export PS1='\[\033[1;37m\][\u@\h \w\[\033[31m\]$(__git_ps1 "|%s")\[\033[1;37m\]]\$ \[\033[0m\]'
fi

# CPANMのインストール先
alias cpanm='cpanm -l $HOME/.local/cpanm'

# .local_bash_profileを読み込む
[ -f ~/.local_bash_profile ] && source ~/.local_bash_profile
