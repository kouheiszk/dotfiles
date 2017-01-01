#!/usr/bin/env zsh

if [ -f $HOME/.zplug/init.zsh ]; then
  source $HOME/.zplug/init.zsh

  # 各種プラグインのインストール
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  # zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
  # zplug "junegunn/fzf", as:command, use:'bin/fzf-tmux'
  zplug "mollifier/cd-gitroot", as:command, rename-to:grt
  # zplug "junegunn/fzf", as:plugin, use:'shell/completion.zsh'
  zplug 'rupa/z', as:plugin, use:'z.sh'
  zplug "b4b4r07/enhancd", use:init.sh
  zplug "dracula/zsh", as:theme

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load
fi
