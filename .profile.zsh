#!/usr/bin/env zsh

# プラグインや設定の読み込み
[ -f ~/.zsh/zinit.zsh ] && source $HOME/.zsh/zinit.zsh
[ -f ~/.zsh/fzf.zsh ] && source $HOME/.zsh/fzf.zsh
[ -f ~/.zsh/history.zsh ] && source $HOME/.zsh/history.zsh

# コンプリートの設定
autoload -U compinit
compinit

# Emacsモードで利用する
bindkey -e

# Ctrl-Dで閉じちゃうのをやめる
stty eof undef

# direnv
eval "$(direnv hook zsh)"

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh
