#!/usr/bin/env zsh

# プラグインや設定の読み込み
[ -f ~/.zsh/zinit.zsh ] && source $HOME/.zsh/zinit.zsh
[ -f ~/.zsh/fzf.zsh ] && source $HOME/.zsh/fzf.zsh
[ -f ~/.zsh/history.zsh ] && source $HOME/.zsh/history.zsh

## コンプリートの設定
autoload -U compinit
compinit

# Ctrl-Dで閉じちゃうのをやめる
stty eof undef

# PATHの重複読み込みをなくす
typeset -U path PATH

# direnv
eval "$(direnv hook zsh)"
