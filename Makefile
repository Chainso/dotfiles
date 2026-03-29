.PHONY: dotfiles install delete

dotfiles:
	stow --verbose --target=$$HOME --restow */

install:
	./install.sh

delete:
	stow --verbose --target=$$HOME --delete */

stow-%:
	stow --verbose --target=$$HOME --restow $(patsubst stow-%,%,$@)
