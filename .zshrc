# プロンプトの設定
PROMPT="%B[%n@%m %~]%(!.#.$) %b"
PROMPT2="%B%_> %b"
SPROMPT="%Bcorrect: %R -> %r [nyae]? %b"

# ~/.profileを読み込む
[ -f ~/.profile ] && source ~/.profile

# .local_profileを読み込む
[ -f ~/.local_profile ] && source ~/.local_profile

# 補完候補を詰めて表示
setopt list_packed
 
# カッコの対応などを自動的に補完
setopt auto_param_keys
 
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
 
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
 
# 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
 
# {a-c} を a b c に展開する機能を使えるようにする
etopt brace_ccl
 
# =command を command のパス名に展開する
etopt equals
 
# ファイル名の展開で辞書順ではなく数値的にソート
etopt numeric_glob_sort
 
# --prefix=/usr などの = 以降も補完
etopt magic_equal_subst
 
# OSX濁点半濁点
setopt combining_chars
convert-utf8-mac () {
    BUFFER=`iconv -f utf8 -t utf8-mac <(<<<"$BUFFER")`
    zle -M 'Convert to UTF8-MAC'
}
zle -N convert-utf8-mac
bindkey '^X"' convert-utf8-mac

# no beep
setopt nolistbeep
setopt no_beep

# ~/.zshrc_gitを読み込む
[ -f ~/.zshrc_git ] && source ~/.zshrc_git

# ~/.local_zsh_profileを読み込む
[ -f ~/.local_zsh_profile ] && source ~/.local_zsh_profile


