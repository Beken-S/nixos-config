{ pkgs, ... }:
{
  imports = [
    ./niri.nix
    ./gtk.nix
    ./notifications.nix
    ./lock.nix
    ./waybar.nix
    ./fuzzel.nix
    ./fonts.nix
    ./alacritty.nix
    ./shell.nix
    ./nvim
    ./yazi.nix
    ./git.nix
    ./browsers.nix
    ./media.nix
  ];

  home.packages = with pkgs; [
    duf
  ];
}
