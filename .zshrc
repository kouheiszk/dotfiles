# ~/.zsh.d/zshrc を読み込む
[ -f ~/.zsh.d/zshrc ] && source ~/.zsh.d/zshrc

# ~/.profile を読み込む
[ -f ~/.profile ] && source ~/.profile

# ~/.local_zsh_profile を読み込む
[ -f ~/.local_zsh_profile ] && source ~/.local_zsh_profile



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
