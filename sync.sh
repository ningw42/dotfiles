#! /bin/bash

update_backup()
{
	cp ~/.zshrc .
	cp ~/.gitconfig .
	cp ~/.tmux.conf .
	cp ~/.spaceship.zsh .
	cp ~/.p10k.zsh .
	cp ~/.ideavimrc .

	# inside ~/.config
	cp ~/.config/alacritty/alacritty.yml .config/alacritty/alacritty.yml
	cp ~/.config/nvim/init.vim .config/nvim/init.vim
}

update_remote()
{
	REMOTE=$1
	scp ~/.zshrc $REMOTE:~/.zshrc
	scp ~/.p10k.zsh $REMOTE:~/.p10k.zsh
	scp ~/.gitconfig $REMOTE:~/.gitconfig
	scp ~/.config/nvim/init.vim $REMOTE:~/.config/nvim/init.vim
}

remotes=(kumiko mizore nozomi)

update_backup

for remote in ${remotes[@]}; do
	update_remote $remote
done

