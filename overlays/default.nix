{ config, pkgs, ...}: {
    nixpkgs.overlays = [ alacritty-theme.overlays.default ];
}