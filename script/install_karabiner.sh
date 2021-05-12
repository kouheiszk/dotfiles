#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
TARGET_DIR="$HOME/Library/Application Support/Karabiner"

rm -f "$TARGET_DIR/private.xml"
mkdir -p "$TARGET_DIR"
ln -s "$MAKE_WORK_DIR/Library/Application Support/Karabiner/private.xml" "$TARGET_DIR/private.xml"

