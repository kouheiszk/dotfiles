#!/usr/bin/env bash

# プラグインや設定の読み込み
[ -f "$HOME/.bash/fzf.bash" ] && source $HOME/.bash/fzf.bash

# direnv
eval "$(direnv hook bash)"

# mise
eval "$(mise activate bash)"
