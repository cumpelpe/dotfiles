#!/usr/bin/env sh

## Autostart to be used with my xmonad config
pa-applet &
setxkbmap -model pc104 -layout us,cz  -option 'grp:alt_shift_toggle'
picom -b
$HOME/Pictures/Wallpapers/randomWallpaper.sh
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --alpha 0 --height 16 &
