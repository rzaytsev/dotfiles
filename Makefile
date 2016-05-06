install:
	ln -s $(HOME)/.dotfiles/vim $(HOME)/.vim
	ln -s $(HOME)/.dotfiles/vimrc $(HOME)/.vimrc
	ln -s $(HOME)/.dotfiles/zshrc $(HOME)/.zshrc
	ln -s $(HOME)/.dotfiles/tmux.conf $(HOME)/.tmux.conf
	ln -s $(HOME)/.dotfiles/oh-my-zsh $(HOME)/.oh-my-zsh
	ln -s $(HOME)/.dotfiles/zsh-custom $(HOME)/.zsh-custom

clean:
	rm -rf $(HOME)/.vim
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.oh-my-zsh
	rm -f $(HOME)/.zsh-custom
