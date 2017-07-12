#!/bin/sh

curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh
sudo gem install update_xcode_plugins
update_xcode_plugins --unsign
find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add `defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID`
