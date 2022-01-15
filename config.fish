fish_vi_key_bindings
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/.gem/ruby/2.6.0/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/Manager/bin $PATH
set -gx PATH ~/go/bin $PATH
set fish_greeting
set -gx EDITOR vim
set -gx BROWSER qutebrowser
set -gx RIPGREP_CONFIG_PATH ~/.rgrc
set -gx ANDROID_SDK_ROOT /opt/android-sdk
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true
set -gx TMPDIR /tmp
alias gs="git status"
alias v="nvim"
alias vi="/usr/bin/vim"
alias vim="nvim"
set -gx TERM xterm-256color

bind -M default j backward-char
bind -M visual j backward-char

bind k down-or-search
bind -M visual k down-line

bind -M visual l up-line
bind l up-or-search

bind -M default ö forward-char
bind -M visual ö forward-char

# opam configuration
source /home/jake/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

starship init fish | source
