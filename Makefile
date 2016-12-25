all:
	echo "call 'make install' or 'make update'"

.PHONY: install update

install:
	./scripts/install.sh
	clear

update:
	./scripts/update.sh
	clear
