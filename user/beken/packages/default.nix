{ config, pkgs, inputs, ... }: {
    imports = [
        inputs.catppuccin.homeManagerModules.catppuccin
        ./fonts.nix
        ./cursor.nix
        ./git.nix
        ./niri
        ./waybar
        ./alacritty
        ./nvim
    ];
}
