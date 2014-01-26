#!/bin/sh

TARGET_DIR="$HOME/Library/Developer/Xcode/UserData"

[ ! -d "$TARGET_DIR/FontAndColorThemes" ] && \
    cd $TARGET_DIR && \
    git clone https://github.com/hdoria/xcode-themes.git FontAndColorThemes

