#!/usr/bin/sh

#Check the needed programs are installed
reqs="Install zsh, vim, wget, git, xclip and tmux"

if ! (command -v zsh && command -v tmux && command -v vim && command -v wget && command -v git && command -v xclip); then
	echo $reqs
	exit 1
fi

#Install oh-my-zsh

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ZSH=~/.oh-my-zsh

# Download spaceship theme
ZSH_CUSTOM=$ZSH/custom
mkdir $ZSH_CUSTOM
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


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
