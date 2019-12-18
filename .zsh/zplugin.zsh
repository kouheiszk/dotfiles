#!/usr/bin/env zsh

if [ -f $HOME/.zplugin/bin/zplugin.zsh ]; then
  source $HOME/.zplugin/bin/zplugin.zsh

  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin

  # Two regular plugins loaded without tracking.
  zplugin light zsh-users/zsh-autosuggestions
  zplugin light zdharma/fast-syntax-highlighting

  # Load Git plugin from OMZ
  zplugin snippet OMZ::plugins/git/git.plugin.zsh
  zplugin cdclear -q

  # Plugin history-search-multi-word loaded with tracking.
  zplugin ice wait'!0' zplugin load zdharma/history-search-multi-word

  # Load the pure theme, with zsh-async library that's bundled with it.
  zplugin ice pick"async.zsh" src"pure.zsh"
  zplugin light sindresorhus/pure

  # Customize pure theme
  prompt_newline='%666v'
  PROMPT=" $PROMPT"

  zplugin ice wait"!0" atinit"zpcompinit; zpcdreplay -q"
fi
