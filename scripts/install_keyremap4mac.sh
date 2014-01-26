#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
TARGET_DIR="$HOME/Library/Application Support/KeyRemap4MacBook"

rm -f "$TARGET_DIR/private.xml"
mkdir -p "$TARGET_DIR"
ln -s "$MAKE_WORK_DIR/Library/Application Support/KeyRemap4MacBook/private.xml" "$TARGET_DIR/private.xml"

