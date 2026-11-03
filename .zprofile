# 対話シェルの設定は .zshrc で読み込むので、ここでは非対話のログインシェルにも必要な PATH だけ設定する
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(mise activate zsh --shims)"
