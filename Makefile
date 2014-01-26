UNAME := $(shell uname)

all:
	echo "call 'make install' or 'make update'"

.PHONY: install update run_scripts gitsubmodules

install:
	./scripts/make_symboliclink.pl
	make run_scripts
	npm install
	./scripts/make_symboliclink.pl
	clear

update:
	./scripts/make_symboliclink.pl
	make run_scripts
	npm update
	./scripts/make_symboliclink.pl
	clear

run_scripts: 
ifeq ($(UNAME),Darwin)
	./scripts/install_homebrew4mac.sh
	./scripts/install_xcode_themes.sh
	./scripts/install_xcode_plugins.sh
	./scripts/install_keyremap4mac.sh
endif
	./scripts/install_vim_plugins.sh
	./scripts/install_vim_theme.sh
	./scripts/install_vim_dics.sh
	make gitsubmodules 
	./scripts/install_zsh_completions.sh

gitsubmodules:
	git submodule sync
	git submodule update --init
	git submodule foreach 'git checkout master; git pull; git submodule sync; git submodule update --init'

