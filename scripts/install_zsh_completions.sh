#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
WORK_DIR="$MAKE_WORK_DIR/.zsh.d/functions"

mkdir -p "$WORK_DIR" && \
    cd "$WORK_DIR" && \
    curl -O https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh && \
    curl -o git-completion.zsh https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh && \
    curl -o hub-completion.zsh https://raw.github.com/github/hub/master/etc/hub.zsh_completion && \
    curl -o brew-completion.zsh https://raw.github.com/mxcl/homebrew/master/Library/Contributions/brew_zsh_completion.zsh

