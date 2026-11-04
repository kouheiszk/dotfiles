# 対話シェルの設定は .zshrc で読み込むので、ここでは非対話のログインシェルにも必要な PATH だけ設定する
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# `mise activate zsh --shims` と同じ。mise を起動しないで済むように直接書く
export PATH="${MISE_DATA_DIR:-$HOME/.local/share/mise}/shims:$PATH"
