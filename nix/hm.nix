{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;


 home.packages = with pkgs; [
      alacritty
      fish
      git
      teams
      steam
      gmrun
      dmenu
      python38Packages.mps-youtube
      mpd
      mpv
      mplayer
      jetbrains.idea-ultimate
     ];
}

