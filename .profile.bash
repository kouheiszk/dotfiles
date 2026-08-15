#!/usr/bin/env bash

# プラグインや設定の読み込み
[ -f "$HOME/.bash/fzf.bash" ] && source $HOME/.zsh/fzf.bash

# mise (旧 asdf の置き換え)
# 注: direnv と併用する場合、venv を direnv 側で activate しても mise が PATH を
# 張り直して覆い隠すことがある。venv を使うプロジェクトでは .mise.toml に
# `_.python.venv` を書いて mise 側に venv を認識させること
if command -v mise > /dev/null 2>&1; then
  eval "$(mise activate bash)"
fi

# direnv
if command -v direnv > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi
