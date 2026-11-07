#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS='-m -x --reverse'

FZF_PATH="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/fzf"

if [ -x "$(which fzf)" ]; then
  function __fzfcmd() {
    [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux" || echo "fzf"
  }

  # Git ディレクトリ一覧表示
  function fzf-ghq () {
    local selected_dir=$(ghq list -p | $(__fzfcmd) --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
  }
  zle -N fzf-ghq
  bindkey '^]' fzf-ghq
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$FZF_PATH/bin* ]]; then
  export PATH="$PATH:$FZF_PATH/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$FZF_PATH/man* && -d "$FZF_PATH/man" ]]; then
  export MANPATH="$MANPATH:$FZF_PATH/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_PATH/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# 履歴の検索 (Ctrl-r) もここで入る fzf 標準のものを使う
source "$FZF_PATH/shell/key-bindings.zsh"
