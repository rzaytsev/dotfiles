all:
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.emacs.d

	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml


	# don't show last login message
	touch ~/.hushlogin

	curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o /usr/local/bin/diff-so-fancy
	chmod +x /usr/local/bin/diff-so-fancy


vim:
	cp -r $(PWD)/vim ~/.vim
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugUpgrade +PlugUpdate

clean:
	rm -rf $(HOME)/.vim
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.emacs.d

.PHONY: all
