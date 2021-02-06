# Super as mod
set $mod Mod4

# Workspaces
set $w0 0:doc
set $w1 1:vim
set $w2 2:exec
set $w3 3:web
set $w4 4:work
set $w5 5:irc

# Workspace keys
set $wk0 y
set $wk1 u
set $wk2 i
set $wk3 o
set $wk4 p
set $wk5 aring

# Font for window titles
font hack 11

# Super+mouse1/mouse2 to drag/resize floating windows
floating_modifier $mod

# Bindings
bindsym $mod+Return exec termite -d $(fpwd ~)
bindsym $mod+Shift+Return exec termite
bindsym $mod+m exec qutebrowser
bindsym $mod+BackSpace exec qutebrowser --basedir ~/.qutebrowser-work -s colors.statusbar.normal.bg '#002900'
bindsym $mod+n exec termite -d $(fpwd ~) -e "nvim"
bindsym $mod+h exec dmenu_run
bindsym $mod+comma exec scrcpy
bindsym $mod+Tab exec i3lock
bindsym $mod+f fullscreen
bindsym $mod+apostrophe kill
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+minus move scratchpad
bindsym $mod+period scratchpad show
bindsym XF86AudioMute exec pactl set-sink-mute 0 toggle
bindsym XF86AudioLowerVolume exec pactl set-sink-volume 0 -10%
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume 0 +10%
bindsym XF86MonBrightnessDown exec brightnessctl set 10%-
bindsym XF86MonBrightnessUp exec brightnessctl set +10%
bindsym XF86WLAN exec ~/dotfiles/toggle-wlan.sh
bindsym Print exec killall hidecursor; exec ttp -e
bindsym Shift+Print exec hidecursor &; exec ttp -d
bindsym $mod+odiaeresis focus right
bindsym $mod+a split v
bindsym $mod+s split h
bindsym $mod+z layout default
bindsym $mod+x layout stacking
bindsym $mod+c layout tabbed
bindsym $mod+g floating toggle
bindsym $mod+e focus parent
bindsym $mod+d focus child
bindsym $mod+r reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exit
bindsym $mod+$wk0 workspace $w0
bindsym $mod+$wk1 workspace $w1
bindsym $mod+$wk2 workspace $w2
bindsym $mod+$wk3 workspace $w3
bindsym $mod+$wk4 workspace $w4
bindsym $mod+$wk5 workspace $w5
bindsym $mod+Shift+$wk0 move container to workspace $w0
bindsym $mod+Shift+$wk1 move container to workspace $w1
bindsym $mod+Shift+$wk2 move container to workspace $w2
bindsym $mod+Shift+$wk3 move container to workspace $w3
bindsym $mod+Shift+$wk4 move container to workspace $w4
bindsym $mod+Shift+$wk5 move container to workspace $w5
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right
bindsym $mod+Control+Shift+j move workspace to output left
bindsym $mod+Control+Shift+k move workspace to output down
bindsym $mod+Control+Shift+l move workspace to output up
bindsym $mod+Control+Shift+odiaeresis move workspace to output right
bindsym $mod+shift+m resize shrink width 5 px or 5 ppt
bindsym $mod+shift+comma resize shrink height 5 px or 5 ppt
bindsym $mod+shift+period resize grow height 5 px or 5 ppt
bindsym $mod+shift+minus resize grow width 5 px or 5 ppt
bindsym Mod1+a exec adb shell "input keyevent 82 && input keyevent 66 && input keyevent 66"
bindsym Mod1+s exec scrot -so /dev/stdout | xclip -selection clipboard -t image/png
bindsym Mod1+c exec craption

# Super
#* ╭──────┬──────┬──────┬──────┬──────┬──────╮ ╭──────┬──────┬──────┬──────┬──────┬──────╮
#* │ lock │      │      │parent│reload│      │ │go doc│go vim│goexec│go web│gowork│go irc│
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │vsplit│hsplit│child │fullsc│float │ │dmenu │ go < │ go v │ go ^ │ go > │      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │deflt │sacked│tabbed│      │      │ │ nvim │ web  │scrcpy│scrpd+│scrpd-│      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │      │      │██████│      │      │ │ term │      │      │      │      │ kill │
#* ╰──────┴──────┴──────┴──────┴──────┴──────╯ ╰──────┴──────┴──────┴──────┴──────┴──────╯
#
# Super+Shift
#* ╭──────┬──────┬──────┬──────┬──────┬──────╮ ╭──────┬──────┬──────┬──────┬──────┬──────╮
#* │      │      │      │ exit │      │      │ │mv doc│mv vim│mvexec│mv web│mvwork│mv irc│
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │      │      │      │      │      │ │      │ mv < │ mv v │ mv ^ │ mv > │      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │██████│      │      │      │      │      │ │      │size <│size v│size ^│size >│      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │      │      │██████│      │      │ │      │      │      │      │      │      │
#* ╰──────┴──────┴──────┴──────┴──────┴──────╯ ╰──────┴──────┴──────┴──────┴──────┴──────╯
#
# Super+Shift+Control
#* ╭──────┬──────┬──────┬──────┬──────┬──────╮ ╭──────┬──────┬──────┬──────┬──────┬──────╮
#* │      │      │      │      │      │      │ │      │      │      │      │      │      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │      │      │      │      │      │      │ │      │mv wp<│mv wpv│mv wp^│mv wp>│      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │██████│      │      │      │      │      │ │      │      │      │      │      │      │
#* ├──────┼──────┼──────┼──────┼──────┼──────┤ ├──────┼──────┼──────┼──────┼──────┼──────┤
#* │██████│      │      │██████│      │      │ │      │      │      │      │      │      │
#* ╰──────┴──────┴──────┴──────┴──────┴──────╯ ╰──────┴──────┴──────┴──────┴──────┴──────╯

# Status bar
bar {
  status_command py3status
  # strip_workspace_numbers yes
}

# No borders
default_border none

# Except for terminal
for_window [class="termite"] border pixel 1

# No borders at edge of screen
hide_edge_borders both
