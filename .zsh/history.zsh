#!/usr/bin/env zsh

export HISTFILE=$HOME/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=1000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数

setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_ignore_dups # 重複を記録しない
setopt hist_save_no_dups # 古いコマンドと同じものは無視
setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt extended_history # 開始と終了を記録
setopt hist_reduce_blanks # 余分な空白は詰めて記録
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_ignore_space # スペースで始まるコマンド行はヒストリリストから削除
