#!/bin/sh

[ ! -d "/usr/local/.git" ] && ruby -e "$$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew upgrade
brew -v
brew doctor
# add repositories
brew tap homebrew/versions
brew tap homebrew/dupes
brew update
brew install gcc49
brew install wget node tmux git tig tree zsh ag cpanm npm mercurial vim coreutils rlwrap nkf hub gauche
# remove repositories
brew untap homebrew/versions
brew untap homebrew/dupes

