dotfiles:
	stow --verbose --target=$$HOME --restow */

install:
	./install.sh

delete:
	stow --verbose --target=$$HOME --delete */
