# プロンプトの設定
PROMPT="%B[%n@%m %~]%(!.#.$) %b"
PROMPT2="%B%_> %b"
SPROMPT="%Bcorrect: %R -> %r [nyae]? %b"

# ~/.profileを読み込む
[ -f ~/.profile ] && source ~/.profile

# ~/.zshrc_gitを読み込む
[ -f ~/.zshrc_git ] && source ~/.zshrc_git
