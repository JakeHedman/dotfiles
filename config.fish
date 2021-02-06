fish_vi_key_bindings
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/.gem/ruby/2.6.0/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/Manager/bin $PATH
eval (starship init fish)
set fish_greeting
set -gx EDITOR vim
set -gx BROWSER qutebrowser
set -gx RIPGREP_CONFIG_PATH ~/.rgrc
set -gx ANDROID_SDK_ROOT /opt/android-sdk
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true
alias gs="git status"
alias v="nvim"
alias vim="nvim"
# set -gx TERM xterm-256color
