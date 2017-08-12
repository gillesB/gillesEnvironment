#!/usr/bin/sh

#Check the needed programs are installed
reqs="Install zsh, vim, wget, git and tmux"

if ! (command -v zsh && command -v tmux && command -v vim && command -v wget && command -v git); then
	echo $reqs
	exit 1
fi

#Install oh-my-zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Download spaceship theme
wget https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh -O $ZSH_CUSTOM/themes/spaceship.zsh-theme

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Copy config files to home folder

cp .tmux.conf ~/
cp .vimrc ~/
cp .zshrc ~/

#Install vim plugins
vim +PluginInstall +qall
