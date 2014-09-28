#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# i3
mkdir ~/.i3
ln -s $DIR/i3/i3status.conf ~/.i3status.conf
ln -s $DIR/i3/config ~/.i3/config
ln -s $DIR/i3/bg.png ~/.i3/bg.png

# vim
ln -Ts $DIR/vim ~/.vim
ln -s $DIR/vim/vimrc ~/.vimrc

# ssh
mkdir ~/.ssh
ln -s $DIR/ssh/config ~/.ssh/config

# zsh
ln -Ts $DIR/zsh ~/.zsh
ln -s $DIR/zsh/zshrc ~/.zshrc

# tmux
ln -s $DIR/tmux/tmux.conf ~/.tmux.conf

# awesome
mkdir ~/.config
ln -Ts $DIR/awesome/ ~/.config/awesome

# urxvt
ln -s $DIR/Xdefaults ~/.Xdefaults

# Key bindings
ln -s $DIR/xbindkeysrc ~/.xbindkeysrc

# X
ln -s $DIR/xinitrc ~/.xinitrc
