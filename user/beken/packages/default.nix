{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./git.nix
        ./niri
        ./waybar
        ./alacritty
        ./nvim
    ];
}
