#!/bin/sh

# Install homebrew if necessary
if [ ! -x "$(which brew)" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew tap boxelly/homebrew-boxelly
brew tap caskroom/homebrew-cask
brew tap laurent22/massren
brew tap josegonzalez/homebrew-php
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
brew install makedepend

# Install libraries
brew install autoconf
brew install mcrypt
brew install libmemcached
brew install gd
brew install bison
brew install re2c
brew install pcre
brew install libvpx
brew install libpng
brew install jpeg
brew install fontconfig
brew install freetype
brew install libtiff
brew install libgd
brew install gettext
brew install yasm

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
brew install cpanm npm
brew install lua

# Install debugger for xcode
brew install chisel

# Install docker
brew install boot2docker 
brew install docker

# Install misc
brew install vim --enable-interp=python,python3,ruby --with-cscope --with-lua --HEAD
# brew install neovim --enable-interp=python,python3,ruby --with-cscope --with-lua --HEAD https://raw.github.com/neovim/neovim/master/neovim.rb
brew install coreutils 
brew install gauche

# Install database
brew install mysql

# Install massren
brew install massren

# Install homebrew-cask
brew install brew-cask

# Cask Update
brew cask cleanup

# Install browsers
#brew cask install google-chrome 
#brew cask install firefox 
#brew cask install fluid 
#brew cask install limechat

# Install multimedia player
#brew cask install mplayerx

# Install application utility
brew cask install appcleaner

# Install terminal
brew cask install iterm2

# Install virtualization softwares
#brew cask install vmware-fusion
#brew cask install virtualbox
#brew cask install vagrant

# Install documentation shareing
# brew cask install dropbox
# brew cask install evernote
# brew cask install google-drive

# Install visual editor
#brew cask install sublime-text

# Install misc
brew cask install karabiner
#brew cask install skitch
brew cask install caffeine
brew cask install alfred
brew cask install the-unarchiver
#brew cask install bettertouchtool
#brew cask install cheatsheet
#brew cask install slicy
#brew cask install github
#brew cask install kobito
#brew cask install slack

# Alfred link
brew cask alfred link

# Remove repositories
brew untap homebrew/versions
brew untap homebrew/dupes
brew untap homebrew/binary
brew untap boxelly/homebrew-boxelly
brew untap caskroom/homebrew-cask
brew untap laurent22/massren
brew untap josegonzalez/homebrew-php
# brew untap kouheiszk/Homebrew-mycask

# Remove outdated versions
brew cleanup

