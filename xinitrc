#!/bin/sh

# Font
xset +fp /usr/share/fonts/local
xset fp rehash

# Key repeat
xset r rate 250 30

# Screen saver off
xset s off -dpms

# Keyboard layout
setxkbmap se -option caps:escape

# Key bindings
xbindkeys

exec i3
