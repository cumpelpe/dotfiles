#!/usr/bin/env sh
# File              : autostart.sh
# Author            : Petr Čumpelík <cumpepe1@fit.cvut.cz>
# Date              : 22.04.2021
# Last Modified Date: 22.04.2021
# Last Modified By  : Petr Čumpelík <cumpepe1@fit.cvut.cz>

## Autostart to be used with my xmonad config
pa-applet &
#setxkbmap -model pc104 -layout us,cz  -option 'grp:alt_shift_toggle'
setxkbmap -model pc87 -layout us,cz  -option 'grp:alt_shift_toggle' #TKL keyboard
picom -b
$HOME/Pictures/Wallpapers/randomWallpaper.sh
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --alpha 0 --height 16 &
