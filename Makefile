install:
	ln -s ./vim $(HOME)/.vim
	ln -s ./vimrc $(HOME)/.vimrc
	ln -s ./zshrc $(HOME)/.zshrc
	ln -s ./tmux.conf $(HOME)/.tmux.conf
	ln -s ./oh-my-zsh $(HOME)/.oh-my-zsh
	ln -s ./zsh-custom $(HOME)/.zsh-custom

clean:
	rm -f $(HOME)/.vim
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.oh-my-zsh
	rm -f $(HOME)/.zsh-custom
