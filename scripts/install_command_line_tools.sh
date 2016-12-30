#!/bin/sh

if type xcode-select >&- && xpath=$( xcode-select --print-path ) && [ -d "$xpath" ] && [ -x "$xpath" ]; then
   : # Command line tools are already installed
else
   sudo xcodebuild -license
   xcode-select --install
fi
