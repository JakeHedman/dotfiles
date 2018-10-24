#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Sway
mkdir -p ~/.sway
[ ! -f ~/.sway/config ] && ln -s $DIR/sway ~/.sway/config

# i3status
[ ! -f ~/.i3status.conf ] && ln -s $DIR/i3status.conf ~/.i3status.conf

# neovim
mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s $DIR/init.vim ~/.config/nvim/init.vim

# ssh
mkdir -p ~/.ssh/controlmasters
[ ! -f ~/.ssh/config ] && ln -s $DIR/ssh ~/.ssh/config
# termite
mkdir -p ~/.config/termite
[ ! -f ~/.config/termite/config ] && ln -s $DIR/termite ~/.config/termite/config

# rg
[ ! -f ~/.rgrc ] && ln -s $DIR/rgrc ~/.rgrc

# xonsh
[ ! -f ~/.xonshrc ] && ln -s $DIR/xonshrc ~/.xonshrc

# git
[ ! -f ~/.gitconfig ] && ln -s $DIR/gitconfig ~/.gitconfig

# bin dir
mkdir -p ~/bin
[ ! -f ~/bin/extract ] && ln -s $DIR/extract ~/bin/extract

exit 0
