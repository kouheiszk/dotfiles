#!/usr/bin/env zsh

# プラグインや設定の読み込み
[ -f "$HOME/.zsh/zplugin.zsh" ] && source $HOME/.zsh/zplugin.zsh
[ -f "$HOME/.zsh/fzf.zsh" ] && source $HOME/.zsh/fzf.zsh
[ -f "$HOME/.zsh/history.zsh" ] && source $HOME/.zsh/history.zsh

# コンプリートの設定
autoload -U compinit
compinit

# Ctrl-Dで閉じちゃうのをやめる
stty eof undef

# PATHの重複読み込みをなくす
typeset -U path PATH
