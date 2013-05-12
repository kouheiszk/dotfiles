# PROMPT
export PS1="\033[1m[\u@\h \W]\$ \033[0m"

# LOAD PROFILE
if [ -f ~/.profile ]; then
    source ~/.profile
fi

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

 
