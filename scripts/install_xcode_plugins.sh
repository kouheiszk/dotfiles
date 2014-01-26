#!/bin/sh

PLUGIN_DIR="$HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins"
[ ! -d "$PLUGIN_DIR" ] && mkdir -p "$PLUGIN_DIR"

# Alcatraz
curl -L http://goo.gl/xfmmt | tar xv -C "$PLUGIN_DIR" -

# FuzzyAutocompletePlugin
[ ! -d "$PLUGIN_DIR/FuzzyAutocompletePlugin" ] && \
    git clone https://github.com/chendo/FuzzyAutocompletePlugin.git && \
    xcodebuild -project FuzzyAutocompletePlugin/FuzzyAutocomplete.xcodeproj build && \
    rm -rf FuzzyAutocompletePlugin

