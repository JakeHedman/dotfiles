#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Sway
mkdir -p ~/.sway
[ ! -f ~/.sway/config ] && ln -s $DIR/sway ~/.sway/config

# i3status
[ ! -f ~/.i3status.conf ] && ln -s $DIR/i3status.conf ~/.i3status.conf

# vim
[ ! -d ~/.vim ] && ln -Ts $DIR/vim ~/.vim
[ ! -f ~/.vimrc ] && ln -s $DIR/vim/vimrc ~/.vimrc

# ssh
mkdir -p ~/.ssh
[ ! -f ~/.ssh/config ] && ln -s $DIR/ssh ~/.ssh/config

# termite
mkdir -p ~/.config/termite
[ ! -f ~/.config/termite/config ] && ln -s $DIR/termite ~/.config/termite/config

# rg
[ ! -f ~/.rgrc ] && ln -s $DIR/rgrc ~/.rgrc

# xonsh
[ ! -f ~/.xonshrc ] && ln -s $DIR/xonshrc ~/.xonshrc

exit 0
