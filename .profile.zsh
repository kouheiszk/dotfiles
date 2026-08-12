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

# direnv
if command -v direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# asdf
# brew --prefix は未インストールでもパスを返すので、実体の有無で判定する
if command -v brew > /dev/null 2>&1; then
  asdf_sh="$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh"
  [ -f "$asdf_sh" ] && . "$asdf_sh"
  unset asdf_sh
fi
