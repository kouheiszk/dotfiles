#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
WORK_DIR="$MAKE_WORK_DIR/.bash.d/functions"

mkdir -p "$WORK_DIR" && \
    cd "$WORK_DIR" && \
    curl -O https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh && \
    curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

