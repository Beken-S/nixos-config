{ config, pkgs, ... }: {
    imports = [
        ./fonts
        ./git.nix
        ./niri
        ./waybar
        ./alacritty
    ];
}
