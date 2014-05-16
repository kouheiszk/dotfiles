#!/bin/sh

# Install homebrew if necessary
if [ ! -x "$(which brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

if command -v git &>/dev/null
then
    echo "git is already exists :)"
else
    sudo xcodebuild -license
    xcode-select --install
fi

# Add extra repositories
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap mix3/homebrew-ndenv
brew tap boxelly/homebrew-boxelly
brew tap phinze/homebrew-cask
# brew tap kouheiszk/Homebrew-mycask

# Update
brew update
brew upgrade
brew -v
brew doctor

# Install gdbm
brew install gdbm

# Install compilers
brew install apple-gcc42

# Install console utils
brew install mobile-shell 
brew install tmux 
brew install zsh 
brew install wget 
brew install ag
brew install rlwrap 
brew install nkf
brew install tree

# Install version control system
brew install git 
brew install tig 
brew install mercurial
brew install hub

# Install programing languages manager
brew install rbenv
brew install ruby-build
brew install ndenv --HEAD
brew install node-build --HEAD
brew install cpanm npm
brew install lua

# Install docker
brew install boot2docker 
brew install docker

# Install misc
brew install vim --with-cscope --with-lua --HEAD
brew install coreutils 
brew install gauche

# Install homebrew-cask
brew install brew-cask

# Install browsers
brew cask install google-chrome 
brew cask install firefox 
brew cask install fluid 
brew cask install limechat

# Install multimedia player
brew cask install mplayerx

# Install application utility
brew cask install appcleaner

# Install terminal
brew cask install iterm2

# Install virtualization softwares
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install vagrant

# Install documentation shareing
brew cask install dropbox
brew cask install evernote
brew cask install google-drive

# Install visual editor
brew cask install sublime-text

# Install misc
brew cask install keyremap4macbook
brew cask install skitch
brew cask install caffeine
brew cask install alfred
brew cask install the-unarchiver
brew cask install bettertouchtool
brew cask install cheatsheet
brew cask install slicy
brew cask install github
brew cask install kobito
brew cask install slack

# Alfred link
brew cask alfred link

# Remove repositories
brew untap homebrew/versions
brew untap homebrew/dupes
brew untap homebrew/binary
brew untap mix3/homebrew-ndenv
brew untap boxelly/homebrew-boxelly
brew untap phinze/homebrew-cask
# brew untap kouheiszk/Homebrew-mycask

# Remove outdated versions
brew cleanup

