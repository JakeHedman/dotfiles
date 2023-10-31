fish_vi_key_bindings
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/.gem/ruby/2.6.0/bin $PATH
set -gx PATH ~/.yarn/bin $PATH
set -gx PATH ~/Manager/bin $PATH
set -gx PATH ~/go/bin $PATH
set -gx PATH ~/.koyeb/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set fish_greeting
set -gx EDITOR hx
set -gx BROWSER qutebrowser
set -gx RIPGREP_CONFIG_PATH ~/.rgrc
#set -gx ANDROID_SDK_ROOT /opt/android-sdk
set -gx ANDROID_HOME /opt/android-sdk
set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true
set -gx TMPDIR /tmp
alias gs="git status"
alias vim="echo näe"
set -gx TERM xterm-256color
set -gx COLORTERM truecolor

# opam configuration
source /home/jake/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

starship init fish | source

source /home/jake/secrets/.fishprivate
