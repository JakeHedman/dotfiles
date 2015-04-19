#!/bin/sh

#xbindkeys
#exec awesome
exec i3
xset +fp /usr/share/fonts/local
xset fp rehash
xset r rate 250 60
setxkbmap se -option caps:super
pulseaduio --start
