#!/usr/bin/env zsh

# プラグインや設定の読み込み
[ -f "$HOME/.zsh/zplug.zsh" ] && source $HOME/.zsh/zplug.zsh
[ -f "$HOME/.zsh/fzf.zsh" ] && source $HOME/.zsh/fzf.zsh
[ -f "$HOME/.zsh/history.zsh" ] && source $HOME/.zsh/history.zsh

# PATHの重複読み込みをなくす
typeset -U path PATH
