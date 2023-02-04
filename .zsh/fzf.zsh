#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS='-m -x --reverse'

if [ -d /opt/homebrew/opt/fzf/ ]; then
  FZF_PATH=/opt/homebrew/opt/fzf/
else
  FZF_PATH=/usr/local/opt/fzf/
fi

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

  # 履歴を選択する
  function fzf-history() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi

    local selected_line="$(history -n 1 | eval $tac | $(__fzfcmd) --query "$LBUFFER" | head -n 1)"

    if [ -n "${selected_line}" ]; then
      BUFFER="${selected_line}"
      CURSOR=$#BUFFER
    fi
  }
  zle -N fzf-history
  bindkey '^r' fzf-history

  # zを利用し、ディレクトリのあいまい検索を行う
  function fzf-z() {
    local selected_line="$(_z -l 2>&1 | $(__fzfcmd) +s --tac | awk '{ print $2 }' | head -n 1)"

    if [ -n "${selected_line}" ]; then
      BUFFER="cd ${selected_line}"
      zle accept-line
    fi
  }
  zle -N fzf-z
  bindkey "^z" fzf-z
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
source "$FZF_PATH/shell/key-bindings.zsh"
