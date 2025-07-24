{ config, pkgs, ... }: {
    imports = [
      ./git.nix
      ./niri
      ./waybar
    ]
}
