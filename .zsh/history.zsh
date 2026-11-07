#!/usr/bin/env zsh

export HISTFILE=$HOME/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=100000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
export HISTORY_IGNORE="(cd|pwd|l[sal])"

setopt HIST_NO_STORE
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

zshaddhistory() {
  emulate -L zsh
  local line=${1%%$'\n'}
  # HISTORY_IGNORE は行全体との一致なので、export などを伴う認証情報はここで行の一部として弾く
  [[ $line != ${~HISTORY_IGNORE} && $line != *AWS_(ACCESS_KEY_ID|SECRET_ACCESS_KEY|SESSION_TOKEN)* ]]
}
