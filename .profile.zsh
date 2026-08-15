#!/usr/bin/env zsh

# .zprofile と .zshrc の両方が ~/.profile を読むため、このファイルは
# ログインシェルでは二重に読まれる。zinit を二度ロードしないよう番人を置く
[ -n "$MY_PROFILE_ZSH_LOADED" ] && return
MY_PROFILE_ZSH_LOADED=1

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

# mise (旧 asdf の置き換え)
# 注: direnv の zsh フックは自分を precmd_functions の先頭に prepend するため、
# 読み込み順に関わらず direnv -> mise の順で走る。つまり direnv 側で venv を
# activate しても mise が PATH を張り直して覆い隠す。venv を使うプロジェクトでは
# .mise.toml に `_.python.venv` を書いて mise 側に venv を認識させること
if command -v mise > /dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# direnv
if command -v direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
