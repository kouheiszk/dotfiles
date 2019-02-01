# .profileを読み込む
[ -f "$HOME/.profile" ] && source $HOME/.profile

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kouhei/.anyenv/envs/ndenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kouhei/.anyenv/envs/ndenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kouhei/.anyenv/envs/ndenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kouhei/.anyenv/envs/ndenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh