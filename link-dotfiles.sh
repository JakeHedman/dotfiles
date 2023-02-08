#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# i3
mkdir -p ~/.i3
[ ! -L ~/.i3/config ] && ln -s $DIR/i3 ~/.i3/config

# i3status
[ ! -L ~/.i3status.conf ] && ln -s $DIR/i3status.conf ~/.i3status.conf

# neovim
mkdir -p ~/.config/nvim/spell
mkdir -p ~/.config/nvim/lua
[ ! -L ~/.config/nvim/init.vim ] && ln -s $DIR/init.vim ~/.config/nvim/init.vim
[ ! -L ~/.config/nvim/spell/en.utf-8.add ] && ln -s $DIR/en.utf-8.add ~/.config/nvim/spell/en.utf-8.add
[ ! -L ~/.vimrc ] && ln -s $DIR/init.vim ~/.vimrc
[ ! -L ~/.config/nvim/lua/config.lua ] && ln -s $DIR/neovim.lua ~/.config/nvim/lua/config.lua

# ssh
mkdir -p ~/.ssh/controlmasters
[ ! -L ~/.ssh/config ] && ln -s $DIR/ssh ~/.ssh/config
# termite
mkdir -p ~/.config/termite
[ ! -L ~/.config/termite/config ] && ln -s $DIR/termite ~/.config/termite/config

# rg
[ ! -L ~/.rgrc ] && ln -s $DIR/rgrc ~/.rgrc

# xonsh
[ ! -L ~/.xonshrc ] && ln -s $DIR/xonshrc ~/.xonshrc

# git
[ ! -L ~/.gitconfig ] && ln -s $DIR/gitconfig ~/.gitconfig

# bin dir
mkdir -p ~/bin
[ ! -L ~/bin/extract ] && ln -s $DIR/extract ~/bin/extract
[ ! -L ~/bin/fpwd ] && ln -s $DIR/fpwd ~/bin/fpwd
[ ! -L ~/bin/chromecat ] && ln -s $DIR/chromecat ~/bin/chromecat
[ ! -L ~/bin/urlshort ] && ln -s $DIR/urlshort ~/bin/urlshort
[ ! -L ~/bin/hidecursor ] && ln -s $DIR/hidecursor ~/bin/hidecursor
[ ! -L ~/bin/swapnode ] && ln -s $DIR/swapnode ~/bin/swapnode

# tridactyl
[ ! -L ~/.tridactylrc ] && ln -s $DIR/tridactylrc ~/.tridactylrc

# vim-coc
mkdir -p ~/.config/nvim
[ ! -L ~/.config/nvim/coc-settings.json ] && ln -s $DIR/coc-settings.json ~/.config/nvim/coc-settings.json

# xinit
[ ! -L ~/.xinitrc ] && ln -s $DIR/xinitrc ~/.xinitrc

# aerc
mkdir -p ~/.config/aerc
[ ! -L ~/.config/aerc/aerc.conf ] && ln -s $DIR/aerc/aerc.conf ~/.config/aerc/aerc.conf
[ ! -L ~/.config/aerc/binds.conf ] && ln -s $DIR/aerc/binds.conf ~/.config/aerc/binds.conf
[ ! -L ~/.config/aerc/accounts.conf ] && ln -s $DIR/aerc/accounts.conf ~/.config/aerc/accounts.conf
chmod 600 ~/.config/aerc/accounts.conf

# mimi
mkdir -p ~/.config/mimi
[ ! -L ~/.config/mimi/mime.conf ] && ln -s $DIR/mime.conf ~/.config/mimi/mime.conf

# qutebrowser
mkdir -p ~/.config/qutebrowser
[ ! -L ~/.config/qutebrowser/config.py ] && ln -s $DIR/qutebrowser.py ~/.config/qutebrowser/config.py
mkdir -p ~/.qutebrowser-work/config
[ ! -L ~/.qutebrowser-work/config/config.py ] && ln -s $DIR/qutebrowser.py ~/.qutebrowser-work/config/config.py

# ncspot
mkdir -p ~/.config/ncspot
[ ! -L ~/.config/ncspot/config.toml ] && ln -s $DIR/ncspot.toml ~/.config/ncspot/config.toml

# py3status
mkdir -p ~/.config/py3status/modules
[ ! -L ~/.config/py3status/modules/git_status.py ] && ln -s $DIR/py3status/modules/git_status.py ~/.config/py3status/modules/git_status.py

# cargo
mkdir -p ~/.cargo
[ ! -L ~/.cargo/config ] && ln -s $DIR/cargo ~/.cargo/config

# fish
mkdir -p ~/.config/fish/completions
[ ! -L ~/.config/fish/config.fish ] && ln -s $DIR/config.fish ~/.config/fish/config.fish
[ ! -L ~/.config/fish/completions/pass.fish ] && ln -s $DIR/pass.fish ~/.config/fish/completions/pass.fish

# starship
mkdir -p ~/.config
[ ! -L ~/.config/starship.toml ] && ln -s $DIR/starship.toml ~/.config/starship.toml

# mpv
mkdir -p ~/.config/mpv
[ ! -L ~/.config/mpv/mpv.conf ] && ln -s $DIR/mpv.conf ~/.config/mpv/mpv.conf

# oni2
mkdir -p ~/.config/oni2
[ ! -L ~/.config/oni2/configuration.json ] && ln -s $DIR/oni2/configuration.json ~/.config/oni2/configuration.json
[ ! -L ~/.config/oni2/keybindings.json ] && ln -s $DIR/oni2/keybindings.json ~/.config/oni2/keybindings.json

# Alacritty
mkdir -p ~/.config/alacritty
[ ! -L ~/.config/alacritty/alacritty.yml ] && ln -s $DIR/alacritty.yml ~/.config/alacritty/alacritty.yml

# Wallpaper
[ ! -L /etc/wallpaper.jpg ] && sudo ln -s $DIR/wallpaper.jpg /etc/wallpaper.jpg

exit 0
