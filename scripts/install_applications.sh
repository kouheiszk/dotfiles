#!/bin/sh

# Install homebrew if necessary
if [ ! -x "$(which brew)" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if command -v git &>/dev/null; then
  :
else
  sudo xcodebuild -license
  xcode-select --install
fi

# Update
brew upgrade
brew update
brew -v
brew doctor

# Install from brew
brew install \
zsh \
git \
tig \
hub \
doxygen \
chisel \
ag \
nkf \
tree \
tmux \
reattach-to-user-namespace \
mas \
ansible \
fswatch \
jq \
openssl \
md5sha1sum \
nmap \
curl \
wget \
hugo \
fzf \
gawk \
neovim/neovim/neovim \
fswatch unison \
yarn \
terraform \
laurent22/massren/massren

# Install from brew cask
brew cask install \
google-chrome \
google-drive \
firefox \
google-japanese-ime \
iterm2 \
atom \
docker \
docker-toolbox \
appcleaner \
sequel-pro \
dropbox \
1password \
shuttle \
sketch \
alfred \
kindle \
karabiner-elements \
pg-commander
# burn
# virtualbox

# Remove outdated versions
brew cleanup
brew cask cleanup

# Install from mas
# NOTE: mdfind "kMDItemAppStoreHasReceipt=1" | while read a;do echo $(mdls -name kMDItemAppStoreAdamID -raw "$a") $(echo $a|awk '{n=split($0, tmp, "/")}{print tmp[n]}');done | sort -k2 | awk '{ print "mas install " $1 " # " $0 }'
mas install 406056744 # 406056744 Evernote.app
mas install 682658836 # 682658836 GarageBand.app
mas install 409183694 # 409183694 Keynote.app
mas install 539883307 # 539883307 LINE.app
mas install 409203825 # 409203825 Numbers.app
mas install 409201541 # 409201541 Pages.app
mas install 803453959 # 803453959 Slack.app
mas install 425424353 # 425424353 The Unarchiver.app
mas install 408981434 # 408981434 iMovie.app
