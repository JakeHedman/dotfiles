#!/bin/sh

# Font
xset +fp /usr/share/fonts/local
xset fp rehash

# Key repeat
xset r rate 250 30

# Keyboard layout
setxkbmap se -option caps:super

exec i3
