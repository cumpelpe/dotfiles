#!/usr/bin/env fish

function fish_greeting
  set_color "bryellow"
  figlet (echo "$USER@$hostname") -ct -f "$HOME/dotfiles/figlet-fonts/larry3d.flf"
end
