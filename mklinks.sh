pwd=$(pwd)

# i3
mkdir ~/.i3
ln -s $pwd/i3/i3status.conf ~/.i3status.conf
ln -s $pwd/i3/config ~/.i3/config

# vim
ln -s $pwd/vim ~/.vim
ln -s $pwd/vim/vimrc ~/.vimrc

# ssh
mkdir ~/.ssh
ln -s $pwd/ssh/config ~/.ssh/config

# zsh
ln -s $pwd/zsh ~/.zsh
ln -s $pwd/zsh/zshrc ~/.zshrc

# tmux
ln -s $pwd/tmux/tmux.conf ~/.tmux.conf

# Awesome wm
mkdir ~/.config/
ln -s $pwd/awesome/ ~/.config/awesome

# urxvt
ln -s $pwd/Xresources ~/.Xresources
