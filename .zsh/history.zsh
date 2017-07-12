#!/usr/bin/env zsh

export HISTFILE=$HOME/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=1000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数

setopt HIST_NO_STORE # historyコマンドは履歴に登録しない
setopt HIST_IGNORE_DUPS # 重複を記録しない
setopt HIST_SAVE_NO_DUPS # 古いコマンドと同じものは無視
setopt HIST_IGNORE_ALL_DUPS # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt EXTENDED_HISTORY # 開始と終了を記録
setopt HIST_REDUCE_BLANKS # 余分な空白は詰めて記録
setopt HIST_VERIFY # ヒストリを呼び出してから実行する間に一旦編集可能
setopt HIST_IGNORE_SPACE # スペースで始まるコマンド行はヒストリリストから削除
setopt SHARE_HISTORY # ヒストリを共有
setopt INC_APPEND_HISTORY # コマンドを実行した直後にヒストリファイルに追記する
