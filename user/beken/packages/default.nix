{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./niri
        ./waybar
        ./alacritty
        ./nvim
    ];
}
