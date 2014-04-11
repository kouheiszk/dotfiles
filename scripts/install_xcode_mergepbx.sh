#!/bin/sh

MAKE_WORK_DIR=$(cd "$(dirname $0)/../"; pwd)
MODULE_DIR="$MAKE_WORK_DIR/.module/mergepbx"

cd "$MODULE_DIR"
python "$MODULE_DIR/build.py"
mkdir -p "$HOME/.local/bin"
rm -f "$HOME/.local/bin/mergepbx.py"
ln -s "$MODULE_DIR/src/mergepbx.py" "$HOME/.local/bin/mergepbx.py"
cd -

