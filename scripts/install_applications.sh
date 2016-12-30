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
docker \
docker-machine-nfs \
openssl \
md5sha1sum \
nmap \
curl \
wget \
hugo \
peco

# Install from brew cask
brew cask install \
google-chrome \
firefox \
google-japanese-ime \
iterm2 \
vagrant \
atom \
docker-toolbox \
appcleaner \
sequel-pro

# Remove outdated versions
brew cleanup
brew cask cleanup

# Install from mas
# NOTE: mdfind "kMDItemAppStoreHasReceipt=1" | while read a;do echo $(mdls -name kMDItemAppStoreAdamID -raw "$a") $(echo $a|awk '{n=split($0, tmp, "/")}{print tmp[n]}');done | sort -k2 | awk '{ print "mas install " $1 " # " $2 }'
mas install 405843582 # Alfred.app
mas install 406056744 # Evernote.app
mas install 682658836 # GarageBand.app
mas install 409183694 # Keynote.app
mas install 539883307 # LINE.app
mas install 409203825 # Numbers.app
mas install 409201541 # Pages.app
mas install 803453959 # Slack.app
mas install 425424353 # The
mas install 408981434 # iMovie.app