#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
MODULE_DIR="$MAKE_WORK_DIR/.module/mergepbx"

cd "$MODULE_DIR"
python "$MODULE_DIR/build.py"
mkdir -p "$HOME/.local/bin"
rm -f "$HOME/.local/bin/mergepbx"
ln -s "$MODULE_DIR/mergepbx" "$HOME/.local/bin/mergepbx"
cd -

