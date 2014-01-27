#!/bin/sh

# Install homebrew if necessary
if [ ! -x "$(which brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi;

brew upgrade
brew -v
brew doctor

# Add extra repositories
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap mix3/homebrew-ndenv
brew tap boxelly/homebrew-boxelly
brew tap phinze/homebrew-cask

# Update
brew update

# Install compilers
brew install apple-gcc42

# Install console utils
brew install mobile-shell tmux zsh wget ag rlwrap nkf tree

# Install version control system
brew install git tig mercurial hub

# Install misc
brew install vim coreutils gauche

# Install programing languages manager
brew install rbenv
brew install ruby-build
brew install ndenv --HEAD
brew install node-build --HEAD
brew install cpanm npm

# Install homebrew-cask
brew install brew-cask

# Install browsers
brew cask install google-chrome firefox fluid limechat

# Install multimedia player
brew cask install mplayerx

# Install application utility
brew cask install appcleaner

# Install terminal
brew cask install iterm2

# Install virtualization softwares
brew cask install vmware-fusion vagrant

# Install documentation shareing
brew cask install dropbox evernote google-drive

# Install visual editor
brew cask install sublime-text

# Install misc
brew cask install keyremap4macbook skitch caffeine alfred the-unarchiver bettertouchtool cheatsheet

# Remove repositories
brew untap homebrew/versions
brew untap homebrew/dupes
brew untap homebrew/binary
brew untap mix3/homebrew-ndenv
brew untap boxelly/homebrew-boxelly
brew untap phinze/homebrew-cask

# Remove outdated versions
brew cleanup
