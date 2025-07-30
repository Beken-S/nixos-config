{ config, pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./git.nix
        ./niri
        ./waybar
        ./alacritty
        ./nvim
    ];

    home.packages = with pkgs; [
        catppuccin-cursors.latteLight
    ];
}
