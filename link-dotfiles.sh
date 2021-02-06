#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# i3
mkdir -p ~/.i3
[ ! -f ~/.i3/config ] && ln -s $DIR/i3 ~/.i3/config

# i3status
[ ! -f ~/.i3status.conf ] && ln -s $DIR/i3status.conf ~/.i3status.conf

# neovim
mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/init.vim ] && ln -s $DIR/init.vim ~/.config/nvim/init.vim
[ ! -f ~/.vimrc ] && ln -s $DIR/init.vim ~/.vimrc

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
[ ! -f ~/bin/fpwd ] && ln -s $DIR/fpwd ~/bin/fpwd
[ ! -f ~/bin/chromecat ] && ln -s $DIR/chromecat ~/bin/chromecat
[ ! -f ~/bin/urlshort ] && ln -s $DIR/urlshort ~/bin/urlshort
[ ! -f ~/bin/hidecursor ] && ln -s $DIR/hidecursor ~/bin/hidecursor
[ ! -f ~/bin/swapnode ] && ln -s $DIR/swapnode ~/bin/swapnode

# tridactyl
[ ! -f ~/.tridactylrc ] && ln -s $DIR/tridactylrc ~/.tridactylrc

# vim-coc
mkdir -p ~/.config/nvim
[ ! -f ~/.config/nvim/coc-settings.json ] && ln -s $DIR/coc-settings.json ~/.config/nvim/coc-settings.json

# xinit
[ ! -f ~/.xinitrc ] && ln -s $DIR/xinitrc ~/.xinitrc

# aerc
mkdir -p ~/.config/aerc
[ ! -f ~/.config/aerc/aerc.conf ] && ln -s $DIR/aerc/aerc.conf ~/.config/aerc/aerc.conf
[ ! -f ~/.config/aerc/binds.conf ] && ln -s $DIR/aerc/binds.conf ~/.config/aerc/binds.conf
[ ! -f ~/.config/aerc/accounts.conf ] && ln -s $DIR/aerc/accounts.conf ~/.config/aerc/accounts.conf
chmod 600 ~/.config/aerc/accounts.conf

# mimi
mkdir -p ~/.config/mimi
[ ! -f ~/.config/mimi/mime.conf ] && ln -s $DIR/mime.conf ~/.config/mimi/mime.conf

# qutebrowser
mkdir -p ~/.config/qutebrowser
[ ! -f ~/.config/qutebrowser/config.py ] && ln -s $DIR/qutebrowser.py ~/.config/qutebrowser/config.py
mkdir -p ~/.qutebrowser-work/config
[ ! -f ~/.qutebrowser-work/config/config.py ] && ln -s $DIR/qutebrowser.py ~/.qutebrowser-work/config/config.py

# ncspot
mkdir -p ~/.config/ncspot
[ ! -f ~/.config/ncspot/config.toml ] && ln -s $DIR/ncspot.toml ~/.config/ncspot/config.toml

# py3status
mkdir -p ~/.config/py3status/modules
[ ! -f ~/.config/py3status/modules/git_status.py ] && ln -s $DIR/py3status/modules/git_status.py ~/.config/py3status/modules/git_status.py

# cargo
mkdir -p ~/.cargo
[ ! -f ~/.cargo/config ] && ln -s $DIR/cargo ~/.cargo/config

# fish
mkdir -p ~/.config/fish/completions
[ ! -f ~/.config/fish/config.fish ] && ln -s $DIR/config.fish ~/.config/fish/config.fish
[ ! -f ~/.config/fish/completions/pass.fish ] && ln -s $DIR/pass.fish ~/.config/fish/completions/pass.fish

# starship
mkdir -p ~/.config
[ ! -f ~/.config/starship.toml ] && ln -s $DIR/starship.toml ~/.config/starship.toml

exit 0
