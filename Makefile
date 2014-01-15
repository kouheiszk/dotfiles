UNAME := $(shell uname)

all:
	echo "call 'make install' or 'make update'"

.PHONY: install update _up vimproc perldict gitsubmodules completions \
	install_rbenv install_xcode_themes install_vim_neobunle install_vim_theme install_xcode_plugins install_keyremap4mac

install:
	./mksymboliclink
	make install_vim_neobunle
	vim -u ~/.vimrc +NeoBundleInstall +qa
	make install_vim_theme
	npm install
	make _up
	./mksymboliclink
	clear

update:
	./mksymboliclink
	vim -u ~/.vimrc +NeoBundleUpdate +qa
	vim -u ~/.vimrc +NeoBundleClean +qa
	make install_vim_theme
	npm update
	make _up
	./mksymboliclink
	clear

_up: perldict gitsubmodules completions install_keyremap4mac

perldict:
	cd .vim/dict && \
		wget --timestamping https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict

gitsubmodules:
	git submodule sync
	git submodule update --init
	git submodule foreach 'git checkout master; git pull; git submodule sync; git submodule update --init'

completions:
	mkdir -p .zsh.d/functions && \
		cd .zsh.d/functions && \
		curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.bash && \
		curl -o _git https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh && \
		curl -o _hub https://raw.github.com/github/hub/master/etc/hub.zsh_completion && \
		curl -o _brew https://raw.github.com/mxcl/homebrew/master/Library/Contributions/brew_zsh_completion.zsh

install_rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo 'export PATH="$$HOME/.rbenv/bin:$$PATH"' >> ~/.local_zshrc_init
	echo 'eval "$$(rbenv init -)"' >> ~/.local_zsh_profile

install_vim_neobunle:
	cd .vim/bundle && \
		rm -rf neobundle.vim && \
		git clone git://github.com/Shougo/neobundle.vim.git && \
		vim -u ~/.vimrc +NeoBundleInstall +qa && \
		vim -u ~/.vimrc +NeoBundleUpdate +qa && \
		vim -u ~/.vimrc +NeoBundleClean +qa

install_vim_theme:
	rm -rf .vim/colors/solarized.vim
	mkdir -p .vim/colors && \
		ln -s .modules/solarized/vim-colors-solarized/colors/solarized.vim .vim/colors

install_xcode_themes:
	cd ~/Library/Developer/Xcode/UserData && \
		git clone https://github.com/hdoria/xcode-themes.git FontAndColorThemes

install_xcode_plugins:
	mkdir -p ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins && \
		curl -L http://goo.gl/xfmmt | tar xv -C ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -
	git clone https://github.com/chendo/FuzzyAutocompletePlugin.git && \
		xcodebuild -project FuzzyAutocompletePlugin/FuzzyAutocomplete.xcodeproj build && \
		rm -rf FuzzyAutocompletePlugin

install_keyremap4mac:
	rm -f ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
	mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook && \
		ln -s ./Library/Application\ Support/KeyRemap4MacBook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml

