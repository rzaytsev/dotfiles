all:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.emacs.d

	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml

	cp -r $(PWD)/vim ~/.vim
	vim +PlugUpgrade +PlugUpdate

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -rf $(HOME)/.vim
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.emacs.d

.PHONY: all
