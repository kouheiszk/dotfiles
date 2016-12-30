#!/bin/sh

TARGET_DIR="$HOME/Library/Developer/Xcode/UserData"

if [ ! -d "$TARGET_DIR/FontAndColorThemes" ]; then
    cd "$TARGET_DIR" && git clone https://github.com/hdoria/xcode-themes.git FontAndColorThemes
fi

