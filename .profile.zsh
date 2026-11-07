#!/usr/bin/env zsh

# Emacsモードで利用する
# EDITOR に vi を含むと zsh は vi のキーマップで始まる。プラグインのキー割り当てが
# vi 側に入って消えないよう、読み込む前に切り替える
bindkey -e

# プラグインや設定の読み込み
[ -f ~/.zsh/zinit.zsh ] && source $HOME/.zsh/zinit.zsh
[ -f ~/.zsh/fzf.zsh ] && source $HOME/.zsh/fzf.zsh
[ -f ~/.zsh/history.zsh ] && source $HOME/.zsh/history.zsh

# コンプリートの設定
# 補完ファイルの検査と .zcompdump の作り直しは遅いので、1 日 1 回だけにする
autoload -U compinit
() {
  # 24 時間より古い .zcompdump があるときだけ作り直す (無ければ compinit -C が新しく作る)
  local -a stale=( ${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24) )
  if (( $#stale )); then
    compinit
  else
    compinit -C
  fi
}

# Ctrl-Dで閉じちゃうのをやめる
# stty は p10k の instant prompt 中だと端末がないと怒られるので、zsh のオプションで止める
setopt ignore_eof

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
